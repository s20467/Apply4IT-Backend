package pjatk.Apply4IT.api.v1.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class OfferSearchSpecification {
        private OfferSearchSpecificationStringSearchSection stringSearchSection;
        private Boolean remotePossibilityEqual;
        private List<Integer> anyCategoryIdEqual;
        private List<Integer> anyLocalizationIdEqual;
        private Boolean firstJobPossibilityEqual;


        @Getter
        @Setter
        @AllArgsConstructor
        @NoArgsConstructor
        public static class OfferSearchSpecificationStringSearchSection {
                private String titleLike;
                private String descriptionLike;
                private String anyExpectationLike;
                private String anyOfferAdvantageLike;
                private String companyNameLike;
                private String anyCategoryNameLike;
        }
}
