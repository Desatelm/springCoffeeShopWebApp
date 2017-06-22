package edu.mum.coffee.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

	@GetMapping({ "/index", "/home" })
	public String homePage() {
		return "home";
	}

	@GetMapping({ "/secure" })
	public String securePage() {
		return "secure";
	}

}
