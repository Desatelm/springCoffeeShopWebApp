package edu.mum.coffee.wsController;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import edu.mum.coffee.service.PersonService;


@Configuration
public class DaoConfig {
	@Bean
	public PersonService personService() {
		return new PersonService();
	}

	

}
