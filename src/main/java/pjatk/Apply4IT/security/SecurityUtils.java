package pjatk.Apply4IT.security;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import pjatk.Apply4IT.model.User;

public class SecurityUtils {

    public static User getCurrentUser(){
        if(!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
            return (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        }
        return null;
    }
}
