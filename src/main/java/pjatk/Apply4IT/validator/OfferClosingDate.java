package pjatk.Apply4IT.validator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = OfferClosingDateValidator.class)
@Target( { ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface OfferClosingDate {
    String message() default "Invalid offer closing date";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}