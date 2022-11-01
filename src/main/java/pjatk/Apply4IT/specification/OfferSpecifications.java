package pjatk.Apply4IT.specification;

import org.springframework.data.jpa.domain.Specification;
import pjatk.Apply4IT.api.v1.dto.OfferSearchSpecification;
import pjatk.Apply4IT.model.*;

import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Subquery;
import java.util.Collection;
import java.util.List;

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

    public static Specification<Offer> likeCompanyName(String companyName) {
        if(companyName == null) {
            return null;
        }
        return (root, query, criteriaBuilder) ->
                criteriaBuilder.like(
                        criteriaBuilder.lower(root.get("company").get("name")),
                        "%" + companyName + "%"
                );
    }

    public static Specification<Offer> equalRemotePossibility(Boolean remotePossibility) {
        if(remotePossibility == null) {
            return Specification.where(null);
        }
        return (root, query, criteriaBuilder) ->
                criteriaBuilder.equal(root.get("remotePossibility"), remotePossibility);
    }

    public static Specification<Offer> equalFirstJobPossibility(Boolean firstJobPossibility) {
        if(firstJobPossibility == null) {
            return Specification.where(null);
        }
        return (root, query, criteriaBuilder) ->
                criteriaBuilder.equal(root.get("firstJobPossibility"), firstJobPossibility);
    }


    public static Specification<Offer> likeAnyCategoryTitle(String categoryTitle) {
        if(categoryTitle == null) {
            return Specification.where(null);
        }
        return (root, query, criteriaBuilder) -> {
            query.distinct(true);
            Root<Offer> offerRoot = root;
            Subquery<Category> categorySubquery = query.subquery(Category.class);
            Root<Category> categoryRoot = categorySubquery.from(Category.class);
            Expression<Collection<Category>> categoriesExpression = offerRoot.get("categories");
            categorySubquery.select(categoryRoot);
            categorySubquery.where(
                    criteriaBuilder.like(
                            criteriaBuilder.lower(categoryRoot.get("title")),
                            "%" + categoryTitle.toLowerCase() + "%"
                    ),
                    criteriaBuilder.isMember(
                            categoryRoot,
                            categoriesExpression
                    )
            );
            return criteriaBuilder.exists(categorySubquery);
        };
    }

    public static Specification<Offer> likeAnyExpectationDescription(String expectationDescription) {
        if(expectationDescription == null) {
            return Specification.where(null);
        }
        return (root, query, criteriaBuilder) -> {
            query.distinct(true);
            Root<Offer> offerRoot = root;
            Subquery<Expectation> expectationSubquery = query.subquery(Expectation.class);
            Root<Expectation> expectationRoot = expectationSubquery.from(Expectation.class);
            Expression<Collection<Expectation>> expectationsExpression = offerRoot.get("expectations");
            expectationSubquery.select(expectationRoot);
            expectationSubquery.where(
                    criteriaBuilder.like(
                            criteriaBuilder.lower(expectationRoot.get("description")),
                            "%" + expectationDescription.toLowerCase() + "%"
                    ),
                    criteriaBuilder.isMember(
                            expectationRoot,
                            expectationsExpression
                    )
            );
            return criteriaBuilder.exists(expectationSubquery);
        };
    }

    public static Specification<Offer> likeAnyOfferAdvantageDescription(String offerAdvantageDescription) {
        if(offerAdvantageDescription == null) {
            return Specification.where(null);
        }
        return (root, query, criteriaBuilder) -> {
            query.distinct(true);
            Root<Offer> offerRoot = root;
            Subquery<OfferAdvantage> offerAdvantageSubquery = query.subquery(OfferAdvantage.class);
            Root<OfferAdvantage> offerAdvantageRoot = offerAdvantageSubquery.from(OfferAdvantage.class);
            Expression<Collection<OfferAdvantage>> offerAdvantagesExpression = offerRoot.get("offerAdvantages");
            offerAdvantageSubquery.select(offerAdvantageRoot);
            offerAdvantageSubquery.where(
                    criteriaBuilder.like(
                            criteriaBuilder.lower(offerAdvantageRoot.get("description")),
                            "%" + offerAdvantageDescription.toLowerCase() + "%"
                    ),
                    criteriaBuilder.isMember(
                            offerAdvantageRoot,
                            offerAdvantagesExpression
                    )
            );
            return criteriaBuilder.exists(offerAdvantageSubquery);
        };
    }

    public static Specification<Offer> equalAnyCategoryId(List<Integer> categoryIds) {
        if(categoryIds == null || categoryIds.isEmpty()) {
            return Specification.where(null);
        }
        return (root, query, criteriaBuilder) -> {
            query.distinct(true);
            Root<Offer> offerRoot = root;
            Subquery<Category> categorySubquery = query.subquery(Category.class);
            Root<Category> categoryRoot = categorySubquery.from(Category.class);
            Expression<Collection<Category>> categoriesExpression = offerRoot.get("categories");
            categorySubquery.select(categoryRoot);
            categorySubquery.where(
                    categoryRoot.get("id").in(categoryIds),
                    criteriaBuilder.isMember(
                            categoryRoot,
                            categoriesExpression
                    )
            );
            return criteriaBuilder.exists(categorySubquery);
        };
    }

    public static Specification<Offer> equalAnyLocalizationId(List<Integer> localizationIds) {
        if(localizationIds == null || localizationIds.isEmpty()) {
            return Specification.where(null);
        }
        return (root, query, criteriaBuilder) -> {
            query.distinct(true);
            Root<Offer> offerRoot = root;
            Expression<Localization> localizationIdExpression = offerRoot.get("localization").get("id");
            return criteriaBuilder.isTrue(localizationIdExpression.in(localizationIds));
        };
    }

    public static Specification<Offer> searchByOfferSearchSpecification(OfferSearchSpecification offerSearchSpecification) {
        if(offerSearchSpecification.getStringSearchSection() == null) {
            return equalRemotePossibility(offerSearchSpecification.getRemotePossibilityEqual())
                    .and(equalAnyCategoryId(offerSearchSpecification.getAnyCategoryIdEqual()))
                    .and(equalAnyLocalizationId(offerSearchSpecification.getAnyLocalizationIdEqual()));
        }
        return (likeTitle(offerSearchSpecification.getStringSearchSection().getTitleLike())
                    .or(likeDescription(offerSearchSpecification.getStringSearchSection().getDescriptionLike()))
                    .or(likeAnyExpectationDescription(offerSearchSpecification.getStringSearchSection().getAnyExpectationLike()))
                    .or(likeAnyOfferAdvantageDescription(offerSearchSpecification.getStringSearchSection().getAnyOfferAdvantageLike()))
                    .or(likeAnyCategoryTitle(offerSearchSpecification.getStringSearchSection().getAnyCategoryNameLike()))
                    .or(likeCompanyName(offerSearchSpecification.getStringSearchSection().getCompanyNameLike())))
                .and(equalRemotePossibility(offerSearchSpecification.getRemotePossibilityEqual()))
                .and(equalAnyCategoryId(offerSearchSpecification.getAnyCategoryIdEqual()))
                .and(equalAnyLocalizationId(offerSearchSpecification.getAnyLocalizationIdEqual()))
                .and(equalFirstJobPossibility(offerSearchSpecification.getFirstJobPossibilityEqual()));
    }
}
