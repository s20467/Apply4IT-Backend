package pjatk.Apply4IT.validator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = StillWorkingValidator.class)
@Target( { ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidStillWorking {
    String message() default "There should be endDate or stillWorking should be true (not both)";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}