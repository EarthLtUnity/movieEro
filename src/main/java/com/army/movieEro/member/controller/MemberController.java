package com.army.movieEro.member.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.army.movieEro.member.service.MemberService;
import com.army.movieEro.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	// 회원 가입 폼
	@RequestMapping(value="join.do")
	public String memberJoin(Model model) {
		
		return "member/memberJoin";
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
		return "member/memberJoinComplete";
	}
	
	// 로그인
	@RequestMapping(value="login.do")
	public void memberLogin(@RequestParam Map<String, String> loginInfo, HttpSession session, HttpServletResponse response) {
		// 로그인 ajax로 처리
		//System.out.println(loginInfo); //{login_id=qwqw, login_pw=asas}
		String id = loginInfo.get("login_id");
		String pw = loginInfo.get("login_pw");
		System.out.println(id);
		System.out.println(pw);
		
		MemberVO result;
		try {
			result = memberService.loginMember(id, pw);
			if(result != null) { // 로그인 성공시 아이디를 화면에 내림
				session.setAttribute("member", loginInfo.get("login_id"));
				response.getWriter().write(id);
				System.out.println(id+" 로그인 완료");
			} else  {
				response.getWriter().write("FAIL");
				System.out.println(id+" 로그인 실패");			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
	}	

	// 로그아웃
	@RequestMapping(value="signOut.do")
	public String memberLogOut(HttpSession session) {
		session.invalidate();
		return "redirect:./";
	}

	// 회원정보 수정폼 이동
	@RequestMapping(value="memberModifyForm.do")
	public String memberModifyForm(HttpSession session) {
		//System.out.println(session.getAttribute("member"));
		return "member/memberUpdate";
	}
	
	// 회원정보 수정
	@RequestMapping(value="memberModify.do")
	public void memberModify(MemberVO memberVO, HttpSession session, HttpServletResponse response) {
		int result;
		response.setContentType("text/html; charset=UTF-8");
		try {
			result = memberService.updateMember(memberVO);
			PrintWriter out = response.getWriter();
			if(result > 0) {
				out.print("<script>");
				out.print("<script>alert('회원정보 수정 완료');");
				out.print("location.href='./';");
				out.print("</script>");
				System.out.println("회원정보 수정 완료");				
			} else {
				out.print("<script>");
				out.print("<script>alert('회원정보 수정중 에러가 발생했습니다');");
				out.print("location.href='./';");
				out.print("</script>");				
			}
		} catch (Exception e) {
			e.printStackTrace();
			//return "error/db";
		}
		//return "member/memberModiComplete";		
	}	
	
}