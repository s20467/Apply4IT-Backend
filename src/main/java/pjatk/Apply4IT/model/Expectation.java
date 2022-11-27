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
public class Expectation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String description;
    private boolean required;
    private Integer orderNumber;

    @ManyToOne
    private Offer offer;
}