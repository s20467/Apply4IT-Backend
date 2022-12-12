package pjatk.Apply4IT.service;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import pjatk.Apply4IT.api.v1.dto.UserCreationDto;
import pjatk.Apply4IT.api.v1.dto.UserMinimalDto;
import pjatk.Apply4IT.api.v1.mapper.UserMapper;
import pjatk.Apply4IT.exception.ResourceConflictException;
import pjatk.Apply4IT.exception.UserWithGivenEmailNotFound;
import pjatk.Apply4IT.model.Authority;
import pjatk.Apply4IT.repository.AuthorityRepository;
import pjatk.Apply4IT.repository.UserRepository;
import pjatk.Apply4IT.model.User;

import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final AuthorityRepository authorityRepository;
    private final UserMapper userMapper;
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
}
