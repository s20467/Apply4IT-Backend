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
public class Apply4ItApplication {

	public static void main(String[] args) {
		SpringApplication.run(Apply4ItApplication.class, args);
	}

}
