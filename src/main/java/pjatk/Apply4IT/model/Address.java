package pjatk.Apply4IT.model;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Embeddable
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Address {

    @NotNull
    @Size(min = 4, max = 70)
    private String country;

    @NotNull
    @Size(min = 1, max = 200)
    private String city;

    @NotNull
    @Size(min = 3, max = 15)
    private String zip;

    @NotNull
    @Size(min = 1, max = 200)
    private String street;
}