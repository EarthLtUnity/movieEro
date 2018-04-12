package com.army.movieEro.tkTheaterPayment.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	private theaterRentalDaoImpl theaterRentalServiceImpl;


	@RequestMapping("tpaymentselet.do")//영화 결제목록
	@ResponseBody
	public ArrayList<TheaterPayment> tpaymentselect(HttpServletResponse response,
			@RequestParam(value = "theater_pay_postion", required = false) String position,
			@RequestParam(value = "theater_pay_date", required = false) String date) {
				HashMap<String, String> tpmap = new HashMap<String, String>();
					tpmap.put("theater_pay_postion", position);
					tpmap.put("theater_pay_date",date);
				ArrayList<TheaterPayment> list = theaterPaymentServiceImpl.selectPayList(tpmap);
		return list;
	}
	
	
	@RequestMapping("myrentalinfo.do")//마이페이지 결제내역 리스트
	public ModelAndView myrentalinfo(ModelAndView mv,HttpSession session ,TheaterPayment vo) {
		String MB_ID = (String) session.getAttribute("memberID");
		ArrayList<TheaterPayment> list = theaterPaymentServiceImpl.selectPayList(MB_ID);
		ArrayList<theaterVO> theater = theaterRentalServiceImpl.selectList();
		mv.addObject("myrentallist", list).addObject("theaterImage",theater).setViewName("member/theaterRental");
		return mv;
	}
	
	@RequestMapping("myrentalcancancel.do")
	public String myrentalcancancel(@RequestParam("bnum") int bnum) {
	theaterPaymentServiceImpl.updatePayment(bnum);
	return "redirect:myrentalinfo.do"; 
	}
	
	@RequestMapping("myrentalprice.do") //가격 불러오기
	@ResponseBody
	public Object myrentalprice(@RequestParam("mypoint") String point) {
		System.out.println(point+"이거안오냐?");
		theaterVO vo = new theaterVO();
		vo = theaterPaymentServiceImpl.selectpayposition(point);
		System.out.println(vo.getRENTAL_SERVICE_TITLE());
		return vo;
	}
	
	@RequestMapping("paymentinsert.do")//결제시 DB 생성
	@ResponseBody
	public void paymentinsert(TheaterPayment vo,HttpServletRequest request,HttpServletResponse response) throws IOException{
		System.out.println("결제창이 왜안뜨냐?");
		if(theaterPaymentServiceImpl.insertPayment(vo)>0) {
			response.getWriter().write("결제가 완료되었습니다");
		}
	}
}
