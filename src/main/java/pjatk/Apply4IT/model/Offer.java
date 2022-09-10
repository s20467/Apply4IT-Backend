package pjatk.Apply4IT.model;

import lombok.*;

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
    private String description;

    @Embedded
    private Address address;

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    private Company company;

    private LocalDate creationDate;
    private LocalDate closingDate;

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    private User author;

    @OneToMany(mappedBy = "targetOffer", cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    private List<Application> applications = new ArrayList<>();

    @OneToMany(mappedBy = "offer", cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    private List<Expectation> expectations = new ArrayList<>();

    @OneToMany(mappedBy = "offer", cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    private List<OfferAdvantage> offerAdvantages = new ArrayList<>();

    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    @JoinTable(
            name = "OFFER_CATEGORY",
            joinColumns = @JoinColumn(name = "OFFER_ID"),
            inverseJoinColumns = @JoinColumn(name = "JOB_CATEGORY_ID")
    )
    private List<Category> categories = new ArrayList<>();

    @ManyToMany(mappedBy = "savedOffers", cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    private List<User> users = new ArrayList<>();
}