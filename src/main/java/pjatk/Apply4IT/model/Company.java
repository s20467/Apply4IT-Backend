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
public class Company {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;
    private String description;

    private String logoPhoto;

    @Embedded
    private Address address;

    @Builder.Default
    @OneToMany(mappedBy = "company", cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    private Set<Offer> offers = new HashSet<>();

    @Builder.Default
    @ManyToMany(mappedBy = "isRecruiterFor", cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    private Set<User> recruiters = new HashSet<>();

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    @JoinColumn(name = "USER_ID")
    private User owner;
}