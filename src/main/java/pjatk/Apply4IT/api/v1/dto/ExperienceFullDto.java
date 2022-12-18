package pjatk.Apply4IT.api.v1.dto;

import lombok.*;

import java.time.LocalDate;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ExperienceFullDto {

    private Integer id;
    private LocalDate startDate;
    private LocalDate endDate;
    private String job;
    private String companyName;
    private String description;
    private boolean stillWorking;
}