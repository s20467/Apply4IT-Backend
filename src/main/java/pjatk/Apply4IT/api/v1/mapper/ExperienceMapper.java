package pjatk.Apply4IT.api.v1.mapper;

import org.mapstruct.Mapper;
import pjatk.Apply4IT.api.v1.dto.ExperienceFullDto;
import pjatk.Apply4IT.model.Experience;

@Mapper
public interface ExperienceMapper {

    ExperienceFullDto experienceToExperienceFullDto(Experience experience);
    Experience experienceFullDtoToExperience(ExperienceFullDto experienceFullDto);
}
