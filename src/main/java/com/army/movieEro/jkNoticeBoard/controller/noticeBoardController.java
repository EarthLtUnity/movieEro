package com.army.movieEro.jkNoticeBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class noticeBoardController {
	
	@RequestMapping(value="notice.do")
	public String testInit(Model model) {
		System.out.println("noticeBoardController 도착!!");
		
		return "jkNoticeBoard/noticeBoardList";
	}
	
	@RequestMapping(value="noticeInsert.do")
	public String testInitInsert(Model model) {
		System.out.println("noticeInsertController 도착!!");
		
		return "jkNoticeBoard/noticeInsertForm";
	}
}