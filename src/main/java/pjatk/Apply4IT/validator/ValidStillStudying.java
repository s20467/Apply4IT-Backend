package pjatk.Apply4IT.validator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;


@Documented
@Constraint(validatedBy = StillStudyingValidator.class)
@Target( { ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidStillStudying {
    String message() default "There should be endDate or stillStudying should be true (not both)";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}