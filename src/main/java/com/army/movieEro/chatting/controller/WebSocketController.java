package com.army.movieEro.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.army.movieEro.member.vo.MemberVO;

@Controller
public class WebSocketController {
	
	/** 테스트 컨트롤러들 : 작업 완료 후 다 삭제 */
	// 공지사항 테스트
	@RequestMapping(value="chatting.do")
	public String chatting(Model model) {
		System.out.println("testInit0 도착!!");
		
		return "chatting/test";
	}
	
}
