package com.army.movieEro.jkNoticeBoard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.ModelAndView;

import com.army.movieEro.jkNoticeBoard.service.noticeService;
import com.army.movieEro.jkNoticeBoard.vo.noticeVO;


@Controller
public class noticeBoardController {
	//
	@Autowired
	private noticeService NTService;

	@RequestMapping(value = "notice.do")
	public String testInit(Model model) {
		System.out.println("noticeBoardController 도착!!");

		return "jkNoticeBoard/noticeBoardListUser";
	}

	// 공지사항 관리자페이지 리스트 불러오기
	@RequestMapping(value = "noticeAdmin.do")
	public ModelAndView noticeBoardAdmin(ModelAndView mv,
			@RequestParam(value = "page", required = false) Integer page) {
		System.out.println("noticeBoardAdmin Controller 도착!!");

		int currentPage = 1;

		int limit = 10;

		if (page != null)
			currentPage = page;

		System.out.println("getListCount 도착전");
		int listCount = NTService.getListCount();
		System.out.println("getListCount 도착       "+listCount);

		// 임시 listCount
		// int listCount = 1;

		int maxPage = (int) ((double) listCount / limit + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if (maxPage < endPage)
			endPage = maxPage;

		System.out.println("selectListAdmin 도착전");
		ArrayList<noticeVO> list = NTService.selectListAdmin(currentPage, limit);
		System.out.println("selectListAdmin 도착" + list);
		
		if (list != null && list.size() > 0) {

			mv.addObject("list", list)
			.addObject("currentPage", currentPage)
			.addObject("maxPage", maxPage)
			.addObject("startPage", startPage)
			.addObject("endPage", endPage)
			.addObject("listCount", listCount)
			.setViewName("jkNoticeBoard/noticeBoardListAdmin");

			System.out.println("mv에 값들 정상적으로 들어가서 리스트로 뿌려짐");
		} else {
			mv.addObject("error", "게시글 전체 조회 실패");
			mv.setViewName("jkNoticeBoard/noticeBoardListAdmin");
			System.out.println("게시글 조회 실패");
		}
		return mv;
	}

	// 리스트에서 글쓰기위해 글쓰기 버튼 클릭시 작동하는 컨트롤러
	@RequestMapping(value = "noticeInsertForm.do")
	public String testInitInsertForm(Model model) {
		System.out.println("noticeInsertController 도착!!");

		return "jkNoticeBoard/noticeInsertForm";
	}
	
	// 글을 작성해서 데이터베이스에 넣기위한 컨트롤러
	@RequestMapping(value = "noticeInsert.do")
	public ModelAndView testInitInsert(HttpServletRequest request,
			 ModelAndView mv, noticeVO noticeVO)
			throws IOException {
		System.out.println("작성하기 버튼 눌러서 컨트롤러 도착");

		
		//파일 관련 소스
		/**String root = request.getSession().getServletContext().getRealPath("resource");

		// " 안에 파일이 저장될 폴더명과 경로연결 적어넣기 "
		String savePath = root + "    ";

		if (file != null && file.isEmpty()) {
			if (!new File(savePath).exists()) {
				new File(savePath).mkdir();
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String originFileName = file.getOriginalFilename();
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

			File renameFile = new File(savePath + "\\" + renameFileName);
			file.transferTo(renameFile);

			// 아리 2줄 데이터베이스 바꾸면서 originFileName이랑 renameFileName으로 바꿀것.
			noticeVO.setNOTICE_BOARD_PICTURE(originFileName);
			noticeVO.setNOTICE_BOARD_PICTURE(originFileName);
		}**/

		System.out.println("insertNoticeBoard 실행 전");
		if (NTService.insertNoticeBoard(noticeVO) > 0) {
			System.out.println("insertNoticeBoard 실행 완료");
			mv.setViewName("redirect:noticeAdmin.do");
		} else {
			System.out.println("insertNoticeBoard 실행 실패");
			mv.addObject("error", "공지사항 글 작성 실패");
		}
		return mv;
	}
}