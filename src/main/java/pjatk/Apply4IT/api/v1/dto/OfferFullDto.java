package pjatk.Apply4IT.api.v1.dto;

import lombok.*;
import pjatk.Apply4IT.model.*;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class OfferFullDto {

    private Integer id;
    private String title;
    private String description;
    private Address address;
    private String localization;
    private CompanyMinimalDto company;
    private LocalDate creationDate;
    private LocalDate closingDate;
    private Integer minSalaryPln;
    private Integer maxSalaryPln;
    private Boolean firstJobPossibility;
    private Integer applicationsNumber = null;

    @Builder.Default
    private Set<String> expectations = new HashSet<>();
    @Builder.Default
    private Set<String> offerAdvantages = new HashSet<>();
    @Builder.Default
    private Set<String> categories = new HashSet<>();

    private Boolean remotePossibility;
    private Boolean isSavedByCurrentUser;
}