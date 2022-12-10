package pjatk.Apply4IT.service;

import org.springframework.security.core.userdetails.UserDetailsService;
import pjatk.Apply4IT.api.v1.dto.UserMinimalDto;
import pjatk.Apply4IT.model.User;

import java.util.List;

public interface UserService extends UserDetailsService {
    User getUserByEmail(String email);

    List<UserMinimalDto> getAllAdmins();

    void addAdmin(String userEmail);

    void deleteAdmin(String userEmail);
}
