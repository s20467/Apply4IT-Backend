package pjatk.Apply4IT.validator;

import pjatk.Apply4IT.api.v1.dto.Period;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class StartDateEndDateValidator implements
        ConstraintValidator<ValidStartDateEndDate, Period> {

    @Override
    public void initialize(ValidStartDateEndDate periodObject) {
    }

    @Override
    public boolean isValid(Period periodObject, ConstraintValidatorContext cxt) {
        if(periodObject.getStartDate() == null || periodObject.getEndDate() == null) {
            return true;
        }
        return periodObject.getStartDate().isBefore(periodObject.getEndDate());
    }
}
