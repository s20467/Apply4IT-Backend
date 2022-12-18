package pjatk.Apply4IT.api.v1.mapper;

import org.mapstruct.Mapper;
import pjatk.Apply4IT.api.v1.dto.EducationFullDto;
import pjatk.Apply4IT.model.Education;

@Mapper
public interface EducationMapper {

    EducationFullDto educationToEducationFullDto(Education education);
    Education educationFullDtoToEducation(EducationFullDto educationFullDto);
}
