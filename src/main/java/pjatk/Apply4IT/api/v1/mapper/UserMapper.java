package pjatk.Apply4IT.api.v1.mapper;

import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import pjatk.Apply4IT.api.v1.dto.*;
import pjatk.Apply4IT.model.Category;
import pjatk.Apply4IT.model.User;

@Mapper(
        uses = {EducationMapper.class, ExperienceMapper.class},
        injectionStrategy = InjectionStrategy.CONSTRUCTOR
)
public interface UserMapper {

    UserMinimalDto userToUserMinimalDto(User user);

    UserCandidateDto userToUserCandidateDto(User user);

    @Mapping(target = "password", ignore = true)
    User userCreationDtoToUser(UserCreationDto userCreationDto);

    UserFullDto userToUserFullDto(User user);
}
