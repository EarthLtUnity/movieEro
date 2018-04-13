package com.army.movieEro.tkTheaterRental.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.army.movieEro.tkTheaterRental.dao.theaterRentalDaoImpl;
import com.army.movieEro.tkTheaterRental.vo.theaterImageVo;
import com.army.movieEro.tkTheaterRental.vo.theaterVO;

@Controller
public class theaterRentalController {

	@Autowired
	theaterRentalDaoImpl theaterRentalServiceImpl;
	
	@RequestMapping("RentalService.do") //정보보기 리스트
	public ModelAndView moviex(ModelAndView mv, theaterVO board) {
		System.out.println("컨트롤러");
		ArrayList<theaterVO> theater = theaterRentalServiceImpl.selectList();
		ArrayList<theaterImageVo> theaterImage =  theaterRentalServiceImpl.selectImage();
		
		mv.addObject("theater",theater).addObject("theaterImage",theaterImage).setViewName("tkTheaterRental/RentalService");
		
		return mv;
		
	}
	
	@RequestMapping("RentalServiceView.do") //정보보기 디테잉
	public ModelAndView moviex2(ModelAndView mv, @RequestParam("bnum") int bnum ) {
		
		theaterVO theaterview = theaterRentalServiceImpl.selectView(bnum);
		ArrayList<theaterImageVo> theaterImage =  theaterRentalServiceImpl.selectImageView(bnum);
		mv.addObject("theaterview",theaterview).addObject("theaterImage",theaterImage).setViewName("tkTheaterRental/RentalServiceView");
		return mv;
	}
	
}
