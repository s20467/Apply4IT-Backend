package pjatk.Apply4IT.model;

import lombok.*;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class OfferAdvantage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String description;
    private Integer orderNumber;

    @ManyToOne
    private Offer offer;
}