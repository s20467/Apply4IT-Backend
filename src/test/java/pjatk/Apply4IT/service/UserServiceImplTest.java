package pjatk.Apply4IT.service;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Captor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;
import pjatk.Apply4IT.api.v1.dto.UserPatchDto;
import pjatk.Apply4IT.api.v1.mapper.EducationMapper;
import pjatk.Apply4IT.api.v1.mapper.ExperienceMapper;
import pjatk.Apply4IT.api.v1.mapper.UserMapper;
import pjatk.Apply4IT.exception.ResourceConflictException;
import pjatk.Apply4IT.model.Authority;
import pjatk.Apply4IT.model.User;
import pjatk.Apply4IT.repository.AuthorityRepository;
import pjatk.Apply4IT.repository.EducationRepository;
import pjatk.Apply4IT.repository.ExperienceRepository;
import pjatk.Apply4IT.repository.UserRepository;

import java.time.LocalDate;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class UserServiceImplTest {

    @Mock private UserRepository userRepository;
    @Mock private EducationRepository educationRepository;
    @Mock private ExperienceRepository experienceRepository;
    @Mock private OfferService offerService;
    @Mock private CompanyService companyService;
    @Mock private AuthorityRepository authorityRepository;
    @Mock private UserMapper userMapper;
    @Mock private EducationMapper educationMapper;
    @Mock private ExperienceMapper experienceMapper;
    @Mock private PasswordEncoder passwordEncoder;
    
    @InjectMocks UserServiceImpl userService;

    @Captor ArgumentCaptor<User> userCaptor;

    private final String ADMIN_AUTHORITY_NAME = "ROLE_ADMIN";

    @Test
    void addAdminSuccessful() {
        //given
        String userEmail = "user@email";
        User user = User.builder().email(userEmail).build();
        Authority adminAuthority = Authority.builder().name(ADMIN_AUTHORITY_NAME).build();

        when(userRepository.findByEmail(userEmail)).thenReturn(Optional.of(user));
        when(authorityRepository.getByName(ADMIN_AUTHORITY_NAME)).thenReturn(adminAuthority);

        //when
        userService.addAdmin(userEmail);

        //then
        assertThat(user.getDomainAuthorities()).hasSize(1);
        assertThat(user.getDomainAuthorities()).contains(adminAuthority);
        assertThat(adminAuthority.getUsers()).hasSize(1);
        assertThat(adminAuthority.getUsers()).contains(user);
    }

    @Test
    void addAdminAlreadyAdmin() {
        //given
        String userEmail = "user@email";
        User user = User.builder().email(userEmail).build();
        Authority adminAuthority = Authority.builder().name(ADMIN_AUTHORITY_NAME).build();
        user.getDomainAuthorities().add(adminAuthority);
        adminAuthority.getUsers().add(user);

        when(userRepository.findByEmail(userEmail)).thenReturn(Optional.of(user));
        when(authorityRepository.getByName(ADMIN_AUTHORITY_NAME)).thenReturn(adminAuthority);

        //when
        assertThrows(
                ResourceConflictException.class,
                () -> userService.addAdmin(userEmail)
        );
    }

    @Test
    void deleteAdminSuccessful() {
        //given
        String userEmail = "user@email";
        User user = User.builder().email(userEmail).build();
        Authority adminAuthority = Authority.builder().name(ADMIN_AUTHORITY_NAME).build();
        user.getDomainAuthorities().add(adminAuthority);
        adminAuthority.getUsers().add(user);

        when(userRepository.findByEmail(userEmail)).thenReturn(Optional.of(user));
        when(authorityRepository.getByName(ADMIN_AUTHORITY_NAME)).thenReturn(adminAuthority);

        //when
        userService.deleteAdmin(userEmail);

        //then
        assertThat(user.getDomainAuthorities()).hasSize(0);
        assertThat(user.getDomainAuthorities()).doesNotContain(adminAuthority);
        assertThat(adminAuthority.getUsers()).hasSize(0);
        assertThat(adminAuthority.getUsers()).doesNotContain(user);
    }

    @Test
    void checkIfEmailIsFreeSuccessful() {
        //given
        String userEmail = "user@email";
        when(userRepository.findByEmail(userEmail)).thenReturn(Optional.empty());

        //when
        boolean result = userService.checkIfEmailIsFree(userEmail);

        //then
        assertTrue(result);
    }

    @Test
    void checkIfEmailIsFreeUserExists() {
        //given
        String userEmail = "user@email";
        User user = User.builder().email(userEmail).build();
        when(userRepository.findByEmail(userEmail)).thenReturn(Optional.of(user));

        //when
        boolean result = userService.checkIfEmailIsFree(userEmail);

        //then
        assertFalse(result);
    }

    @Test
    void updateUserSuccessful() {
        //given
        String userEmail = "user@email";
        User user = User.builder().email(userEmail).build();
        UserPatchDto userPatchDto = UserPatchDto.builder()
                .description("description")
                .birthdate(LocalDate.now().plusDays(1))
                .firstName("first name")
                .firstName("last name")
                .build();
        when(userRepository.findByEmail(userEmail)).thenReturn(Optional.of(user));

        //when
        userService.updateUser(userEmail, userPatchDto);

        //then
        verify(userRepository, times(1)).findByEmail(userEmail);
        verify(userRepository, times(1)).save(userCaptor.capture());
        User savedUser = userCaptor.getValue();
        assertEquals(userPatchDto.getDescription(), savedUser.getDescription());
        assertEquals(userPatchDto.getBirthdate(), savedUser.getBirthdate());
        assertEquals(userPatchDto.getFirstName(), savedUser.getFirstName());
        assertEquals(userPatchDto.getLastName(), savedUser.getLastName());
    }
}