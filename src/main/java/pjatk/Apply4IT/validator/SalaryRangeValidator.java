package pjatk.Apply4IT.validator;

import pjatk.Apply4IT.api.v1.dto.OfferCreationRequestDto;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;


public class SalaryRangeValidator implements
        ConstraintValidator<ValidSalaryRange, OfferCreationRequestDto> {

    @Override
    public void initialize(ValidSalaryRange offerCreationRequestDto) {
    }

    @Override
    public boolean isValid(OfferCreationRequestDto offerCreationRequestDto, ConstraintValidatorContext cxt) {
        if(offerCreationRequestDto.getMinSalaryPln() == null || offerCreationRequestDto.getMaxSalaryPln() == null) {
            return true;
        }
        return offerCreationRequestDto.getMinSalaryPln() < offerCreationRequestDto.getMaxSalaryPln();
    }
}