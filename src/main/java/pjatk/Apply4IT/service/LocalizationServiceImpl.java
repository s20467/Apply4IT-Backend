package pjatk.Apply4IT.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pjatk.Apply4IT.api.v1.dto.LocalizationFullDto;
import pjatk.Apply4IT.api.v1.mapper.LocalizationMapper;
import pjatk.Apply4IT.exception.ResourceNotFoundException;
import pjatk.Apply4IT.model.Localization;
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

    @Override
    public void editLocalization(LocalizationFullDto localization) {
        Localization foundLocalization = localizationRepository.findById(localization.getId()).orElseThrow(
                () -> new ResourceNotFoundException("Localization with id: " + localization.getId() + " not found")
        );
        foundLocalization.setName(localization.getName());
        localizationRepository.save(foundLocalization);
    }

    @Override
    public void createLocalization(LocalizationFullDto localization) {
        localizationRepository.save(
                new Localization(localization.getName())
        );
    }

    @Override
    @Transactional
    public void deleteById(Integer localizationId) {
        Localization foundLocalization = localizationRepository.findById(localizationId).orElseThrow(
                () -> new ResourceNotFoundException("Localization with id: " + localizationId + " not found")
        );
        localizationRepository.delete(foundLocalization);
    }
}
