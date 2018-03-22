package com.army.movieEro.member.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.army.movieEro.member.service.MemberService;
import com.army.movieEro.member.vo.MemberVO;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;	
	
	// 회원 가입 폼
	@RequestMapping(value="join.do")
	public String memberJoin(Model model) {
		
		return "member/meberJoin";
	}
	
	// 회원 아이디 중복검사
	@RequestMapping(value="memberIdCheck.do")
	public void memberIdCheck(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {

		String desiredId = request.getParameter("desiredId");
		boolean hasId = memberService.idCheck(desiredId);
		
		if(hasId) {
			System.out.println("중복 아이디 존재");
		} else {		
			System.out.println("가입 가능");
			response.getWriter().write(desiredId);
		}
	}
	
	// 회원 가입 완료
	@RequestMapping(value="memberInsert.do")
	public String memberInsert(MemberVO memberVO) {
		int result;
		try {
			result = memberService.insertMember(memberVO);
		} catch (Exception e) {
			return "error/db";
		}
		return "member/meberJoinComplete";
	}
	
	// 회원 로그인
	@RequestMapping(value="login.do")
	public void memberLogin(@RequestParam Map<String, String> loginInfo, HttpSession session) {
		//session.setAttribute("member", memberService.loginMember(memberVO.getMb_id() , memberVO.getMb_passwd()));
		
		// 로그인 ajax로 처리해보기
		//System.out.println(loginInfo); //{login_id=qwqw, login_pw=asas}
		String id = loginInfo.get("login_id");
		String pw = loginInfo.get("login_pw");
		System.out.println(id);
		System.out.println(pw);
		
		MemberVO result;
		try {
			result = memberService.loginMember(id, pw);
			if(result != null) {
				session.setAttribute("member", loginInfo.get("login_id"));
				System.out.println(result);
				System.out.println(id+" 로그인 완료");
			} else  {
				System.out.println(id+" 로그인 실패");			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
	}	

}