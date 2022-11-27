//package pjatk.Apply4IT.bootstrap;
//
//import lombok.RequiredArgsConstructor;
//import org.springframework.boot.CommandLineRunner;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.stereotype.Component;
//import pjatk.Apply4IT.model.*;
//import pjatk.Apply4IT.repository.CategoryRepository;
//import pjatk.Apply4IT.repository.LocalizationRepository;
//import pjatk.Apply4IT.repository.OfferRepository;
//import pjatk.Apply4IT.repository.UserRepository;
//import pjatk.Apply4IT.service.OfferService;
//
//import javax.transaction.Transactional;
//import java.time.LocalDate;
//import java.time.temporal.ChronoUnit;
//import java.util.List;
//
//@Component
//@RequiredArgsConstructor
//public class DbExampleDataInitializer implements CommandLineRunner{
//
//    private final OfferRepository offerRepository;
//    private final OfferService offerService;
//    private final UserRepository userRepository;
//    private final PasswordEncoder passwordEncoder;
//    private final CategoryRepository categoryRepository;
//    private final LocalizationRepository localizationRepository;
//
//
//    @Transactional
//    public void run(String... args) throws Exception {
//
//
//        Authority userAuthority = Authority.builder().name("ROLE_USER").build();
//        Authority adminAuthority = Authority.builder().name("ROLE_ADMIN").build();
//
//        OfferAdvantage offerAdvantage1 = OfferAdvantage.builder()
//                .description("dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1" +
//                        "dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 ")
//                .build();
//        OfferAdvantage offerAdvantage2 = OfferAdvantage.builder()
//                .description("dEsCrIpTION2 dEsCrIpTION2 dEsCrIpTION2 dEsCrIpTION2 dEsCrIpTION2 dEsCrIpTION2" +
//                        "dEsCrIpTION2")
//                .build();
//        OfferAdvantage offerAdvantage3 = OfferAdvantage.builder()
//                .description("dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3" +
//                        "dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3")
//                .build();
//        Expectation expectation1 = Expectation.builder()
//                .description("dEsCrIption1 dEsCrIption1 dEsCrIption1 dEsCrIption1 dEsCrIption1 dEsCrIption1")
//                .build();
//        Expectation expectation2 = Expectation.builder()
//                .description("dESCripTIOn2 dESCripTIOn2 dESCripTIOn2 dESCripTIOn2 dESCripTIOn2 dESCripTIOn2" +
//                        "dESCripTIOn2 dESCripTIOn2")
//                .build();
//        Expectation expectation3 = Expectation.builder()
//                .description("dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 " +
//                        "dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 " +
//                        "dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 ")
//                .build();
//
//        Category category1 = Category.builder().title("cAtEgOry1 cAtEgOry1 cAtEgOry1").build();
//        Category category2 = Category.builder().title("cAtEgOry2 cAtEgOry2").build();
//        Category category3 = Category.builder().title("cAtEgOry3").build();
//
//        Localization localization1 = Localization.builder().name("lOcAlIzAtIoN1").build();
//        Localization localization2 = Localization.builder().name("lOcAlIzAtIoN2").build();
//
//        Company company1 = Company.builder()
//                .name("cOmPaNy1 cOmPaNy1 cOmPaNy1")
//                .description("descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1" +
//                        "descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1" +
//                        "descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1" +
//                        "descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1")
//                .logoPhoto(null)
//                .build();
//        Company company2 = Company.builder()
//                .name("cOmPaNy2")
//                .description("descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2" +
//                        "descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2")
//                .logoPhoto(null)
//                .build();
//        Company company3 = Company.builder()
//                .name("cOmPaNy3 cOmPaNy3")
//                .description("desCRiption3 desCRiption3 desCRiption3 desCRiption3 desCRiption3 desCRiption3")
//                .logoPhoto(null)
//                .build();
//
//        Offer offer1 = Offer.builder()
//                .title("tItLe1 tItLe1 tItLe1 tItLe1 tItLe1 tItLe1 tItLe1")
//                .description("DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1" +
//                        "DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1" +
//                        "DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1")
//                .firstJobPossibility(true)
//                .remotePossibility(true)
//                .creationDate(LocalDate.now())
//                .closingDate(LocalDate.now())
//                .minSalaryPln(6000)
//                .maxSalaryPln(10000)
//                .address(new Address("Kraj", "Miasto", "ZIP", "Ulica"))
//                .build();
//        Offer offer2 = Offer.builder()
//                .title("tItLe2 tItLe2")
//                .description("DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 " +
//                        "" +
//                        "DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2" +
//                        "DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2" +
//                        "DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2")
//                .firstJobPossibility(true)
//                .remotePossibility(false)
//                .creationDate(LocalDate.now())
//                .closingDate(LocalDate.now().minus(30, ChronoUnit.DAYS))
//                .minSalaryPln(12000)
//                .maxSalaryPln(24000)
//                .address(new Address("Kraj kraj kraj kraj", "Miasto miasto miasto miasto", "ZIPZIPZIP", "Ulica ulica ulica ulica"))
//
//                .build();
//        Offer offer3 = Offer.builder()
//                .title("tItLe3")
//                .description("DeScRiption3 DeScRiption3 DeScRiption3 DeScRiption3 DeScRiption3 DeScRiption3 DeScRiption3")
//                .firstJobPossibility(false)
//                .remotePossibility(true)
//                .creationDate(LocalDate.now())
//                .closingDate(LocalDate.now().minus(30, ChronoUnit.DAYS))
//                .minSalaryPln(8000)
//                .maxSalaryPln(12000)
//                .address(new Address("Kraj", "Miasto", "ZIP", "Ulica"))
//                .build();
//
//        User admin = User.builder()
//                .firstName("imie1")
//                .lastName("nazwisko1")
//                .email("email1@email.com")
//                .password(passwordEncoder.encode("pass"))
//                .birthdate(LocalDate.now())
//                .photo(null)
//                .authorities(List.of(adminAuthority))
//                .address(Address.builder()
//                        .country("Kraj")
//                        .city("Miasto")
//                        .zip("ZIPCODE")
//                        .street("Ulica")
//                        .build())
//                .description("DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1" +
//                        "DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1" +
//                        "DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1")
//                .build();
//
//        adminAuthority.getUsers().add(admin);
//
//        User user2 = User.builder()
//                .firstName("imie2")
//                .lastName("nazwisko2")
//                .email("email2@email.com")
//                .password(passwordEncoder.encode("pass"))
//                .birthdate(LocalDate.now())
//                .photo(null)
//                .authorities(List.of(userAuthority))
//                .address(Address.builder()
//                        .country("Kraj")
//                        .city("Miasto")
//                        .zip("ZIPCODE")
//                        .street("Ulica")
//                        .build())
//                .description("DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2" +
//                        "DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2" +
//                        "DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2")
//                .build();
//
//        User user3 = User.builder()
//                .firstName("imie3")
//                .lastName("nazwisko3")
//                .email("email3@email.com")
//                .password(passwordEncoder.encode("pass"))
//                .birthdate(LocalDate.now())
//                .photo(null)
//                .authorities(List.of(userAuthority))
//                .address(Address.builder()
//                        .country("Kraj")
//                        .city("Miasto")
//                        .zip("ZIPCODE")
//                        .street("Ulica")
//                        .build())
//                .description("DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3" +
//                        "DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3" +
//                        "DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3")
//                .build();
//
//        User user4 = User.builder()
//                .firstName("imie4")
//                .lastName("nazwisko4")
//                .email("email4@email.com")
//                .password(passwordEncoder.encode("pass"))
//                .birthdate(LocalDate.now())
//                .photo(null)
//                .authorities(List.of(userAuthority))
//                .address(Address.builder()
//                        .country("Kraj")
//                        .city("Miasto")
//                        .zip("ZIPCODE")
//                        .street("Ulica")
//                        .build())
//                .description("DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4" +
//                        "DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4" +
//                        "DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4")
//                .build();
//
//        userAuthority.setUsers(List.of(user2, user3, user4));
//
//        Experience experience1 = Experience.builder()
//                .companyName("Company1 compANy1 companY1")
//                .job("job1 JoB1 JOB1 JOB1 job1 job1")
//                .description("DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1" +
//                        "DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1" +
//                        "DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1")
//                .startDate(LocalDate.now())
//                .endDate(LocalDate.now())
//                .stillWorking(false)
//                .build();
//
//        Experience experience2 = Experience.builder()
//                .companyName("Company2 compANy2 companY2")
//                .job("job2 JoB2 JOB2 JOB2 job2 job2")
//                .description("DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2" +
//                        "DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2" +
//                        "DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2")
//                .startDate(LocalDate.now())
//                .endDate(LocalDate.now())
//                .stillWorking(false)
//                .build();
//
//        Experience experience3 = Experience.builder()
//                .companyName("Company3 compANy3 companY3")
//                .job("job3 JoB3 JOB3 JOB3 job3 job3")
//                .description("DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3" +
//                        "DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3" +
//                        "DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3")
//                .startDate(LocalDate.now())
//                .endDate(null)
//                .stillWorking(true)
//                .build();
//
//        user2.getExperiences().add(experience1);
//        experience1.setUser(user2);
//
//        user2.getExperiences().add(experience2);
//        experience2.setUser(user2);
//
//        user3.getExperiences().add(experience3);
//        experience3.setUser(user3);
//
//
//        Education education1 = Education.builder()
//                .startDate(LocalDate.now())
//                .endDate(null)
//                .stillStudying(true)
//                .major("KieruNEk1 KieruNEk1 KieruNEk1 KieruNEk1")
//                .specialization("Specjalizacja1 specjalizacja1 specjalizacja1")
//                .universityName("UniversitY1 UniversitY1 UniversitY1 UniversitY1")
//                .build();
//
//        Education education2 = Education.builder()
//                .startDate(LocalDate.now())
//                .endDate(LocalDate.now())
//                .stillStudying(false)
//                .major("KieruNEk2 KieruNEk2 KieruNEk2 KieruNEk2")
//                .specialization("Specjalizacja2 specjalizacja2 specjalizacja2")
//                .universityName("UniversitY2 UniversitY2 UniversitY2 UniversitY2")
//                .build();
//
//        Education education3 = Education.builder()
//                .startDate(LocalDate.now())
//                .endDate(LocalDate.now())
//                .stillStudying(false)
//                .major("KieruNEk3 KieruNEk3 KieruNEk3 KieruNEk3")
//                .specialization("Specjalizacja3 specjalizacja3 specjalizacja3")
//                .universityName("UniversitY3 UniversitY3 UniversitY3 UniversitY3")
//                .build();
//
//        user2.getEducations().add(education1);
//        education1.setUser(user2);
//        user2.getEducations().add(education2);
//        education2.setUser(user2);
//        user3.getEducations().add(education3);
//        education3.setUser(user3);
//
//
//        Application application1 = Application.builder()
//                .applicationDate(LocalDate.now())
//                .cv(null)
//                .build();
//
//        Application application2 = Application.builder()
//                .applicationDate(LocalDate.now())
//                .cv(null)
//                .build();
//
//        Application application3 = Application.builder()
//                .applicationDate(LocalDate.now())
//                .cv(null)
//                .build();
//
//        application1.setTargetOffer(offer1);
//        offer1.getApplications().add(application1);
//        application1.setCandidate(user2);
//        user2.getApplications().add(application1);
//
//        application2.setTargetOffer(offer1);
//        offer1.getApplications().add(application2);
//        application2.setCandidate(user3);
//        user3.getApplications().add(application2);
//
//        application3.setTargetOffer(offer1);
//        offer1.getApplications().add(application3);
//        application3.setCandidate(user2);
//        user2.getApplications().add(application3);
//
//        user2.getIsRecruiterFor().add(company1);
//        company1.getRecruiters().add(user2);
//
//        user3.getIsRecruiterFor().add(company2);
//        company2.getRecruiters().add(user3);
//
//        offer1.setAuthor(user2);
//        user2.getCreatedOffers().add(offer1);
//        offer1.setCompany(user2.getIsRecruiterFor().get(0));
//
//        offer2.setAuthor(user2);
//        user2.getCreatedOffers().add(offer2);
//        offer2.setCompany(user2.getIsRecruiterFor().get(0));
//
//        offer3.setAuthor(user3);
//        user3.getCreatedOffers().add(offer3);
//        offer3.setCompany(user3.getIsRecruiterFor().get(0));
//
//
//        user2.getSavedOffers().add(offer1);
//        offer1.getUsersWhoSaved().add(user2);
//        user2.getSavedOffers().add(offer2);
//        offer2.getUsersWhoSaved().add(user2);
//
//        user3.getSavedOffers().add(offer3);
//        offer3.getUsersWhoSaved().add(user3);
//
//        user4.getSavedOffers().add(offer1);
//        offer1.getUsersWhoSaved().add(user4);
//        user4.getSavedOffers().add(offer2);
//        offer2.getUsersWhoSaved().add(user4);
//        user4.getSavedOffers().add(offer3);
//        offer3.getUsersWhoSaved().add(user4);
//
//
//        offer1.getCategories().add(category1);
//        category1.getOffers().add(offer1);
//        offer2.getCategories().add(category2);
//        category2.getOffers().add(offer2);
//        offer3.getCategories().add(category2);
//        category2.getOffers().add(offer3);
//        offer3.getCategories().add(category3);
//        category3.getOffers().add(offer3);
//
//
//        offer1.setLocalization(localization1);
//        localization1.getOffers().add(offer1);
//        offer2.setLocalization(localization2);
//        localization2.getOffers().add(offer2);
//        offer3.setLocalization(localization2);
//        localization2.getOffers().add(offer3);
//
//        offer1.setCompany(company1);
//        company1.getOffers().add(offer1);
//        offer2.setCompany(company2);
//        company2.getOffers().add(offer2);
//        offer3.setCompany(company3);
//        company3.getOffers().add(offer3);
//
//        offer1.getOfferAdvantages().add(offerAdvantage1);
//        offerAdvantage1.setOffer(offer1);
//        offer1.getOfferAdvantages().add(offerAdvantage2);
//        offerAdvantage2.setOffer(offer1);
//        offer2.getOfferAdvantages().add(offerAdvantage3);
//        offerAdvantage3.setOffer(offer2);
//
//        offer1.getExpectations().add(expectation1);
//        expectation1.setOffer(offer1);
//        offer2.getExpectations().add(expectation2);
//        expectation2.setOffer(offer2);
//        offer3.getExpectations().add(expectation3);
//        expectation3.setOffer(offer3);
//
//
//        userRepository.save(admin);
//        offerRepository.saveAll(List.of(offer1, offer2, offer3));
//
//
//        List<User> users = userRepository.findAll();
//        System.out.println(users);
//
//    }
//
//}
