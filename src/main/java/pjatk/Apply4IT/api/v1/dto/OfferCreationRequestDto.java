package pjatk.Apply4IT.api.v1.dto;

import lombok.*;
import pjatk.Apply4IT.model.Address;
import pjatk.Apply4IT.validator.OfferClosingDate;
import pjatk.Apply4IT.validator.ValidSalaryRange;

import javax.validation.Valid;
import javax.validation.constraints.*;
import java.time.LocalDate;
import java.util.Set;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ValidSalaryRange
public class OfferCreationRequestDto {

    @NotNull
    @Size(min = 5, max = 35)
    private String title;

    @Size(min = 0, max = 2000)
    private String description;

    @Valid
    private Address address;

    @NotNull
    private Integer localizationId;

    @NotNull
    private Integer companyId;

    @NotNull
    @OfferClosingDate
    private LocalDate closingDate;

    @Min(0)
    @Max(100000)
    private Integer minSalaryPln;

    @Min(0)
    @Max(100000)
    private Integer maxSalaryPln;

    private Boolean firstJobPossibility;
    private Boolean remotePossibility;
    private Set<@Valid ExpectationMinimalDto> expectations;
    private Set<@Valid OfferAdvantageMinimalDto> offerAdvantages;
    private Set<Integer> categoryIds;
}