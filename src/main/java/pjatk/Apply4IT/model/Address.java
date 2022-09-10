package pjatk.Apply4IT.model;

import lombok.*;

import javax.persistence.*;

@Embeddable
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Address {
    private String country;
    private String city;
    private String zip;
    private String street;
}