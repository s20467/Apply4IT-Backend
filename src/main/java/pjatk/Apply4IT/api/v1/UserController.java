package pjatk.Apply4IT.api.v1;

import com.auth0.jwt.exceptions.JWTVerificationException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import pjatk.Apply4IT.api.v1.dto.*;
import pjatk.Apply4IT.exception.JWTVerificationExceptionHandler;
import pjatk.Apply4IT.model.Address;
import pjatk.Apply4IT.model.User;
import pjatk.Apply4IT.security.JwtService;
import pjatk.Apply4IT.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import static pjatk.Apply4IT.security.SecurityUtils.getCurrentUser;

@RestController
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    private final JwtService jwtService;

    @PreAuthorize("permitAll()")
    @GetMapping("refresh-token")
    public void refreshToken(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String authorizationHeader = request.getHeader(HttpHeaders.AUTHORIZATION);
        if (authorizationHeader != null && authorizationHeader.startsWith("Bearer ")) {
            try {
                String token = authorizationHeader.substring("Bearer ".length());
                User user = jwtService.getUserFromRefreshToken(token);
                String new_access_token = jwtService.getStringTokenFromUser(user, (60L * 60 * 1000), request.getRequestURI(), true);
                Map<String, String> tokens = Map.of("access_token", new_access_token);
                response.setContentType(MediaType.APPLICATION_JSON_VALUE);
                new ObjectMapper().writeValue(response.getOutputStream(), tokens);
            } catch (JWTVerificationException exception) {
                JWTVerificationExceptionHandler.handleJWTVerificationException(exception, request, response);
            }
        } else {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "No refresh token attached in authorization header");
        }
    }

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("admins")
    public List<UserMinimalDto> getAdmins() {
        return userService.getAllAdmins();
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping("admins/{userEmail}")
    public void addAdmin(@PathVariable String userEmail) {
        userService.addAdmin(userEmail);
    }

    @PreAuthorize("hasRole('ADMIN')")
    @DeleteMapping("admins/{userEmail}")
    public void deleteAdmin(@PathVariable String userEmail) {
        userService.deleteAdmin(userEmail);
    }

    @PreAuthorize("permitAll()")
    @GetMapping("users/{email}/is-email-free")
    public Boolean checkIfEmailIsFree(@PathVariable String email) {
        return userService.checkIfEmailIsFree(email);
    }

    @PreAuthorize("permitAll()")
    @PostMapping("users")
    public Integer createUser(@RequestBody @Valid UserCreationDto userCreationDto) {
        return userService.createUser(userCreationDto);
    }

    @PreAuthorize("isFullyAuthenticated()")
    @GetMapping("users/current-user-details")
    public UserFullDto getCurrentUserDetails() {
        return userService.getUserFullDtoByEmail(getCurrentUser().getEmail());
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and (@customAuthenticationManager.isRecruiterForAnyUserApplicationTargetOffer(authentication, #email) or @customAuthenticationManager.isCurrentUser(authentication, #email)))")
    @GetMapping("users/{email}/user-details")
    public UserFullDto getUserDetails(@PathVariable String email) {
        return userService.getUserFullDtoByEmail(email);
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping(value = "users/{userEmail}/upload-photo", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public void uploadUserPhoto(@PathVariable String userEmail, @RequestParam("photo") MultipartFile image) {
        userService.setUserImagePhoto(userEmail, image);
    }

    @PreAuthorize("isFullyAuthenticated()")
    @PostMapping(value = "users/upload-photo", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public void uploadCurrentUserPhoto(@RequestParam("photo") MultipartFile image) {
        userService.setUserImagePhoto(getCurrentUser().getEmail(), image);
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isCurrentUser(authentication, #userEmail))")
    @PatchMapping("users/{userEmail}")
    public void updateUser(@PathVariable String userEmail, @RequestBody @Valid UserPatchDto userPatchDto) {
        userService.updateUser(userEmail, userPatchDto);
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isCurrentUser(authentication, #userEmail))")
    @DeleteMapping("users/{userEmail}")
    public void deleteUser(@PathVariable String userEmail) {
        userService.deleteByEmail(userEmail);
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isCurrentUser(authentication, #userEmail))")
    @DeleteMapping("users/{userEmail}/education/{educationId}")
    public void deleteUserEducation(@PathVariable String userEmail, @PathVariable Integer educationId) {
        userService.deleteUserEducation(userEmail, educationId);
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isCurrentUser(authentication, #userEmail))")
    @DeleteMapping("users/{userEmail}/experience/{experienceId}")
    public void deleteUserExperience(@PathVariable String userEmail, @PathVariable Integer experienceId) {
        userService.deleteUserExperience(userEmail, experienceId);
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isCurrentUser(authentication, #userEmail))")
    @GetMapping("users/{userEmail}/education/{educationId}")
    public EducationFullDto getUserEducation(@PathVariable String userEmail, @PathVariable Integer educationId) {
        return userService.getUserEducation(userEmail, educationId);
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isCurrentUser(authentication, #userEmail))")
    @GetMapping("users/{userEmail}/experience/{experienceId}")
    public ExperienceFullDto getUserExperience(@PathVariable String userEmail, @PathVariable Integer experienceId) {
        return userService.getUserExperience(userEmail, experienceId);
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isCurrentUser(authentication, #userEmail))")
    @PostMapping("users/{userEmail}/education")
    public EducationFullDto createUserEducation(@PathVariable String userEmail, @RequestBody @Valid EducationFullDto educationFullDto) {
        return userService.createUserEducation(userEmail, educationFullDto);
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isCurrentUser(authentication, #userEmail))")
    @PostMapping("users/{userEmail}/experience")
    public ExperienceFullDto createUserExperience(@PathVariable String userEmail, @RequestBody @Valid ExperienceFullDto experienceFullDto) {
        return userService.createUserExperience(userEmail, experienceFullDto);
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isCurrentUser(authentication, #userEmail))")
    @PutMapping("users/{userEmail}/education/{educationId}")
    public EducationFullDto updateUserEducation(@PathVariable String userEmail, @PathVariable Integer educationId, @RequestBody @Valid EducationFullDto educationFullDto) {
        return userService.updateUserEducation(userEmail, educationId, educationFullDto);
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isCurrentUser(authentication, #userEmail))")
    @PutMapping("users/{userEmail}/experience/{experienceId}")
    public ExperienceFullDto updateUserExperience(@PathVariable String userEmail, @PathVariable Integer experienceId, @RequestBody @Valid ExperienceFullDto experienceFullDto) {
        return userService.updateUserExperience(userEmail, experienceId, experienceFullDto);
    }

}
