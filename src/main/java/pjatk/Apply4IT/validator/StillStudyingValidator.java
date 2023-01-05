package pjatk.Apply4IT.validator;

import pjatk.Apply4IT.api.v1.dto.EducationFullDto;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class StillStudyingValidator implements
        ConstraintValidator<ValidStillStudying, EducationFullDto> {

    @Override
    public void initialize(ValidStillStudying educationFullDto) {
    }

    @Override
    public boolean isValid(EducationFullDto educationFullDto, ConstraintValidatorContext cxt) {
        if(educationFullDto.getStillStudying() == null) {
            return true;
        }
        return (educationFullDto.getStillStudying() && educationFullDto.getEndDate() == null) ||
                (!educationFullDto.getStillStudying() && educationFullDto.getEndDate() != null);
    }
}