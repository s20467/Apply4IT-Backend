package pjatk.Apply4IT.validator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = StartDateEndDateValidator.class)
@Target( { ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidStartDateEndDate {
    String message() default "Invalid endDate - endDate has to be after start date";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}