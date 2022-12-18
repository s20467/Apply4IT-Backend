package pjatk.Apply4IT.service;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.multipart.MultipartFile;
import pjatk.Apply4IT.api.v1.dto.*;
import pjatk.Apply4IT.model.User;

import java.util.List;

public interface UserService extends UserDetailsService {
    User getUserByEmail(String email);

    List<UserMinimalDto> getAllAdmins();

    void addAdmin(String userEmail);

    void deleteAdmin(String userEmail);

    Boolean checkIfEmailIsFree(String email);

    Integer createUser(UserCreationDto userCreationDto);

    UserFullDto getUserFullDtoByEmail(String email);

    void setUserImagePhoto(String userEmail, MultipartFile imageFile);

    void updateUser(String userEmail, UserPatchDto userPatchDto);

    void deleteByEmail(String userEmail);

    void deleteUserEducation(String userEmail, Integer educationId);

    void deleteUserExperience(String userEmail, Integer experienceId);

    EducationFullDto getUserEducation(String userEmail, Integer educationId);

    ExperienceFullDto getUserExperience(String userEmail, Integer experienceId);

    EducationFullDto createUserEducation(String userEmail, EducationFullDto educationFullDto);

    ExperienceFullDto createUserExperience(String userEmail, ExperienceFullDto experienceFullDto);

    EducationFullDto updateUserEducation(String userEmail, Integer educationId, EducationFullDto educationFullDto);

    ExperienceFullDto updateUserExperience(String userEmail, Integer experienceId, ExperienceFullDto experienceFullDto);
}
