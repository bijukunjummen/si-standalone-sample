package standalone;

import org.springframework.boot.SpringApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

@Configuration
@ImportResource("classpath:httpgateway.xml")
public class Main {

	public static void main(String[] args) {
		SpringApplication.run(Main.class, args);
	}
}
