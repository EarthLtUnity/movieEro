package com.army.movieEro.tkTheaterPayment.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.army.movieEro.tkTheaterPayment.dao.TheaterPaymentDaoImpl;
import com.army.movieEro.tkTheaterPayment.vo.TheaterPayment;
import com.army.movieEro.tkTheaterRental.dao.theaterRentalDaoImpl;
import com.army.movieEro.tkTheaterRental.service.theaterRentalServiceImpl;
import com.army.movieEro.tkTheaterRental.vo.theaterImageVo;
import com.army.movieEro.tkTheaterRental.vo.theaterVO;

@Controller
public class theaterPaymentController {

@Autowired
private TheaterPaymentDaoImpl theaterPaymentServiceImpl;
@Autowired
theaterRentalDaoImpl theaterRentalServiceImpl;


@RequestMapping("tpaymentselet.do")
public ModelAndView tpaymentselect(ModelAndView mv, @RequestParam(value = "theater_pay_postion", required = false) String position,
		@RequestParam(value = "theater_pay_date", required = false) String date) {
	HashMap<String, String> tpmap = new HashMap<String, String>();
	tpmap.put("theater_pay_postion", position);
	tpmap.put("theater_pay_date",date);
	ArrayList<TheaterPayment> list = theaterPaymentServiceImpl.selectPayList(tpmap);
	mv.addObject("list",list);
	System.out.println(list.size());
	return mv;
}
@RequestMapping("qwer.do")
public String tpaymentinsert(TheaterPayment vo, HttpServletRequest request) {
	
	theaterPaymentServiceImpl.insertPayment(vo);
	return "qwer";
}
@RequestMapping("myrentalinfo.do")
public ModelAndView myrentalinfo(ModelAndView mv,HttpSession session ,TheaterPayment vo) {
	String MB_ID = (String) session.getAttribute("memberID");
	System.out.println("아이디값들어가나?"+MB_ID);
	ArrayList<TheaterPayment> list = theaterPaymentServiceImpl.selectPayList(MB_ID);
	ArrayList<theaterVO> theater = theaterRentalServiceImpl.selectList();
	mv.addObject("myrentallist", list).addObject("theaterImage",theater).setViewName("member/theaterRental");
	return mv;
}
}
