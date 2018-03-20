package com.army.movieEro.jmTest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@RequestMapping(value="test.do")
	public String testInit(Model model) {
		System.out.println("TestController 도착!!");
		
		return "jmTest/board";
	}
	
}
