package pjatk.Apply4IT.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.time.LocalDate;

public class OfferClosingDateValidator implements
        ConstraintValidator<OfferClosingDate, LocalDate> {

    @Override
    public void initialize(OfferClosingDate closingDate) {
    }

    @Override
    public boolean isValid(LocalDate closingDate, ConstraintValidatorContext cxt) {
        if(closingDate == null) {
            return true;
        }
        return closingDate.isAfter(LocalDate.now()) &&
                closingDate.isBefore(LocalDate.now().plusYears(1));
    }

}
