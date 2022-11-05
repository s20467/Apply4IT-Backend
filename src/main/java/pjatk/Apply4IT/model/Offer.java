package pjatk.Apply4IT.model;

import lombok.*;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

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
    @OneToMany(mappedBy = "targetOffer", cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    private List<Application> applications = new ArrayList<>();

    @Builder.Default
    @OneToMany(mappedBy = "offer", cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Expectation> expectations = new ArrayList<>();

    @Builder.Default
    @OneToMany(mappedBy = "offer", cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<OfferAdvantage> offerAdvantages = new ArrayList<>();

    @Builder.Default
    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    @JoinTable(
            name = "OFFER_CATEGORY",
            joinColumns = @JoinColumn(name = "OFFER_ID"),
            inverseJoinColumns = @JoinColumn(name = "JOB_CATEGORY_ID")
    )
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Category> categories = new ArrayList<>();

    private Boolean remotePossibility;

    @Builder.Default
    @ManyToMany(mappedBy = "savedOffers", cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    private List<User> users = new ArrayList<>(); //todo usersWhoSaved
}