package br.com.fusion7.tasks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	
	@RequestMapping("/")
	public String PageController() {
		
		System.out.println("Executando a logica com Spring!!!");
		
		return "index";
	}
}
