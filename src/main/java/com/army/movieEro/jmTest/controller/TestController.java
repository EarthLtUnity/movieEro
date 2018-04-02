package com.army.movieEro.jmTest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.army.movieEro.member.vo.MemberVO;

@Controller
public class TestController {
	
	/** 테스트 컨트롤러들 : 작업 완료 후 다 삭제 */
	// 공지사항 테스트
	@RequestMapping(value="testBoard.do")
	public String testInit0(Model model) {
		System.out.println("testInit0 도착!!");
		
		return "jmTest/board";
	}
	
	// 회원가입완료 페이지 퍼블 수정용
	@RequestMapping(value="testJoin.do")
	public String testInit1(MemberVO memberVO) {
		return "member/memberJoinComplete";
	}
	
	// 게시판 템플릿 : 리스트
	@RequestMapping(value="testlist.do")
	public String testlist(MemberVO memberVO) {
		return "template/board_list";
	}	
	
	// 게시판 템플릿 : 뷰
	@RequestMapping(value="testview.do")
	public String testview(MemberVO memberVO) {
		return "template/board_view";
	}	
	
	// 채팅 테스트1
	@RequestMapping(value="testChat.do")
	public String testChat(MemberVO memberVO) {
		return "ws/chatExam";
	}	
	// 채팅 테스트2
	@RequestMapping(value="testMainChat.do")
	public String testChat2(MemberVO memberVO) {
		return "chatting/testChat";
	}	
}
