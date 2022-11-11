package pjatk.Apply4IT.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import pjatk.Apply4IT.api.v1.dto.LocalizationFullDto;
import pjatk.Apply4IT.api.v1.mapper.LocalizationMapper;
import pjatk.Apply4IT.model.Category;
import pjatk.Apply4IT.model.Localization;
import pjatk.Apply4IT.repository.CategoryRepository;
import pjatk.Apply4IT.repository.LocalizationRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class LocalizationServiceImpl implements LocalizationService {

    private final LocalizationRepository localizationRepository;
    private final LocalizationMapper localizationMapper;

    @Override
    public List<LocalizationFullDto> getAllLocalizations() {
        return localizationRepository.findAll().stream().map(localizationMapper::localizationToLocalizationFullDto).collect(Collectors.toList());
    }
}
