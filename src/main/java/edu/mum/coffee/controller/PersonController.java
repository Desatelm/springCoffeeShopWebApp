package edu.mum.coffee.controller;

import java.util.List;

/**
 * @author destalem
 *
 */

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.coffee.domain.Address;
import edu.mum.coffee.domain.Person;
import edu.mum.coffee.service.PersonService;

@Controller
public class PersonController {

	@Autowired
	private PersonService personService;

	@GetMapping(value = "/person")
	public String getAll(Model model) {
		model.addAttribute("person", personService.getAll());
		return "person";
	}

	@RequestMapping(value = "addPerson", method = RequestMethod.GET)
	public String addPerson(Person person) {
		return "createPersonacount";
	}

	@RequestMapping(value = "addAddress", method = RequestMethod.POST)
	public String addAdress(Person person, Model model) {
		model.addAttribute("person", person);
		return "redirect:/address";
	}

	@RequestMapping(value = "savePerson", method = RequestMethod.POST)
	public String Person(Person person, Address address) {
		person.setAddress(address);
		personService.savePerson(person);
		return "redirect:/person";
	}

	@RequestMapping(value = "delete/{id}", method = RequestMethod.POST)
	public String delete(@PathVariable Long id) {
		personService.removePerson(personService.findById(id));
		return "redirect:/person";
	}

	@RequestMapping(value = "persons/{id}", method = RequestMethod.GET)
	public String get(Model model, @PathVariable Long id) {
		model.addAttribute("person", personService.findById(id));
		return "updateProfile";
	}

	@RequestMapping(value = "personUpdate/{id}", method = RequestMethod.POST)
	public String update(Person person, @PathVariable Long id, Address address) {

		person.setAddress(address);
		personService.savePerson(person);
		return "redirect:/person";
	}

}
