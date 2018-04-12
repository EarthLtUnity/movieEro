package com.army.movieEro.jkNoticeBoard.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.Spliterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String reserveInsert(ModelAndView mv,HttpServletRequest request,paymentVO paymentVO, @RequestParam Map<String, Object> param, @RequestParam(value="CINEMA_MOVIE_SEAT_SEC[]") String arrayParams) {
		System.out.println(paymentVO);
		System.out.println(param);
		System.out.println(arrayParams);
		String seats[];
		seats = arrayParams.split(",");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
		String CINEMA_RESERVE_NO = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ seats[0] + seats.length;
		for(int i = 0; i<seats.length; i++) {
			System.out.println(seats[i]);
			
		}
		//REService.reserveInsert(paymentVO);
		
		return "main/main.do";
	}
}
