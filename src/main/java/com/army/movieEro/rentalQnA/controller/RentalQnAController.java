package com.army.movieEro.rentalQnA.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.army.movieEro.rentalQnA.service.RentalQnAReplyService;
import com.army.movieEro.rentalQnA.service.RentalQnAService;
import com.army.movieEro.rentalQnA.vo.RentalQnAReplyVO;
import com.army.movieEro.rentalQnA.vo.RentalQnAVO;

@Controller
public class RentalQnAController {

	@Autowired
	private RentalQnAService rentalQnAServiceImpl;

	@Autowired
	private RentalQnAReplyService rentalQnAReplyServiceImpl;

	@RequestMapping("RentalBoardList.do")
	public ModelAndView boardList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {
		// 페이지 값 처리용
		int currentPage = 1;
		// 한 페이지당 출력할 목록 갯수

		int limit = 10;

		// 전달된 페이지값 추출
		if (page != null)
			currentPage = page;

		// 전체 목록 갯수와 해당 페이지별 목록을 리턴
		int listCount = rentalQnAServiceImpl.getListCount();
		ArrayList<RentalQnAVO> list = rentalQnAServiceImpl.selectList(currentPage, limit);
		
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
			
			mv.addObject("list", list).addObject("currentPage", currentPage).addObject("maxPage", maxPage)
					.addObject("startPage", startPage).addObject("endPage", endPage).addObject("listCount", listCount)
					.setViewName("tkRentalQnABoard/QnABoard");
		} else {
			mv.addObject("error", "게시글 전체 조회 실패");
			mv.setViewName("tkRentalQnABoard/QnABoard");
		}
		return mv;
	}

	@RequestMapping("RentalBoardInsertView.do")
	public String testCk(Model model) {
		return "tkRentalQnABoard/QnAInsertBoard";
	}

	@RequestMapping("RentalBoardInsert.do")
	public ModelAndView boardInsertMethod(HttpServletRequest request, ModelAndView mv, RentalQnAVO board)
			throws IOException {

		if (rentalQnAServiceImpl.insertBoard(board) > 0) {
			mv.setViewName("redirect:RentalBoardList.do");

		} else {
			mv.addObject("error", "게시 원글 등록 서비스 실패!");
			mv.setViewName("board/boardError");
		}

		return mv;
	}

	@RequestMapping("RentalBoardImgInsert.do")
	public void communityImageUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload, ModelAndView mv, RentalQnAVO board) {

		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String fileName = upload.getOriginalFilename();
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ fileName.substring(fileName.lastIndexOf(".") + 1);

			byte[] bytes = upload.getBytes();
			String uploadPath = "D:\\workspace\\movieEro\\src\\main\\webapp\\resources\\img\\ckeditor\\"
					+ renameFileName;// 저장경로

			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			String callback = request.getParameter("CKEditorFuncNum");

			printWriter = response.getWriter();
			String fileUrl = "resources/img/ckeditor/" + renameFileName;// url경로
			System.out.println(fileUrl);

			printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + callback
					+ ",'" + fileUrl + "','이미지를 업로드 하였습니다.'" + ")</script>");
			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		

	}

	@RequestMapping("RentalBoardDetail.do")
	public ModelAndView boardDetail(ModelAndView mv, @RequestParam("bnum") int bnum,
			@RequestParam(value = "page", required = false) Integer page,@RequestParam(value = "replypage", required = false) Integer replypage) {
		
		
		int currentPage = 1;
		RentalQnAVO board = rentalQnAServiceImpl.selectBoard(bnum);
		if (board != null) {
			mv.addObject("board", board).addObject("currentPage", currentPage).setViewName("tkRentalQnABoard/QnADetailView");
		} else {
			mv.addObject("error", "게시글 상세조회 실패!");
			mv.setViewName("board/boardError");
		}
		return mv;
	}

	@RequestMapping("RentalBoardDelete.do")
	public ModelAndView boardDelete(ModelAndView mv, HttpServletRequest request, @RequestParam("bnum") Integer boardNum,
			@RequestParam("content") String boardcon) {

		if (rentalQnAServiceImpl.deleteBoard(boardNum) > 0) {
			if (boardcon.contains("src")) {
				String delete[] = boardcon.split("style");
				for (int i = 0; i < delete.length; i++) {
					if (delete[i].contains("src")) {
					delete[i] = delete[i].substring(delete[i].indexOf("resources"),delete[i].lastIndexOf("\""));  	
					new File("D:\\workspace\\movieEro\\src\\main\\webapp\\"+delete[i]).delete();
					}
				}
			}
			mv.setViewName("redirect:RentalBoardList.do");
		} else {
			mv.addObject("error", "게시글 삭제 처리 실패!");
			mv.setViewName("board/boardError");
		}

		return mv;
	}

	@RequestMapping("RentalBoardUpdateView.do")
	public String boardUpdateView(Model model, @RequestParam("bnum") int boardNum, @RequestParam("page") Integer page) {

		model.addAttribute("board", rentalQnAServiceImpl.selectBoard(boardNum)).addAttribute("currentPage", page);

		return "tkRentalQnABoard/QnAUpdateBoard";

	}

	@RequestMapping("RentalBoardUpdate.do")
	public ModelAndView boardUpdateMethod(ModelAndView mv, HttpServletRequest request, RentalQnAVO board)
			throws IllegalStateException, IOException {
		
		if (rentalQnAServiceImpl.updateBoard(board) > 0) {
			mv.setViewName("redirect:RentalBoardList.do");

		} else {
			mv.addObject("error", "게시 원글 수정 서비스 실패!");
			mv.setViewName("board/boardError");
		}
		return mv;

	}
	
/*	@RequestMapping("/comment")
	public class CommentController {
	 
	    @Resource(name="com.example.demo.board.service.CommentService")
	    CommentService mCommentService;*/
	    
	    
	    @RequestMapping("list.do") //댓글 리스트
	    @ResponseBody
	    private ArrayList<RentalQnAReplyVO> mCommentServiceList(ModelAndView mv,@RequestParam("RENTAL_BOARD_RE_NO") int bno) throws Exception{
	    	System.out.println(bno);
	    	ArrayList<RentalQnAReplyVO> replylist = rentalQnAReplyServiceImpl.selectList(bno);
	        return replylist;
	        
	    }
	    
	    @RequestMapping("insert.do") //댓글 작성 
	    @ResponseBody
	    private int mCommentServiceInsert(RentalQnAReplyVO rvo, HttpSession session) throws Exception{
	    	System.out.println(rvo.getRENTAL_BOARD_RE_NO());
	    	System.out.println(rvo.getMB_ID());
	    	System.out.println(rvo.getRENTAL_BOARD_REPLY_CONTENT());
	        return rentalQnAReplyServiceImpl.insertBoard(rvo);
	    }
	    
	    @RequestMapping("update.do") //댓글 수정  
	    @ResponseBody
	    private int mCommentServiceUpdateProc(@RequestParam("RENTAL_BOARD_REPLY_NO") int no, @RequestParam("RENTAL_BOARD_REPLY_CONTENT") String str) throws Exception{
	        
	    	RentalQnAReplyVO comment = new RentalQnAReplyVO();
	        comment.setRENTAL_BOARD_REPLY_NO(no);
	        comment.setRENTAL_BOARD_REPLY_CONTENT(str);
	        
	        return rentalQnAReplyServiceImpl.updateBoard(comment);
	    }
	    
	    @RequestMapping("delete.do") //댓글 삭제  
	    @ResponseBody
	    private int mCommentServiceDelete(@RequestParam("RENTAL_BOARD_REPLY_NO") int no) throws Exception{
	        System.out.println(no+"여기까지오나?");
	        return rentalQnAReplyServiceImpl.deleteBoard(no);
	    }
	    
	}



