package pjatk.Apply4IT.api.v1.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import pjatk.Apply4IT.api.v1.dto.CategoryFullDto;
import pjatk.Apply4IT.api.v1.dto.UserCreationDto;
import pjatk.Apply4IT.api.v1.dto.UserFullDto;
import pjatk.Apply4IT.api.v1.dto.UserMinimalDto;
import pjatk.Apply4IT.model.Category;
import pjatk.Apply4IT.model.User;

@Mapper(uses = {EducationMapper.class, ExperienceMapper.class})
public interface UserMapper {

    UserMinimalDto userToUserMinimalDto(User user);

    @Mapping(target = "password", ignore = true)
    User userCreationDtoToUser(UserCreationDto userCreationDto);

    UserFullDto userToUserFullDto(User user);
}
