package pjatk.Apply4IT.api.v1.dto;

import lombok.*;
import pjatk.Apply4IT.model.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class OfferMinimalDto {

    private Integer id;
    private String title;
    private String description;
    private Address address;
    private String localization;
    private Company company;
    private LocalDate creationDate;
    private LocalDate closingDate;
    private List<String> categories = new ArrayList<>();
    private Boolean remotePossibility;
}
