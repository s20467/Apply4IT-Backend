package pjatk.Apply4IT.api.v1.dto;

import lombok.*;
import pjatk.Apply4IT.model.Address;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class OfferCreationRequestDto {

    private String title;
    private String description;
    private Address address;
    private Integer localizationId;
    private Integer companyId;
    private LocalDate closingDate;
    private Integer minSalaryPln;
    private Integer maxSalaryPln;
    private Boolean firstJobPossibility;
    private Boolean remotePossibility;
    private Set<ExpectationMinimalDto> expectations;
    private Set<OfferAdvantageMinimalDto> offerAdvantages;
    private Set<Integer> categoryIds;
}