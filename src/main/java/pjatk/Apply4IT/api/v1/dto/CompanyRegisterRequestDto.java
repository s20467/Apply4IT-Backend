package pjatk.Apply4IT.api.v1.dto;

import lombok.*;
import pjatk.Apply4IT.model.Address;

import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CompanyRegisterRequestDto {

    @NotNull
    @Size(min = 5, max = 50)
    private String name;

    @Size(min = 0, max = 2000)
    private String description;

    @Valid
    private Address address;

    @NotNull
    @Email
    @Size(min = 3, max = 40)
    private String contactEmail;
}