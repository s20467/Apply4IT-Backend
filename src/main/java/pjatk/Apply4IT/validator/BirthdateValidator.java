package pjatk.Apply4IT.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.time.LocalDate;

public class BirthdateValidator implements
        ConstraintValidator<Birthdate, LocalDate> {

    @Override
    public void initialize(Birthdate birthdate) {
    }

    @Override
    public boolean isValid(LocalDate birthdate, ConstraintValidatorContext cxt) {
        return birthdate.isAfter(LocalDate.of(1900, 1, 1)) &&
                birthdate.isBefore(LocalDate.now());
    }

}
