package pjatk.Apply4IT.api.v1.dto;

import lombok.*;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class OfferAdvantageMinimalDto {

    @NotNull
    @Size(min = 0, max = 1000)
    private String description;

    @NotNull
    private Integer orderNumber;
}