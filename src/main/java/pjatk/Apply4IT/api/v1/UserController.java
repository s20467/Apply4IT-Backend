package pjatk.Apply4IT.api.v1;

import com.auth0.jwt.exceptions.JWTVerificationException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import pjatk.Apply4IT.api.v1.dto.UserCreationDto;
import pjatk.Apply4IT.api.v1.dto.UserMinimalDto;
import pjatk.Apply4IT.exception.JWTVerificationExceptionHandler;
import pjatk.Apply4IT.model.User;
import pjatk.Apply4IT.security.JwtService;
import pjatk.Apply4IT.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

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
    public Integer createUser(@RequestBody UserCreationDto userCreationDto) {
        return userService.createUser(userCreationDto);
    }
}
