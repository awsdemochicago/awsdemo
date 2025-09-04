package com.example.AWS.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class GreetingController {
	
	@GetMapping
	public String getGreetings() {
		
		return "Hello";
	}

}
