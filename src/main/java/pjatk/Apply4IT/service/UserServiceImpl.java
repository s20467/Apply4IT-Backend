package pjatk.Apply4IT.service;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pjatk.Apply4IT.exception.UserWithGivenEmailNotFound;
import pjatk.Apply4IT.repository.UserRepository;
import pjatk.Apply4IT.model.User;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

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
}
