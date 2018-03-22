package com.army.movieEro.rentalQnA.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.army.movieEro.rentalQnA.service.RentalQnAService;
import com.army.movieEro.rentalQnA.vo.RentalQnAVO;

@Controller
public class RentalQnAController {

	@Autowired 
	private RentalQnAService rentalQnAService;
	
	@RequestMapping("/rentalQnA")
	public ModelAndView boardList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {
		// 페이지 값 처리용
		int currentPage = 1;
		// 한 페이지당 출력할 목록 갯수
		
		int limit = 10;

		// 전달된 페이지값 추출
		if (page != null)
			currentPage = page;

		// 전체 목록 갯수와 해당 페이지별 목록을 리턴
		int listCount = rentalQnAService.getListCount();

		ArrayList<RentalQnAVO> list = rentalQnAService.selectList(currentPage, limit);

		// 총 페이지수 계산 : 목록이 최소 1개일 때 1page로 처리하기
		// 위해 0.9 더함
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지에 보여줄 시작 페이지수
		// (1, 11, 21, .......)
		// 현재 페이지가 13page 이면 시작페이지는 11page 가 되어야 함
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		// 만약, 목록 아래에 보여질 페이지 갯수가 10개이면
		// 끝페이지수는 20페이지가 되어야 함
		int endPage = startPage + limit - 1;
		if (maxPage < endPage)
			endPage = maxPage;

		if (list != null && list.size() > 0) {

			mv.addObject("list", list)
			.addObject("currentPage", currentPage)
			.addObject("maxPage", maxPage)
			.addObject("startPage", startPage)
			.addObject("endPage", endPage)
			.addObject("listCount", listCount)
			.setViewName("board/boardListView");
		} else {
			mv.addObject("error", "게시글 전체 조회 실패");
			mv.setViewName("board/boardError");
		}
		return mv;
	}
	
	@RequestMapping(value="ex.do")
	public String goEX(Model model) {
		System.out.println("왜못찾지");
		
		return "tkRentalQnABoard/RentalService";
	}
	
	@RequestMapping(value="ex2.do")
	public String go2EX(Model model) {
		System.out.println("왜못찾지");
		
		return "tkRentalQnABoard/QnABoard";
	}

}
