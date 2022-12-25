package pjatk.Apply4IT.service;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.*;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import pjatk.Apply4IT.api.v1.dto.ExpectationMinimalDto;
import pjatk.Apply4IT.api.v1.dto.OfferAdvantageMinimalDto;
import pjatk.Apply4IT.api.v1.dto.OfferCreationRequestDto;
import pjatk.Apply4IT.api.v1.dto.OfferMinimalDto;
import pjatk.Apply4IT.api.v1.mapper.*;
import pjatk.Apply4IT.exception.ResourceNotFoundException;
import pjatk.Apply4IT.model.*;
import pjatk.Apply4IT.repository.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
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
    @Captor private ArgumentCaptor<Offer> offerCaptor;

    private OfferServiceImpl offerService;

   Offer offer1 = Offer.builder().id(1).creationDate(LocalDate.of(2022, 1, 1)).build();
   Offer offer2 = Offer.builder().id(2).creationDate(LocalDate.of(2022, 2, 2)).build();
   Offer offer3 = Offer.builder().id(3).creationDate(LocalDate.of(2022, 3, 3)).build();
   User authenticatedUser = User.builder().email("email@email").build();
   Address address = new Address("country", "city", "zip", "street");

   @BeforeEach
   public void setUp() {
       offerMapper = Mockito.spy(new OfferMapperImpl(companyMapper, categoryMapper, localizationMapper));
       offerService = new OfferServiceImpl(offerRepository, userRepository, companyRepository,
               localizationRepository, categoryRepository, applicationRepository, offerMapper, userMapper);
   }

    @Test
    void getOffersSuccessful() {
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

    @Test
    void createOfferSuccessful() {
        //given
        LocalDate closingDate = LocalDate.now().plusDays(30);
        User user = User.builder().id(1).email(authenticatedUser.getEmail()).build();
        Integer localizationId = 1;
        Localization localization = Localization.builder().id(localizationId).name("localization name").build();
        Integer companyId = 1;
        Company company = Company.builder().id(companyId).enabled(true).build();
        Integer categoryId = 1;
        Set<Integer> categoryIds = Set.of(categoryId);
        Category category = Category.builder().id(categoryId).title("category title").build();
        ExpectationMinimalDto expectationMinimalDto = ExpectationMinimalDto.builder().description("expectation description").orderNumber(1).required(true).build();
        Expectation expectation = Expectation.builder()
                .orderNumber(expectationMinimalDto.getOrderNumber())
                .description(expectationMinimalDto.getDescription())
                .required(expectationMinimalDto.isRequired())
                .build();
        Set<ExpectationMinimalDto> expectations = Set.of(expectationMinimalDto);
        OfferAdvantageMinimalDto offerAdvantageMinimalDto = OfferAdvantageMinimalDto.builder()
                .description("offer advantage description")
                .orderNumber(1)
                .build();
        OfferAdvantage offerAdvantage = OfferAdvantage.builder()
                .description(offerAdvantageMinimalDto.getDescription())
                .orderNumber(offerAdvantageMinimalDto.getOrderNumber())
                .build();
        Set<OfferAdvantageMinimalDto> offerAdvantages = Set.of(offerAdvantageMinimalDto);
        OfferCreationRequestDto offerCreationRequestDto = new OfferCreationRequestDto(
                "title", "description", address, 1, companyId, closingDate, 10000,
                20000, true, true, expectations, offerAdvantages, categoryIds);

        when(categoryRepository.findById(categoryId)).thenReturn(Optional.of(category));
        when(localizationRepository.findById(localizationId)).thenReturn(Optional.of(localization));
        when(companyRepository.findById(companyId)).thenReturn(Optional.of(company));
        when(userRepository.getByEmail(authenticatedUser.getEmail())).thenReturn(user);
        when(offerRepository.save(any())).thenReturn(Offer.builder().id(1).build());

        //when
        Integer result = offerService.createOffer(offerCreationRequestDto, authenticatedUser);

        //then
        Mockito.verify(offerRepository, times(1)).save(offerCaptor.capture());
        Offer savedOffer = offerCaptor.getValue();
        assertEquals(offerCreationRequestDto.getTitle(), savedOffer.getTitle());
        assertEquals(offerCreationRequestDto.getDescription(), savedOffer.getDescription());
        assertEquals(offerCreationRequestDto.getMinSalaryPln(), savedOffer.getMinSalaryPln());
        assertEquals(offerCreationRequestDto.getMaxSalaryPln(), savedOffer.getMaxSalaryPln());
        assertEquals(offerCreationRequestDto.getAddress(), savedOffer.getAddress());
        assertEquals(offerCreationRequestDto.getFirstJobPossibility(), savedOffer.getFirstJobPossibility());
        assertEquals(offerCreationRequestDto.getRemotePossibility(), savedOffer.getRemotePossibility());
        assertAll("Categories assertions",
                () -> assertThat(savedOffer.getCategories()).hasSize(categoryIds.size()),
                () -> {
                    Category assignedCategory = savedOffer.getCategories().stream().findFirst().get();
                    assertEquals(assignedCategory.getId(), category.getId());
                    assertEquals(assignedCategory.getTitle(), category.getTitle());
                    assertThat(assignedCategory.getOffers()).hasSize(categoryIds.size());
                    assertThat(assignedCategory.getOffers()).contains(savedOffer);
                }
        );
        assertAll("Expectations assertions",
                () -> assertThat(savedOffer.getExpectations()).hasSize(expectations.size()),
                () -> {
                    Expectation assignedExpectation = savedOffer.getExpectations().stream().findFirst().get();
                    assertEquals(assignedExpectation.getDescription(), expectation.getDescription());
                    assertEquals(assignedExpectation.getOrderNumber(), expectation.getOrderNumber());
                    assertEquals(savedOffer, assignedExpectation.getOffer());
                }
        );
        assertAll("Offer advantages assertions",
                () -> assertThat(savedOffer.getOfferAdvantages()).hasSize(offerAdvantages.size()),
                () -> {
                    OfferAdvantage assignedOfferAdvantage = savedOffer.getOfferAdvantages().stream().findFirst().get();
                    assertEquals(assignedOfferAdvantage.getDescription(), offerAdvantage.getDescription());
                    assertEquals(assignedOfferAdvantage.getOrderNumber(), offerAdvantage.getOrderNumber());
                    assertEquals(savedOffer, assignedOfferAdvantage.getOffer());
                }
        );
        assertAll("Company assertions",
                () -> {
                    Company assignedCompany = savedOffer.getCompany();
                    assertEquals(company.getDescription(), assignedCompany.getDescription());
                    assertTrue(assignedCompany.isEnabled());
                    assertThat(assignedCompany.getOffers()).contains(savedOffer);
                }
        );
        assertAll("Localization assertions",
                () -> {
                    Localization assignedLocalization = savedOffer.getLocalization();
                    assertEquals(localization.getId(), assignedLocalization.getId());
                    assertEquals(localization.getName(), assignedLocalization.getName());
                    assertThat(assignedLocalization.getOffers()).contains(savedOffer);
                }
        );
        assertAll("User assertions",
                () -> {
                    User assignedUser = savedOffer.getAuthor();
                    assertEquals(authenticatedUser.getEmail(), assignedUser.getEmail());
                    assertThat(assignedUser.getCreatedOffers()).contains(savedOffer);
                }
        );
    }

    @Test
    void createOfferCompanyNotEnabled() {
        //given
        Integer companyId = 1;
        Company company = Company.builder().id(companyId).enabled(false).build();
        OfferCreationRequestDto offerCreationRequestDto = new OfferCreationRequestDto(
                "title", "description", address, 1, companyId, LocalDate.now(), 10000,
                20000, true, true, null, null, null);

        when(companyRepository.findById(companyId)).thenReturn(Optional.of(company));

        //when
        assertThrows(
                ResourceNotFoundException.class,
                () -> offerService.createOffer(offerCreationRequestDto, authenticatedUser)
        );
    }

    @Test
    void updateOfferSuccessful() {
        //given
        Integer offerId = 1;
        Offer updatedOffer = Offer.builder()
                .id(offerId)
                .localization(Localization.builder().build())
                .company(Company.builder().build())
                .build();
        LocalDate closingDate = LocalDate.now().plusDays(30);
        Integer localizationId = 1;
        Localization localization = Localization.builder().id(localizationId).name("localization name").build();
        Integer companyId = 1;
        Company company = Company.builder().id(companyId).enabled(true).build();
        Integer categoryId = 1;
        Set<Integer> categoryIds = Set.of(categoryId);
        Category category = Category.builder().id(categoryId).title("category title").build();
        ExpectationMinimalDto expectationMinimalDto = ExpectationMinimalDto.builder().description("expectation description").orderNumber(1).required(true).build();
        Expectation expectation = Expectation.builder()
                .orderNumber(expectationMinimalDto.getOrderNumber())
                .description(expectationMinimalDto.getDescription())
                .required(expectationMinimalDto.isRequired())
                .build();
        Set<ExpectationMinimalDto> expectations = Set.of(expectationMinimalDto);
        OfferAdvantageMinimalDto offerAdvantageMinimalDto = OfferAdvantageMinimalDto.builder()
                .description("offer advantage description")
                .orderNumber(1)
                .build();
        OfferAdvantage offerAdvantage = OfferAdvantage.builder()
                .description(offerAdvantageMinimalDto.getDescription())
                .orderNumber(offerAdvantageMinimalDto.getOrderNumber())
                .build();
        Set<OfferAdvantageMinimalDto> offerAdvantages = Set.of(offerAdvantageMinimalDto);
        OfferCreationRequestDto offerCreationRequestDto = new OfferCreationRequestDto(
                "title", "description", address, 1, companyId, closingDate, 10000,
                20000, true, true, expectations, offerAdvantages, categoryIds);

        when(categoryRepository.findById(categoryId)).thenReturn(Optional.of(category));
        when(localizationRepository.findById(localizationId)).thenReturn(Optional.of(localization));
        when(companyRepository.findById(companyId)).thenReturn(Optional.of(company));
        when(offerRepository.findById(offerId)).thenReturn(Optional.of(updatedOffer));
        when(offerRepository.save(any())).thenReturn(updatedOffer);

        //when
        Integer result = offerService.updateOffer(offerId, offerCreationRequestDto);

        //then
        Mockito.verify(offerRepository, times(1)).save(offerCaptor.capture());
        Offer savedOffer = offerCaptor.getValue();
        assertEquals(offerCreationRequestDto.getTitle(), savedOffer.getTitle());
        assertEquals(offerCreationRequestDto.getDescription(), savedOffer.getDescription());
        assertEquals(offerCreationRequestDto.getMinSalaryPln(), savedOffer.getMinSalaryPln());
        assertEquals(offerCreationRequestDto.getMaxSalaryPln(), savedOffer.getMaxSalaryPln());
        assertEquals(offerCreationRequestDto.getAddress(), savedOffer.getAddress());
        assertEquals(offerCreationRequestDto.getFirstJobPossibility(), savedOffer.getFirstJobPossibility());
        assertEquals(offerCreationRequestDto.getRemotePossibility(), savedOffer.getRemotePossibility());
        assertAll("Categories assertions",
                () -> assertThat(savedOffer.getCategories()).hasSize(categoryIds.size()),
                () -> {
                    Category assignedCategory = savedOffer.getCategories().stream().findFirst().get();
                    assertEquals(assignedCategory.getId(), category.getId());
                    assertEquals(assignedCategory.getTitle(), category.getTitle());
                    assertThat(assignedCategory.getOffers()).hasSize(categoryIds.size());
                    assertThat(assignedCategory.getOffers()).contains(savedOffer);
                }
        );
        assertAll("Expectations assertions",
                () -> assertThat(savedOffer.getExpectations()).hasSize(expectations.size()),
                () -> {
                    Expectation assignedExpectation = savedOffer.getExpectations().stream().findFirst().get();
                    assertEquals(assignedExpectation.getDescription(), expectation.getDescription());
                    assertEquals(assignedExpectation.getOrderNumber(), expectation.getOrderNumber());
                    assertEquals(savedOffer, assignedExpectation.getOffer());
                }
        );
        assertAll("Offer advantages assertions",
                () -> assertThat(savedOffer.getOfferAdvantages()).hasSize(offerAdvantages.size()),
                () -> {
                    OfferAdvantage assignedOfferAdvantage = savedOffer.getOfferAdvantages().stream().findFirst().get();
                    assertEquals(assignedOfferAdvantage.getDescription(), offerAdvantage.getDescription());
                    assertEquals(assignedOfferAdvantage.getOrderNumber(), offerAdvantage.getOrderNumber());
                    assertEquals(savedOffer, assignedOfferAdvantage.getOffer());
                }
        );
        assertAll("Company assertions",
                () -> {
                    Company assignedCompany = savedOffer.getCompany();
                    assertEquals(company.getDescription(), assignedCompany.getDescription());
                    assertTrue(assignedCompany.isEnabled());
                    assertThat(assignedCompany.getOffers()).contains(savedOffer);
                }
        );
        assertAll("Localization assertions",
                () -> {
                    Localization assignedLocalization = savedOffer.getLocalization();
                    assertEquals(localization.getId(), assignedLocalization.getId());
                    assertEquals(localization.getName(), assignedLocalization.getName());
                    assertThat(assignedLocalization.getOffers()).contains(savedOffer);
                }
        );
    }
}