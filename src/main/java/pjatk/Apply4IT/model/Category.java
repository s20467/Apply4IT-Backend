package pjatk.Apply4IT.model;

import lombok.*;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String title;

    @Builder.Default
    @ManyToMany(mappedBy = "categories", cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    private Set<Offer> offers = new HashSet<>();

    public Category(String title) {
        this.title = title;
    }
}