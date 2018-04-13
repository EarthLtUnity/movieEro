package com.army.movieEro.stCommunity.With_board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.army.movieEro.stCommunity.With_board.service.WithBoardService;
import com.army.movieEro.stCommunity.With_board.vo.WithBoard;
import com.army.movieEro.stCommunity.With_board.vo.WithBoard_sub;

@Controller
public class WithController {
	

		@Autowired
		private WithBoardService bService;

		// withBoardlist 출력
		@RequestMapping("withBoardList.do")
		public ModelAndView boardList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {
			System.out.println("withBoardlist_controller 도착");
			// 페이지 값 처리용
			int currentPage = 1;
			// 한 페이지당 출력할 목록 갯수
			int limit = 10;

			// 전달된 페이지값 추출
			if (page != null)
				currentPage = page;

			// 전체 목록 갯수와 해당 페이지별 목록을 리턴
			int listCount = bService.getListCount();

			
			ArrayList<WithBoard> list = bService.selectList(currentPage, limit);
			System.out.println(list);
			ArrayList<WithBoard_sub> listsub = bService.selectListsub(currentPage, limit);
			System.out.println(listsub);
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
				.addObject("listsub", listsub)
				.addObject("currentPage", currentPage)
				.addObject("maxPage", maxPage)
				.addObject("startPage", startPage)
				.addObject("endPage", endPage)
				.addObject("listCount", listCount)
				.setViewName("stCommunityBoard/boardList");
			} else {
				mv.addObject("error", "게시글 전체 조회 실패");
				mv.setViewName("stCommunityBoard/boardList");
			}
			return mv;
		}

		
		
		
		// insertForm 이동
		@RequestMapping("withBoardinsertForm.do")
		public String boardInsertView(Model model) {
			return "stCommunityBoard/boardInsertForm";
		}
		
		
		// insert 실행
		@RequestMapping("withBoardInsert.do")
		public ModelAndView boardInsertMethod(ModelAndView mv, WithBoard board)
				throws IOException {
			System.out.println("withBoardInsert_controller 도착");
			if (bService.insertBoard(board) > 0) {
				mv.setViewName("redirect:withBoardList.do");
			} else {
				mv.addObject("error", "게시 원글 등록 서비스 실패!");
				mv.setViewName("board/boardError");
			}
			return mv;
		}

		

		// BoardIntro 페이지 띄어주기 
		@RequestMapping("withBoadIntro.do")
		public String WithBoardIntroView(Model model) {
			return "stCommunityBoard/boardIntro";
		}
		
		
		// BoardUpdate (join버튼 + 결제 )
		@RequestMapping("withReserve.do")
		public void withReserve(HttpServletResponse response, 
				@RequestParam("WITH_BOARD_NO") int bNo, 
				@RequestParam("WITH_BOARD_NOW_ID") String bNo_id) {
			System.out.println("withReserve_controller 도착");
			bService.withReserve(bNo, bNo_id);
			
			 response.setContentType("text/html;charset=utf-8");
			PrintWriter out = null;
			try {
				out = response.getWriter();
				out.append("ok");
			} catch (IOException e) {
			}
			out.flush();
			out.close();
		}
		
		
		// BoardSearch 
		@SuppressWarnings("unchecked")
		@RequestMapping("withSearch.do")
		public ModelAndView withSearch(ModelAndView mv, 
				@RequestParam(value = "page", required = false) Integer page,
				@RequestParam("WITH_BOARD_SEARCH_WORD") String word) {
			System.out.println("withSearch_controller 도착");
			// 페이지 값 처리용
			int currentPage = 1;
			// 한 페이지당 출력할 목록 갯수
			int limit = 10;

			// 전달된 페이지값 추출
			if (page != null)
				currentPage = page;

			// 전체 목록 갯수와 해당 페이지별 목록을 리턴
			int listCount = bService.getListCountSearch(word);
			
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
			
			HashMap<String, Object> map = bService.searchList(currentPage, limit, word);
			
			ArrayList<WithBoard> list = (ArrayList<WithBoard>) map.get("searchList");
			ArrayList<WithBoard_sub> listsub = (ArrayList<WithBoard_sub>) map.get("searchSubList");
			
			System.out.println("list : "+list);
			System.out.println("listsub : "+listsub);
			
			if (list != null && list.size() > 0) {

				mv.addObject("list", list)
				.addObject("listsub", listsub)
				.addObject("currentPage", currentPage)
				.addObject("maxPage", maxPage)
				.addObject("startPage", startPage)
				.addObject("endPage", endPage)
				.addObject("listCount", listCount)
				.setViewName("stCommunityBoard/boardList");
			} else {
				mv.addObject("error", "게시글 전체 조회 실패");
				mv.setViewName("stCommunityBoard/boardList");
			}
			return mv;
		}
				
				
				
				
				

}