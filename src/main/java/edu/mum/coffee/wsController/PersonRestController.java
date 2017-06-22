package edu.mum.coffee.wsController;

/**
 * @author destalem
 *
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.mum.coffee.domain.Person;
import edu.mum.coffee.service.PersonService;

@RestController
public class PersonRestController {

	@Autowired
	private PersonService personService;

	@GetMapping(value = "Rest/email")
	public List<Person> getAll() {
		return personService.getAll();
	}

	@PostMapping(value = "Rest/person")
	public String addOrder(@RequestBody Person person) {
		personService.savePerson(person);
		return "successful";
	}

	@DeleteMapping(value = "Rest/delete/person")
	public String delete(@RequestBody Person person) {
		personService.removePerson(person);
		return "successful";
	}

	@RequestMapping(value = "Rest/persont/personId", method = RequestMethod.POST)
	public Person update(@PathVariable long personId, @RequestBody Person person) {
		Person per = personService.findById(personId);
		per = person;
		return personService.savePerson(per);
	}

}
