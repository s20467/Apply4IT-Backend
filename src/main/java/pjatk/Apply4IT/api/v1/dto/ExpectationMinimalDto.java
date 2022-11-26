package pjatk.Apply4IT.api.v1.dto;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ExpectationMinimalDto {

    private String description;
    private boolean required;
}