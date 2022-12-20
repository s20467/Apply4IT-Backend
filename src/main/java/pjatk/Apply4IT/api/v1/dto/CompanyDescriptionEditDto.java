package pjatk.Apply4IT.api.v1.dto;

import lombok.*;

import javax.validation.constraints.Size;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CompanyDescriptionEditDto {

    @Size(min = 0, max = 2000)
    private String description;
}
