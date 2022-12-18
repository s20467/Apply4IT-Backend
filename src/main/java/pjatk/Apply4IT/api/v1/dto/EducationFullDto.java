package pjatk.Apply4IT.api.v1.dto;

import lombok.*;

import java.time.LocalDate;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class EducationFullDto {

    private Integer id;
    private LocalDate startDate;
    private LocalDate endDate;
    private Boolean stillStudying;
    private String universityName;
    private String major;
    private String specialization;
}