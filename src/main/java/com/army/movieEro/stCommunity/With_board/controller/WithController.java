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
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		
		
		
		
		
		
		
			// BoardIntro 페이지 띄어주기 
				@RequestMapping("writerPhoneNumber.do")
				@ResponseBody // 이 어노테이션을 사용하면
				              // 자바에서 넘겨주는 값을 jsp에서 JSON 형식으로 읽습니다.
				              // 종민씨가 잘 찾으셨더군요 ㅎㅎ
					// 그럼 현재 String이 JSP에서도 String으로 넘어 오겠죠?
				public String writerPhoneNumber(
						@RequestParam("WITH_BOARD_WRITER") String writer
					) {
					System.out.println("writerPhoneNumber_controller 도착");
					String[] aa = writer.split(", ");	
					String writerId = aa[0];
					System.out.println("writerId : " + writerId);
					
					// 받은 숫자를 이렇게 문자로 바꿔 버립니다. 요기!
					String writerNo = "0"+String.valueOf(bService.writerPhoneNumber(writerId));
					// 끝
					/*
					질문 있습니다!
					그럼 여기서0 이 지워지는 시점은 int로 들어간 지금  요기 시점에서
					사라지는 건가요? 아니면
					중간에 int로 값을 받으면서
					이미 없어져서 여기에 도착하는 건가요? <--- Correct!
					중간에 값을 int로 받기 시작한 시점부터 0을 버리고 옵니다.
					감사합니다! 주어다 주셨군요!!
					오다 주웠습니다 ^_^
					
					그럼 이것도 해결 된건가요?
					네! 감사합니다! 마지막으로
					다시한번 보여드리면
					
					
					
					
					*/// 보통 정수는 010 이라는 값을
					// 010 으로 인식할까요,
					// 10으로 인식 할까요? <- 이거요!
					// 지금 변수를 만들어서 받았는데, int로 받았죠?
					// 그럼 얘는 앞의 0을 없는 번호로 취급합니다.
					// 이게 귀찮아서
					// 국가 번호로 개발자들이 개발을 자주 하죠
					// +82 10 1234 1234 이런 식으로 ㅋㅋㅋ
					// 이건 여담입니다만 ㅋㅋㅋㅋ
					// ㅋㅋㅋ 재밌었습니다!
					// 아이러니 하게도 우리나라는 지역 번호든, 평생 전화(0505) 든,
					// 인터넷 전화(070)든 휴대폰 번호든
					// 모두 앞자리가 0으로 시작합니다.
					// 그럼 0을 붙이시면 됩니다.
					 
					System.out.println("cont : "+ writerNo);
					/*
					mv.addObject("writerNo", writerNo)
					.setViewName("stCommunityBoard/boardList");*/
					
					// 계산한 writerNo를 그대로 넘겨줍시다.
					return writerNo;
					
					/*
					
					저는 받아온 아까 번호를 리퀘스트 스코프에 담기는 것처럼 쓰는것인지
					아니면
					비동기니까
					바로바로
					화면에 뿌려주는 걸로 알고있는데 
					어떻게 설정해야하는지 궁금합니다
					
					일단 저렇게도 추가는 해봤는데 저거는 아닌거 같고;; 
					
					비동기란 서버에서 준 값을 새로운 창이 아닌 현재 창에서 값을
					보내주는 방식으로
					말씀하신 부분에 대한 내용은 String이나 일반 void 로 처리하는 게 맞습니다.
					각 게시글에 각각의 전화번호가 연결되어야 하는데
					처음부터 값을 다 가지고 있으면 서버가 힘들어 하겠죠?
					사용자는 그 중에 클릭한 것만 받을 생각일 텐데 말이죠 ㅋㅋ
					네네
					
					이 경우엔 String으로 처리하여
					서버로 부터 넘어온 값을 View 단(jsp) 에서
					alert() 로 표현해 보는 걸 해봅시다.
					
					먼저 반환 자료형을 바꿉니다.
					
					
					*/
				}
				

				
				
				

}