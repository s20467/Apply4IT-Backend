package pjatk.Apply4IT.validator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = SalaryRangeValidator.class)
@Target( { ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidSalaryRange {
    String message() default "maxSalaryPln has to be bigger than minSalaryPln";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}