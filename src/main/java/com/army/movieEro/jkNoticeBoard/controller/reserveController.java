package com.army.movieEro.jkNoticeBoard.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("CINEMA_NAME",paymentVO.getCINEMA_NAME());
			map.put("CINEMA_SECTION",paymentVO.getCINEMA_SECTION());
			map.put("CINEMA_MOVIE",paymentVO.getCINEMA_MOVIE());
			map.put("CINEMA_MOVIE_TIME",paymentVO.getCINEMA_MOVIE_TIME());
			map.put("MB_ID",paymentVO.getMB_ID());
			map.put("CINEMA_RESERVE_NO",CINEMA_RESERVE_NO);
			map.put("CINEMA_MOVIE_SEAT", seats[i]);
			REService.reserveInsert(map);
		}
		
		return "main/main.do";
	}
	
	@RequestMapping(value = "seatList.do")
	@ResponseBody
	public ArrayList<String> seatList(ModelAndView mv,HttpServletRequest request,@RequestParam(value="CINEMA_MOVIE_TIME") String CINEMA_MOVIE_TIME
			,@RequestParam(value="CINEMA_NAME") String CINEMA_NAME, @RequestParam(value="CINEMA_MOVIE") String CINEMA_MOVIE) {
			
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("CINEMA_MOVIE_TIME",CINEMA_MOVIE_TIME);
		map.put("CINEMA_NAME",CINEMA_NAME);
		map.put("CINEMA_MOVIE",CINEMA_MOVIE);
		System.out.println("map : " + map.toString());
		ArrayList<String> list = REService.seatList(map);
		System.out.println("list : " + list.toString());
		return list;
	}
}
