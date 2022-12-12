package pjatk.Apply4IT.api.v1.dto;

import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import pjatk.Apply4IT.model.*;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class UserCreationDto {

    private String password;
    private String firstName;
    private String lastName;
    private LocalDate birthdate;
    private String email;
    private Address address;

}