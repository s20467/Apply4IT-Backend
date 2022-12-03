package pjatk.Apply4IT.api.v1.dto;

import lombok.*;
import pjatk.Apply4IT.model.Address;
import pjatk.Apply4IT.model.Offer;
import pjatk.Apply4IT.model.User;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CompanyFullDto {

    private Integer id;
    private String name;
    private String description;
    private String logoPhoto;
    private Address address;

    @Builder.Default
    private List<OfferMinimalDto> latestOffersSample = new ArrayList<>();

    @Builder.Default
    private Set<UserMinimalDto> recruitersSample = new HashSet<>();

    private Boolean isCurrentUserOwner;
    private Boolean isCurrentUserRecruiter;
}