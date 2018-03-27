package com.army.movieEro.stCommunity.With_board.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {
	
	@RequestMapping(value="community.do")
	public String testInit(Model model) {
		System.out.println("CommunityController 도착!!");
		
		return "stCommunityBoard/boardList";
	}
	
	@RequestMapping("boardInsert")
	public String BoardinsertForm(Locale locale, Model model) {
		
		return "stCommunityBoard/boardInsertForm";
	
}
}