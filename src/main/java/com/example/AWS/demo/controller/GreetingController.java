package com.example.AWS.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class GreetingController {
	
	@GetMapping
	public String getGreetings() {
		
		
<<<<<<< HEAD
		return "Hello World";
=======

		return "Hello World";

>>>>>>> 408a1c789a2a65980820deed75d459316fb5d6cf
	}

}
