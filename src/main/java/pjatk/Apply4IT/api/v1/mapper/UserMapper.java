package pjatk.Apply4IT.api.v1.mapper;

import org.mapstruct.Mapper;
import pjatk.Apply4IT.api.v1.dto.CategoryFullDto;
import pjatk.Apply4IT.api.v1.dto.UserMinimalDto;
import pjatk.Apply4IT.model.Category;
import pjatk.Apply4IT.model.User;

@Mapper
public interface UserMapper {

    UserMinimalDto userToUserMinimalDto(User user);
}