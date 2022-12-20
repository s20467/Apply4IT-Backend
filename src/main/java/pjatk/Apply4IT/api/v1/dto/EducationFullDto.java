package pjatk.Apply4IT.api.v1.dto;

import lombok.*;
import pjatk.Apply4IT.validator.ValidStartDateEndDate;
import pjatk.Apply4IT.validator.ValidStillStudying;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;
import java.time.LocalDate;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ValidStartDateEndDate
@ValidStillStudying
public class EducationFullDto implements Period {

    private Integer id;

    @NotNull
    @Past
    private LocalDate startDate;

    @Past
    private LocalDate endDate;

    @NotNull
    private Boolean stillStudying;

    @NotNull
    @Size(min = 2, max = 50)
    private String universityName;

    @NotNull
    @Size(min = 2, max = 50)
    private String major;

    @Size(min = 2, max = 50)
    private String specialization;
}