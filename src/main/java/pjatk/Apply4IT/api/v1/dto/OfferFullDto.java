package pjatk.Apply4IT.api.v1.dto;

import lombok.*;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import pjatk.Apply4IT.model.*;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

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
    private Integer applicationsNumber;

    @Builder.Default
    private List<String> expectations = new ArrayList<>();
    @Builder.Default
    private List<String> offerAdvantages = new ArrayList<>();
    @Builder.Default
    private List<String> categories = new ArrayList<>();

    private Boolean remotePossibility;
}