package com.army.movieEro.jkNoticeBoard.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.army.movieEro.jkNoticeBoard.service.reserveService;
import com.army.movieEro.jkNoticeBoard.vo.paymentVO;

@Controller
public class reserveController {

	
	@Autowired
	private reserveService REService;//reserveService로 변경
	
	@RequestMapping(value = "reserve.do")
	@ResponseBody
	public String reserveInsert(ModelAndView mv,HttpServletRequest request,paymentVO paymentVO) {
		System.out.println("여기까지 왔나만 한번 보자 제발 와라 제발!!   왔다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		System.out.println(request.getParameter("MB_ID"));
		System.out.println(paymentVO);
		System.out.println("넘어온 좌석 번호 테스트 : "+paymentVO.getCINEMA_RESERVE_NO());
		
		
		
		REService.reserveInsert(paymentVO);
		
		return "main/main.do";
	}
}
