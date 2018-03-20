package com.army.movieEro.member.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.army.movieEro.member.service.MemberService;
import com.army.movieEro.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;	
	
	@RequestMapping(value="join.do")
	public String MemberJoin(Model model) {
		
		return "member/meberJoin";
	}
	
	@RequestMapping(value="memberInsert.do")
	public ModelAndView MemberInsert(MemberVO memberVO, ModelAndView mv) {
		
		int result = memberService.insertMember(memberVO);
		if(result > 0) mv.setViewName("member/meberJoinComplete");
		return mv;
	}
	
}
