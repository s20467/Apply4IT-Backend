package pjatk.Apply4IT.api.v1.dto;

import lombok.*;
import pjatk.Apply4IT.model.*;

import java.time.LocalDate;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class UserPatchDto {

    private String password;
    private String firstName;
    private String lastName;
    private LocalDate birthdate;
    private Address address;
    private String description;
}
