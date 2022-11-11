package pjatk.Apply4IT.api.v1.mapper;

import org.mapstruct.Mapper;
import pjatk.Apply4IT.api.v1.dto.LocalizationFullDto;
import pjatk.Apply4IT.model.Localization;

@Mapper
public interface LocalizationMapper {

    LocalizationFullDto localizationToLocalizationFullDto(Localization localization);
}
