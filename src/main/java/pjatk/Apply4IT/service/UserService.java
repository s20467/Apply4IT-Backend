package pjatk.Apply4IT.service;

import org.springframework.security.core.userdetails.UserDetailsService;
import pjatk.Apply4IT.model.User;

public interface UserService extends UserDetailsService {
    User getUserByEmail(String email);
}
