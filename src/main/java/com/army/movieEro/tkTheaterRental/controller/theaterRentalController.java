package com.army.movieEro.tkTheaterRental.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.army.movieEro.tkTheaterRental.dao.theaterRentalDaoImpl;
import com.army.movieEro.tkTheaterRental.vo.theaterVO;

@Controller
public class theaterRentalController {

	@Autowired
	theaterRentalDaoImpl theaterRentalServiceImpl;
	
	@RequestMapping("RentalService.do")
	public ModelAndView moviex(ModelAndView mv, theaterVO board) {
		System.out.println("컨트롤러");
		ArrayList<theaterVO> theater = theaterRentalServiceImpl.selectList();
		mv.addObject("theater",theater).setViewName("tkTheaterRental/RentalService");
		
		return mv;
		
	}
	@RequestMapping("ex2.do")
	public String moviex2(ModelAndView mv) {
		return "tkTheaterRental/RentalService";
	}
	
}
