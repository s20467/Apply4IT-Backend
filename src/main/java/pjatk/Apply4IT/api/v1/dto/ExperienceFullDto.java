package pjatk.Apply4IT.api.v1.dto;

import lombok.*;
import pjatk.Apply4IT.validator.ValidStartDateEndDate;
import pjatk.Apply4IT.validator.ValidStillStudying;
import pjatk.Apply4IT.validator.ValidStillWorking;

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
@ValidStillWorking
public class ExperienceFullDto implements Period{

    private Integer id;

    @NotNull
    @Past
    private LocalDate startDate;

    @Past
    private LocalDate endDate;

    @NotNull
    @Size(min = 2, max = 50)
    private String job;

    @NotNull
    @Size(min = 2, max = 50)
    private String companyName;

    @Size(min = 0, max = 2000)
    private String description;

    @NotNull
    private boolean stillWorking;
}