package pjatk.Apply4IT.model;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Offer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String title;
    private String description;

    @Embedded
    private Address address;

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    private Localization localization;

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    private Company company;

    private LocalDate creationDate;
    private LocalDate closingDate;

    private Integer minSalaryPln;
    private Integer maxSalaryPln;

    private Boolean firstJobPossibility;

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    @JoinColumn(name="USER_ID")
    private User author;

    @Builder.Default
    @OneToMany(mappedBy = "targetOffer", cascade = CascadeType.ALL)
    private Set<Application> applications = new HashSet<>();

    @Builder.Default
    @OneToMany(mappedBy = "offer", cascade = CascadeType.ALL)
    private Set<Expectation> expectations = new HashSet<>();

    @Builder.Default
    @OneToMany(mappedBy = "offer", cascade = CascadeType.ALL)
    private Set<OfferAdvantage> offerAdvantages = new HashSet<>();

    @Builder.Default
    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE}, fetch = FetchType.EAGER)
    @JoinTable(
            name = "OFFER_CATEGORY",
            joinColumns = @JoinColumn(name = "OFFER_ID"),
            inverseJoinColumns = @JoinColumn(name = "JOB_CATEGORY_ID")
    )
    private Set<Category> categories = new HashSet<>();

    private Boolean remotePossibility;

    @Builder.Default
    @ManyToMany(mappedBy = "savedOffers", cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    private Set<User> usersWhoSaved = new HashSet<>();

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Offer offer = (Offer) o;
        return Objects.equals(id, offer.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}