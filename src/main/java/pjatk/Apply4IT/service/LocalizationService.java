package pjatk.Apply4IT.service;

import pjatk.Apply4IT.api.v1.dto.LocalizationFullDto;

import java.util.List;

public interface LocalizationService {

    List<LocalizationFullDto> getAllLocalizations();
    
    void editLocalization(LocalizationFullDto localization);

    void createLocalization(LocalizationFullDto localization);

    void deleteById(Integer localizationId);
}
