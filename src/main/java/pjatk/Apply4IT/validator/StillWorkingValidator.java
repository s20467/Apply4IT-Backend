package pjatk.Apply4IT.validator;

import pjatk.Apply4IT.api.v1.dto.ExperienceFullDto;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class StillWorkingValidator implements
        ConstraintValidator<ValidStillWorking, ExperienceFullDto> {

    @Override
    public void initialize(ValidStillWorking experienceFullDto) {
    }

    @Override
    public boolean isValid(ExperienceFullDto experienceFullDto, ConstraintValidatorContext cxt) {
        return (experienceFullDto.isStillWorking() && experienceFullDto.getEndDate() == null) ||
                (!experienceFullDto.isStillWorking() && experienceFullDto.getEndDate() != null);
    }
}