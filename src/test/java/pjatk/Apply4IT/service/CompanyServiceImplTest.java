package pjatk.Apply4IT.service;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Captor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import pjatk.Apply4IT.api.v1.mapper.CompanyMapper;
import pjatk.Apply4IT.api.v1.mapper.OfferMapper;
import pjatk.Apply4IT.api.v1.mapper.UserMapper;
import pjatk.Apply4IT.exception.ResourceConflictException;
import pjatk.Apply4IT.exception.ResourceNotFoundException;
import pjatk.Apply4IT.model.*;
import pjatk.Apply4IT.repository.CompanyRepository;
import pjatk.Apply4IT.repository.OfferRepository;
import pjatk.Apply4IT.repository.UserRepository;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class CompanyServiceImplTest {

    @Mock private CompanyRepository companyRepository;
    @Mock private UserRepository userRepository;
    @Mock private OfferRepository offerRepository;
    @Mock private CompanyMapper companyMapper;
    @Mock private OfferMapper offerMapper;
    @Mock private UserMapper userMapper;
    @InjectMocks private CompanyServiceImpl companyService;
    @Captor ArgumentCaptor<Company> companyCaptor;

    Address address = new Address("country", "city", "zip", "street");


    @Test
    void deleteByIdSuccessful() {
        //given
        Integer companyId = 1;
        Category category = Category.builder().title("category title").build();
        Localization localization = Localization.builder().name("localization name").build();
        User author = User.builder().email("author@email").build();
        User userWhoSaved = User.builder().email("userWhoSaved@email").build();
        User candidate = User.builder().email("candidate@email").build();
        User recruiter = User.builder().email("recruiter@email").build();
        Application application = Application.builder().candidate(candidate).build();
        candidate.getApplications().add(application);
        Offer offer = Offer.builder()
                .categories(Set.of(category))
                .applications(Set.of(application))
                .usersWhoSaved(Set.of(userWhoSaved))
                .localization(localization)
                .author(author)
                .build();
        author.getCreatedOffers().add(offer);
        category.getOffers().add(offer);
        localization.getOffers().add(offer);
        application.setTargetOffer(offer);
        userWhoSaved.getSavedOffers().add(offer);
        Company company = Company.builder()
                .id(companyId)
                .enabled(true)
                .address(address)
                .offers(Set.of(offer))
                .recruiters(Set.of(recruiter))
                .build();
        offer.setCompany(company);
        recruiter.getIsRecruiterFor().add(company);

        when(companyRepository.findById(companyId)).thenReturn(Optional.of(company));

        //when
        companyService.deleteById(companyId);

        //then
        verify(companyRepository, times(1)).delete(any());
        assertThat(author.getCreatedOffers()).hasSize(0);
        assertThat(candidate.getApplications()).hasSize(0);
        assertThat(category.getOffers()).hasSize(0);
        assertThat(recruiter.getIsRecruiterFor()).hasSize(0);
        assertThat(userWhoSaved.getIsRecruiterFor()).hasSize(0);
    }

    @Test
    void addUserToCompanyRecruitersSuccessful() {
        //given
        Integer companyId = 1;
        User recruiter = User.builder().email("recruiter@email").build();
        Company company = Company.builder()
                .id(companyId)
                .enabled(true)
                .build();

        when(companyRepository.findById(companyId)).thenReturn(Optional.of(company));
        when(userRepository.findByEmail(recruiter.getEmail())).thenReturn(Optional.of(recruiter));

        //when
        companyService.addUserToCompanyRecruiters(companyId, recruiter.getEmail());

        //then
        verify(companyRepository, times(1)).save(companyCaptor.capture());
        Company savedCompany = companyCaptor.getValue();
        assertThat(savedCompany.getRecruiters()).hasSize(1);
        assertThat(recruiter.getIsRecruiterFor()).hasSize(1);
    }

    @Test
    void addUserToCompanyRecruitersAlreadyRecruiter() {
        //given
        Integer companyId = 1;
        User recruiter = User.builder().email("recruiter@email").build();
        Company company = Company.builder()
                .id(companyId)
                .enabled(true)
                .recruiters(new HashSet<>(Set.of(recruiter)))
                .build();
        recruiter.getIsRecruiterFor().add(company);

        when(companyRepository.findById(companyId)).thenReturn(Optional.of(company));
        when(userRepository.findByEmail(recruiter.getEmail())).thenReturn(Optional.of(recruiter));

        //when
        assertThrows(
                ResourceConflictException.class,
                () -> companyService.addUserToCompanyRecruiters(companyId, recruiter.getEmail())
        );
    }

    @Test
    void addUserToCompanyRecruitersCompanyNotEnabled() {
        //given
        Integer companyId = 1;
        User recruiter = User.builder().email("recruiter@email").build();
        Company company = Company.builder()
                .id(companyId)
                .enabled(false)
                .recruiters(Set.of())
                .build();

        when(companyRepository.findById(companyId)).thenReturn(Optional.of(company));

        //when
        assertThrows(
                ResourceNotFoundException.class,
                () -> companyService.addUserToCompanyRecruiters(companyId, recruiter.getEmail())
        );
    }

    @Test
    void removeUserFromCompanyRecruitersSuccessful() {
        //given
        Integer companyId = 1;
        User recruiter = User.builder().email("recruiter@email").build();
        Company company = Company.builder()
                .id(companyId)
                .enabled(true)
                .recruiters(new HashSet<>(Set.of(recruiter)))
                .build();
        recruiter.getIsRecruiterFor().add(company);

        when(companyRepository.findById(companyId)).thenReturn(Optional.of(company));
        when(userRepository.findByEmail(recruiter.getEmail())).thenReturn(Optional.of(recruiter));

        //when
        companyService.removeUserFromCompanyRecruiters(companyId, recruiter.getEmail());

        //then
        verify(companyRepository, times(1)).save(companyCaptor.capture());
        Company savedCompany = companyCaptor.getValue();
        assertThat(savedCompany.getRecruiters()).hasSize(0);
        assertThat(recruiter.getIsRecruiterFor()).hasSize(0);
    }

    @Test
    void removeUserFromCompanyRecruitersCompanyNotEnabled() {
        //given
        Integer companyId = 1;
        User recruiter = User.builder().email("recruiter@email").build();
        Company company = Company.builder()
                .id(companyId)
                .enabled(true)
                .recruiters(new HashSet<>(Set.of(recruiter)))
                .build();
        recruiter.getIsRecruiterFor().add(company);

        when(companyRepository.findById(companyId)).thenReturn(Optional.of(company));

        //when
        assertThrows(
                ResourceNotFoundException.class,
                () -> companyService.removeUserFromCompanyRecruiters(companyId, recruiter.getEmail())
        );
    }

    @Test
    void removeUserFromCompanyRecruitersNotRecruiter() {
        //given
        Integer companyId = 1;
        User recruiter = User.builder().email("recruiter@email").build();
        Company company = Company.builder()
                .id(companyId)
                .enabled(true)
                .build();

        when(companyRepository.findById(companyId)).thenReturn(Optional.of(company));
        when(userRepository.findByEmail(recruiter.getEmail())).thenReturn(Optional.of(recruiter));

        //when
        assertThrows(
                ResourceConflictException.class,
                () -> companyService.removeUserFromCompanyRecruiters(companyId, recruiter.getEmail())
        );
    }
}