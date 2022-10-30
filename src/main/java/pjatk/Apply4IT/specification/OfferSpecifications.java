package pjatk.Apply4IT.specification;

import org.springframework.data.jpa.domain.Specification;
import pjatk.Apply4IT.model.Expectation;
import pjatk.Apply4IT.model.Offer;
import pjatk.Apply4IT.model.OfferAdvantage;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Subquery;
import java.util.Collection;

public class OfferSpecifications {

    public static Specification<Offer> likeTitle(String title) {
        if(title == null) {
            return Specification.where(null);
        }
        return (root, query, criteriaBuilder) ->
                criteriaBuilder.like(
                        criteriaBuilder.lower(root.get("title")),
                        "%" + title.toLowerCase() + "%");
    }

    public static Specification<Offer> likeDescription(String description) {
        if(description == null) {
            return Specification.where(null);
        }
        return (root, query, criteriaBuilder) ->
                criteriaBuilder.like(
                        criteriaBuilder.lower(root.get("description")),
                        "%" + description.toLowerCase() + "%");
    }

    public static Specification<Offer> likeAnyExpectation(String expectationDescription) {
        if(expectationDescription == null) {
            return Specification.where(null);
        }
        return (root, query, criteriaBuilder) -> {
            query.distinct(true);
            Root<Offer> offer = root;
            Subquery<Expectation> expectationSubquery = query.subquery(Expectation.class);
            Root<Expectation> expectation = expectationSubquery.from(Expectation.class);
            Expression<Collection<Expectation>> expectations = offer.get("expectations");
            expectationSubquery.select(expectation);
            expectationSubquery.where(
                    criteriaBuilder.like(
                            criteriaBuilder.lower(expectation.get("description")),
                            "%" + expectationDescription.toLowerCase() + "%"
                    ),
                    criteriaBuilder.isMember(
                            expectation,
                            expectations
                    )
            );
            return criteriaBuilder.exists(expectationSubquery);
        };
    }

    public static Specification<Offer> likeAnyOfferAdvantage(String offerAdvantageDescription) {
        if(offerAdvantageDescription == null) {
            return Specification.where(null);
        }
        return (root, query, criteriaBuilder) -> {
            query.distinct(true);
            Root<Offer> offer = root;
            Subquery<OfferAdvantage> offerAdvantageSubquery = query.subquery(OfferAdvantage.class);
            Root<OfferAdvantage> offerAdvantage = offerAdvantageSubquery.from(OfferAdvantage.class);
            Expression<Collection<OfferAdvantage>> offerAdvantages = offer.get("offerAdvantages");
            offerAdvantageSubquery.select(offerAdvantage);
            offerAdvantageSubquery.where(
                    criteriaBuilder.like(
                            criteriaBuilder.lower(offerAdvantage.get("description")),
                            "%" + offerAdvantageDescription.toLowerCase() + "%"
                    ),
                    criteriaBuilder.isMember(
                            offerAdvantage,
                            offerAdvantages
                    )
            );
            return criteriaBuilder.exists(offerAdvantageSubquery);
        };
    }

    public static Specification<Offer> equalRemotePossibility(Boolean remotePossibility) {
        if(remotePossibility == null) {
            return Specification.where(null);
        }
        return (root, query, criteriaBuilder) ->
                criteriaBuilder.equal(root.get("remotePossibility"), remotePossibility);
    }

    public static Specification<Offer> search(String searchString) {
        if(searchString == null) {
            return Specification.where(null);
        }
        return likeTitle(searchString)
                .or(likeDescription(searchString))
                .or(likeAnyExpectation(searchString))
                .or(likeAnyOfferAdvantage(searchString));
    }
}
