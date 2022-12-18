package pjatk.Apply4IT.api.v1.dto;

import lombok.*;
import pjatk.Apply4IT.model.*;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class UserFullDto {

    private Integer id;
    private String firstName;
    private String lastName;
    private LocalDate birthdate;
    private String email;
    private Address address;
    private String photo;
    private String description;
    private Set<EducationFullDto> educations = new HashSet<>();
    private Set<ExperienceFullDto> experiences = new HashSet<>();
}