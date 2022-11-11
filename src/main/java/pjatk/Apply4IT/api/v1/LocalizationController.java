package pjatk.Apply4IT.api.v1;

import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pjatk.Apply4IT.api.v1.dto.LocalizationFullDto;
import pjatk.Apply4IT.service.CategoryService;
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
}
