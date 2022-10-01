package pjatk.Apply4IT;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.password.PasswordEncoder;
import pjatk.Apply4IT.model.Address;
import pjatk.Apply4IT.model.Authority;
import pjatk.Apply4IT.model.User;
import pjatk.Apply4IT.repository.UserRepository;

import java.time.LocalDate;
import java.util.List;

@SpringBootApplication
@RequiredArgsConstructor
public class Apply4ItApplication implements CommandLineRunner {

	private final UserRepository userRepository;
	private final PasswordEncoder passwordEncoder;

	public static void main(String[] args) {
		SpringApplication.run(Apply4ItApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		userRepository.save(User.builder()
				.firstName("imie")
				.lastName("nazwisko")
				.email("email@email.com")
				.password(passwordEncoder.encode("pass"))
				.birthdate(LocalDate.now())
				.authorities(List.of(new Authority("permission")))
				.address(Address.builder()
						.country("kraj")
						.city("miasto")
						.zip("zip")
						.street("ulica")
						.build())
				.description("")
				.build()
		);
	}
}
