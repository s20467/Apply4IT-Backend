package pjatk.Apply4IT.api.v1;

import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import pjatk.Apply4IT.api.v1.dto.LocalizationFullDto;
import pjatk.Apply4IT.service.LocalizationService;

import java.util.List;

@RestController
@RequestMapping("/api/v1/localizations")
@RequiredArgsConstructor
public class LocalizationController {

    private final LocalizationService localizationService;

    @PreAuthorize("permitAll()")
    @GetMapping
    public List<LocalizationFullDto> getAllLocalizations() {
        return localizationService.getAllLocalizations();
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PutMapping
    public void editLocalization(@RequestBody LocalizationFullDto localization) {
        localizationService.editLocalization(localization);
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping
    public void createLocalization(@RequestBody LocalizationFullDto localization) {
        localizationService.createLocalization(localization);
    }

    @PreAuthorize("hasRole('ADMIN')")
    @DeleteMapping("/{localizationId}")
    public void deleteLocalization(@PathVariable Integer localizationId) {
        localizationService.deleteById(localizationId);
    }
}
