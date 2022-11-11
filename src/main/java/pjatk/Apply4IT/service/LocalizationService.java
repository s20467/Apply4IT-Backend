package pjatk.Apply4IT.service;

import pjatk.Apply4IT.api.v1.dto.LocalizationFullDto;
import pjatk.Apply4IT.model.Category;
import pjatk.Apply4IT.model.Localization;

import java.util.List;

public interface LocalizationService {

    List<LocalizationFullDto> getAllLocalizations();
}
