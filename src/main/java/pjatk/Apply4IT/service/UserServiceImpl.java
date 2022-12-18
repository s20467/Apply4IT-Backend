package pjatk.Apply4IT.service;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import pjatk.Apply4IT.api.v1.dto.*;
import pjatk.Apply4IT.api.v1.mapper.EducationMapper;
import pjatk.Apply4IT.api.v1.mapper.ExperienceMapper;
import pjatk.Apply4IT.api.v1.mapper.UserMapper;
import pjatk.Apply4IT.exception.FileUploadException;
import pjatk.Apply4IT.exception.ResourceConflictException;
import pjatk.Apply4IT.exception.ResourceNotFoundException;
import pjatk.Apply4IT.exception.UserWithGivenEmailNotFound;
import pjatk.Apply4IT.model.*;
import pjatk.Apply4IT.repository.AuthorityRepository;
import pjatk.Apply4IT.repository.EducationRepository;
import pjatk.Apply4IT.repository.ExperienceRepository;
import pjatk.Apply4IT.repository.UserRepository;

import java.util.Base64;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final EducationRepository educationRepository;
    private final ExperienceRepository experienceRepository;
    private final OfferService offerService;
    private final CompanyService companyService;
    private final AuthorityRepository authorityRepository;
    private final UserMapper userMapper;
    private final EducationMapper educationMapper;
    private final ExperienceMapper experienceMapper;
    private final PasswordEncoder passwordEncoder;
    private final String ADMIN_AUTHORITY_NAME = "ROLE_ADMIN";

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        try {
            return getUserByEmail(username);
        }
        catch(UserWithGivenEmailNotFound exc) {
            throw new UsernameNotFoundException(exc.getMessage());
        }
    }


    @Override
    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email).orElseThrow(
                () -> new UserWithGivenEmailNotFound("User with email: " + email + " not found")
        );
    }

    @Override
    public List<UserMinimalDto> getAllAdmins() {
        return authorityRepository.getByName(ADMIN_AUTHORITY_NAME)
                .getUsers()
                .stream()
                .map(userMapper::userToUserMinimalDto)
                .sorted(Comparator.comparingInt(UserMinimalDto::getId))
                .collect(Collectors.toList());
    }

    @Override
    public void addAdmin(String userEmail) {
        User foundUser = userRepository.findByEmail(userEmail).orElseThrow(
                () -> new UserWithGivenEmailNotFound("User with email: " + userEmail + " not found")
        );
        Authority adminAuthority = authorityRepository.getByName(ADMIN_AUTHORITY_NAME);
        boolean isAlreadyAdmin = adminAuthority.getUsers().stream().anyMatch(user -> Objects.equals(user.getEmail(), foundUser.getEmail()));
        if(isAlreadyAdmin) {
            throw new ResourceConflictException("User with email: " + userEmail + " is already admin");
        }
        adminAuthority.getUsers().add(foundUser);
        foundUser.getDomainAuthorities().add(adminAuthority);
        userRepository.save(foundUser);
    }

    @Override
    public void deleteAdmin(String userEmail) {
        User foundUser = userRepository.findByEmail(userEmail).orElseThrow(
                () -> new UserWithGivenEmailNotFound("User with email: " + userEmail + " not found")
        );
        Authority adminAuthority = authorityRepository.getByName(ADMIN_AUTHORITY_NAME);
        adminAuthority.setUsers(
                adminAuthority.getUsers().stream()
                        .filter(user -> !user.getEmail().equals(foundUser.getEmail()))
                        .collect(Collectors.toSet())
        );
        foundUser.setAuthorities(
                foundUser.getDomainAuthorities().stream()
                        .filter(authority -> !authority.getName().equals(adminAuthority.getName()))
                        .collect(Collectors.toSet())
        );
        userRepository.save(foundUser);
        authorityRepository.save(adminAuthority);
    }

    @Override
    public Boolean checkIfEmailIsFree(String email) {
        return userRepository.findByEmail(email).isEmpty();
    }

    @Override
    public Integer createUser(UserCreationDto userCreationDto) {
        if(userRepository.findByEmail(userCreationDto.getEmail()).isPresent()) {
            throw new ResourceConflictException("User with email: " + userCreationDto.getEmail() + " already exists");
        }
        User newUser = userMapper.userCreationDtoToUser(userCreationDto);
        newUser.setPassword(passwordEncoder.encode(userCreationDto.getPassword()));
        return userRepository.save(newUser).getId();
    }

    @Override
    public UserFullDto getUserFullDtoByEmail(String email) {
        return userMapper.userToUserFullDto(userRepository.getWithEducationsAndExperiencesByEmail(email));
    }

    @Override
    public void setUserImagePhoto(String userEmail, MultipartFile imageFile) {
        User foundUser = userRepository.findByEmail(userEmail).orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " not found")
        );
        try {
            String encodedString = Base64.getEncoder().encodeToString(imageFile.getBytes());
            foundUser.setPhoto(encodedString);
            userRepository.save(foundUser);
        }
        catch(Exception exc) {
            throw new FileUploadException("Uploading image failed with given message: " + exc.getMessage());
        }
    }

    @Override
    public void updateUser(String userEmail, UserPatchDto userPatchDto) {
        User foundUser = userRepository.findByEmail(userEmail).orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " not found")
        );
        foundUser.setPassword(userPatchDto.getPassword() == null ? foundUser.getPassword() : passwordEncoder.encode(userPatchDto.getPassword()));
        foundUser.setFirstName(userPatchDto.getFirstName() == null ? foundUser.getFirstName() : userPatchDto.getFirstName());
        foundUser.setLastName(userPatchDto.getLastName() == null ? foundUser.getLastName() : userPatchDto.getLastName());
        foundUser.setBirthdate(userPatchDto.getBirthdate() == null ? foundUser.getBirthdate() : userPatchDto.getBirthdate());
        foundUser.setAddress(userPatchDto.getAddress() == null ? foundUser.getAddress() : userPatchDto.getAddress());
        foundUser.setDescription(userPatchDto.getDescription() == null ? foundUser.getDescription() : userPatchDto.getDescription());
        userRepository.save(foundUser);
    }

    @Override
    @Transactional
    public void deleteByEmail(String userEmail) {
        User foundUser = userRepository.findByEmail(userEmail).orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " not found")
        );
        foundUser.getCreatedOffers().forEach(offer -> offerService.deleteById(offer.getId()));
        foundUser.getOwnedCompanies().forEach(company -> companyService.deleteById(company.getId()));
        foundUser.getIsRecruiterFor().forEach(company -> company.getRecruiters().remove(foundUser));
        foundUser.getDomainAuthorities().forEach(authority -> authority.getUsers().remove(foundUser));
        foundUser.getSavedOffers().forEach(offer -> offer.getUsersWhoSaved().remove(foundUser));
        userRepository.delete(foundUser);
    }

    @Override
    public void deleteUserEducation(String userEmail, Integer educationId) {
        User foundUser = userRepository.findWithEducationsAndExperiencesByEmail(userEmail).orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " not found")
        );
        Education educationToDelete = foundUser.getEducations().stream().filter(
                education -> education.getId().equals(educationId)
        ).findFirst().orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " does not have education with id: " + educationId)
        );
        foundUser.getEducations().remove(educationToDelete);
        educationRepository.delete(educationToDelete);
    }

    @Override
    public void deleteUserExperience(String userEmail, Integer experienceId) {
        User foundUser = userRepository.findWithEducationsAndExperiencesByEmail(userEmail).orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " not found")
        );
        Experience experienceToDelete = foundUser.getExperiences().stream().filter(
                experience -> experience.getId().equals(experienceId)
        ).findFirst().orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " does not have experience with id: " + experienceId)
        );
        foundUser.getExperiences().remove(experienceToDelete);
        experienceRepository.delete(experienceToDelete);
    }

    @Override
    public EducationFullDto getUserEducation(String userEmail, Integer educationId) {
        User foundUser = userRepository.findWithEducationsAndExperiencesByEmail(userEmail).orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " not found")
        );
        Education foundEducation = foundUser.getEducations().stream().filter(
                education -> education.getId().equals(educationId)
        ).findFirst().orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " does not have education with id: " + educationId)
        );
        return educationMapper.educationToEducationFullDto(foundEducation);
    }

    @Override
    public ExperienceFullDto getUserExperience(String userEmail, Integer experienceId) {
        User foundUser = userRepository.findWithEducationsAndExperiencesByEmail(userEmail).orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " not found")
        );
        Experience foundExperience = foundUser.getExperiences().stream().filter(
                experience -> experience.getId().equals(experienceId)
        ).findFirst().orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " does not have experience with id: " + experienceId)
        );
        return experienceMapper.experienceToExperienceFullDto(foundExperience);
    }

    @Override
    public EducationFullDto createUserEducation(String userEmail, EducationFullDto educationFullDto) {
        User foundUser = userRepository.findWithEducationsAndExperiencesByEmail(userEmail).orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " not found")
        );
        Education newEducation = educationMapper.educationFullDtoToEducation(educationFullDto);
        foundUser.getEducations().add(newEducation);
        newEducation.setUser(foundUser);
        return educationMapper.educationToEducationFullDto(educationRepository.save(newEducation));
    }

    @Override
    public ExperienceFullDto createUserExperience(String userEmail, ExperienceFullDto experienceFullDto) {
        User foundUser = userRepository.findWithEducationsAndExperiencesByEmail(userEmail).orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " not found")
        );
        Experience newExperience = experienceMapper.experienceFullDtoToExperience(experienceFullDto);
        foundUser.getExperiences().add(newExperience);
        newExperience.setUser(foundUser);
        return experienceMapper.experienceToExperienceFullDto(experienceRepository.save(newExperience));
    }

    @Override
    public EducationFullDto updateUserEducation(String userEmail, Integer educationId, EducationFullDto educationFullDto) {
        User foundUser = userRepository.findWithEducationsAndExperiencesByEmail(userEmail).orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " not found")
        );
        Education foundEducation = foundUser.getEducations().stream().filter(
                education -> education.getId().equals(educationId)
        ).findFirst().orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " does not have education with id: " + educationId)
        );
        foundEducation.setMajor(educationFullDto.getMajor());
        foundEducation.setSpecialization(educationFullDto.getSpecialization());
        foundEducation.setUniversityName(educationFullDto.getUniversityName());
        foundEducation.setStartDate(educationFullDto.getStartDate());
        foundEducation.setEndDate(educationFullDto.getEndDate());
        foundEducation.setStillStudying(educationFullDto.getStillStudying());
        return educationMapper.educationToEducationFullDto(educationRepository.save(foundEducation));
    }

    @Override
    public ExperienceFullDto updateUserExperience(String userEmail, Integer experienceId, ExperienceFullDto experienceFullDto) {
        User foundUser = userRepository.findWithEducationsAndExperiencesByEmail(userEmail).orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " not found")
        );
        Experience foundExperience = foundUser.getExperiences().stream().filter(
                experience -> experience.getId().equals(experienceId)
        ).findFirst().orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " does not have experience with id: " + experienceId)
        );
        foundExperience.setJob(experienceFullDto.getJob());
        foundExperience.setCompanyName(experienceFullDto.getCompanyName());
        foundExperience.setDescription(experienceFullDto.getDescription());
        foundExperience.setStartDate(experienceFullDto.getStartDate());
        foundExperience.setEndDate(experienceFullDto.getEndDate());
        foundExperience.setStillWorking(experienceFullDto.isStillWorking());
        return experienceMapper.experienceToExperienceFullDto(experienceRepository.save(foundExperience));
    }

}