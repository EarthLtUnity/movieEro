package com.army.movieEro.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping(value="main.do")
	public String goHome(Model model) {
		System.out.println("MainController 도착!!");
		
		return "main/main";
	}
	
}
