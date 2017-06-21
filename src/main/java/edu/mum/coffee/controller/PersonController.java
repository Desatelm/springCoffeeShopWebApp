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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.mum.coffee.domain.Address;
import edu.mum.coffee.domain.Person;
import edu.mum.coffee.service.PersonService;
import edu.mum.coffee.service.ProductService;

@Controller
public class PersonController {

	@Autowired
	private PersonService personService;
	@Autowired
	private ProductService productService; 


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
	public String get( @PathVariable Long id, Model model) {		
		Person person = personService.findById(id);
		model.addAttribute(person);
		return "editProfile";
	}

	@RequestMapping(value = "personUpdate/{id}", method = RequestMethod.POST)
	public String update(Person person, @PathVariable Long id, Address address) {
        Person per = personService.findById(id);
        per = person;
		per.setAddress(address);
		personService.savePerson(per);
		return "redirect:/person";
	}
	/*User profile*/
 
	@RequestMapping(value = "userProfile/", method = RequestMethod.POST)
	public ModelAndView getProfile( @RequestParam("email") String email) {
		List<Person> pers = personService.findByEmail(email);
		ModelAndView model = new ModelAndView("updateProfile");
		model.addObject("person", pers.get(0));
		return model;
	}

	@RequestMapping(value = "updateProfile/{id}", method = RequestMethod.POST)
	public ModelAndView updateProfile(Person person, @PathVariable Long id, Address address) {
        Person per = personService.findById(id);
        per = person;
		per.setAddress(address);
		personService.savePerson(per);		
		ModelAndView model = new ModelAndView("welcome");
		model.addObject("products", productService.getAllProduct());
		return model;
	}

}
