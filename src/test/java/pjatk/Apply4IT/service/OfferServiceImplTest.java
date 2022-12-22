package pjatk.Apply4IT.service;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.Spy;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import pjatk.Apply4IT.api.v1.dto.OfferMinimalDto;
import pjatk.Apply4IT.api.v1.mapper.*;
import pjatk.Apply4IT.model.Company;
import pjatk.Apply4IT.model.Offer;
import pjatk.Apply4IT.model.User;
import pjatk.Apply4IT.repository.*;

import java.util.List;
import java.util.Set;

import static org.assertj.core.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class OfferServiceImplTest {

    @Mock private OfferRepository offerRepository;
    @Mock private UserRepository userRepository;
    @Mock private CompanyRepository companyRepository;
    @Mock private LocalizationRepository localizationRepository;
    @Mock private CategoryRepository categoryRepository;
    @Mock private ApplicationRepository applicationRepository;
    @Mock private CompanyMapper companyMapper;
    @Mock private CategoryMapper categoryMapper;
    @Mock private LocalizationMapper localizationMapper;
    private OfferMapper offerMapper;
    @Mock private UserMapper userMapper;

    private OfferServiceImpl offerService;

   Offer offer1 = Offer.builder().id(1).build();
   Offer offer2 = Offer.builder().id(2).build();
   Offer offer3 = Offer.builder().id(3).build();
   Offer offer4 = Offer.builder().id(4).build();
   User authenticatedUser = User.builder().email("email@email").build();

   @BeforeEach
   public void setUp() {
       offerMapper = Mockito.spy(new OfferMapperImpl(companyMapper, categoryMapper, localizationMapper));
       offerService = new OfferServiceImpl(offerRepository, userRepository, companyRepository,
               localizationRepository, categoryRepository, applicationRepository, offerMapper, userMapper);
   }

    @Test
    void getOffers() {
        //given
        Specification<Offer> specification = Specification.where(null);
        Pageable pageable = Mockito.mock(Pageable.class);
        User user = User.builder()
                .email(authenticatedUser.getEmail())
                .savedOffers(Set.of(offer2))
                .build();
        when(offerRepository.findAll(specification, pageable))
                .thenReturn(new PageImpl<>(List.of(offer1, offer2, offer3)));
        when(userRepository.getUserWithSavedOffersByEmail(authenticatedUser.getEmail()))
                .thenReturn(user);


        //when
        Page<OfferMinimalDto> result =
                offerService.getOffers(authenticatedUser, specification, pageable);

        //then
        verify(offerRepository, times(1)).findAll(specification, pageable);
        verify(userRepository, times(1)).getUserWithSavedOffersByEmail(authenticatedUser.getEmail());
        assertThat(result).hasSize(3);
        assertAll("Offers page content test",
                () -> assertTrue(
                        () -> result.stream().anyMatch(offer -> offer.getId().equals(offer1.getId()))
                ),
                () -> assertTrue(
                        () -> result.stream().anyMatch(offer -> offer.getId().equals(offer2.getId()))
                ),
                () -> assertTrue(
                        () -> result.stream().anyMatch(offer -> offer.getId().equals(offer3.getId()))
                )
        );
        assertTrue(() -> {
            OfferMinimalDto offerSavedByUser = result.stream().filter(offer -> offer.getId().equals(offer2.getId())).findFirst().get();
            return offerSavedByUser.getIsSavedByCurrentUser();
        });
        assertTrue(() -> {
            OfferMinimalDto offerSavedByUser = result.stream().filter(offer -> !offer.getId().equals(offer2.getId())).findFirst().get();
            return !offerSavedByUser.getIsSavedByCurrentUser();
        });
    }
}