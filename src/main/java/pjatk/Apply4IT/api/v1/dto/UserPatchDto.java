package pjatk.Apply4IT.api.v1.dto;

import lombok.*;
import pjatk.Apply4IT.model.*;
import pjatk.Apply4IT.validator.Birthdate;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDate;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class UserPatchDto {

    @Size(min = 4, max = 20)
    private String password;

    @Size(min = 2, max = 30)
    private String firstName;

    @Size(min = 2, max = 50)
    private String lastName;

    @Birthdate
    private LocalDate birthdate;

    @Valid
    private Address address;

    @Size(min = 0, max = 2000)
    private String description;
}
