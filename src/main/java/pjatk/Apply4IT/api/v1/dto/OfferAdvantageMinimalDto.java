package pjatk.Apply4IT.api.v1.dto;

import lombok.*;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class OfferAdvantageMinimalDto {

    private String description;
    private Integer orderNumber;
}