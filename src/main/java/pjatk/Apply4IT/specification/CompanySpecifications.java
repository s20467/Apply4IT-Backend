package pjatk.Apply4IT.specification;

import org.springframework.data.jpa.domain.Specification;
import pjatk.Apply4IT.model.Company;

public class CompanySpecifications {

    public static Specification<Company> likeName(String name) {
        if(name == null) {
            return Specification.where(null);
        }
        return (root, query, criteriaBuilder) ->
                criteriaBuilder.like(
                        criteriaBuilder.lower(root.get("name")),
                        "%" + name.toLowerCase() + "%");
    }

}
