package com.army.movieEro.rentalQnA.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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

	@RequestMapping("RentalPointList.do")//셀렉트박스로 리스트뽑기
	@ResponseBody
	public Map<String, Object> boardPointList(@RequestParam(value = "page", required = false) Integer page,
			   @RequestParam(value = "RENTAL_BOARD_POINT", required = false) String point,
			   HttpServletResponse response) {
				 
				Map<String,Object>resultMap = new HashMap<String,Object>();
			      // 페이지 값 처리용
			      int currentPage = 1;
			      // 한 페이지당 출력할 목록 갯수
			      System.out.println(point);
			      int limit = 10;
			      System.out.println(point+"여기에뭐들어가냐");
			      // 전달된 페이지값 추출
			      if (page != null)
			         currentPage = page;
			      int listCount = 0;
			      ArrayList<RentalQnAVO> list = null;
			      
			      if(point==null) {
			    	  point="";
			      }
			      if(point.equals("전체")) {
			    	point = "";
			      }
			      // 전체 목록 갯수와 해당 페이지별 목록을 리턴
			      if(point.equals("")) {
			      listCount = rentalQnAServiceImpl.getListCount();
			      list = rentalQnAServiceImpl.selectList(currentPage, limit);
			      }else if(!point.equals("")) {
			      listCount = rentalQnAServiceImpl.getListCount(point);
			      list = rentalQnAServiceImpl.selectList(currentPage,point,limit);   
			      }
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
			      
			      resultMap.put("maxPage", maxPage);
			      resultMap.put("currentPage", currentPage);
			      resultMap.put("startPage", startPage);
			      resultMap.put("endPage", endPage);
			      resultMap.put("listCount", listCount);
			      resultMap.put("list", list);
			      
			    /*      JSONObject json = new JSONObject();
			      JSONArray jArr = new JSONArray();*/
			      
			    /*  json.put("currentPage", currentPage);
			      json.put("maxPage", maxPage);
			      json.put("startPage", startPage);
			      json.put("endPage", endPage);
			      json.put("listCount", listCount);
			      for(int i = 0 ; i < list.size(); i++) {
			         JSONObject board = new JSONObject();
			         board.put("MB_ID", list.get(i).getMB_ID());
			         board.put("RENTAL_BOARD_CONTENT", list.get(i).getRENTAL_BOARD_CONTENT());
			         board.put("RENTAL_BOARD_DATE", list.get(i).getRENTAL_BOARD_DATE());
			         board.put("RENTAL_BOARD_NO", list.get(i).getRENTAL_BOARD_NO());
			         board.put("RENTAL_BOARD_POINT", list.get(i).getRENTAL_BOARD_POINT());
			         board.put("RENTAL_BOARD_TITLE", list.get(i).getRENTAL_BOARD_TITLE());
			         board.put("RENTAL_REPLY", list.get(i).getRENTAL_REPLY()
			               );
			         
			         jArr.add(board);
			      }
			      PrintWriter out = null;*/
			/*      try {
			         response.setContentType("application/json");
			         json.put("list", jArr);
			         out = response.getWriter();
			         out.append(json.toJSONString());
			      } catch (IOException e) {
			         out.printf("list","ERROR");
			         e.printStackTrace();
			      }
				return json;
			      */
			      return resultMap;
			   }

	@RequestMapping("RentalBoardList.do") //전체리스트뽑기
	public String boardList() {
				return "tkRentalQnABoard/QnABoard";
	}
	
	@RequestMapping("RentalBoardInsertView.do")//글쓰기 뷰로 이동
	public String testCk(Model model) {
		return "tkRentalQnABoard/QnAInsertBoard";
	}

	@RequestMapping("RentalBoardInsert.do")//글쓰기 입력
	public ModelAndView boardInsertMethod(HttpServletRequest request, ModelAndView mv, RentalQnAVO board)
			throws IOException {
		System.out.println(board.getRENTAL_BOARD_CONTENT()+"이거왜이러지");
		System.out.println(board.getMB_ID());
		System.out.println(board.getRENTAL_BOARD_TITLE());
		System.out.println(board.getRENTAL_BOARD_POINT());
		if (rentalQnAServiceImpl.insertBoard(board) > 0) {
			mv.setViewName("redirect:RentalBoardList.do");

		} else {
			mv.addObject("error", "게시 원글 등록 서비스 실패!");
			mv.setViewName("board/boardError");
		}

		return mv;
	}

	@RequestMapping("RentalBoardImgInsert.do")//글쓰기 이미지 업로드
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

	@RequestMapping("RentalBoardDetail.do") //게시판 글보기
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

	@RequestMapping("RentalBoardDelete.do")//게시글 삭제
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

	@RequestMapping("RentalBoardUpdateView.do")//게시글 수정하기 뷰
	public String boardUpdateView(Model model, @RequestParam("bnum") int boardNum, @RequestParam("page") Integer page) {

		model.addAttribute("board", rentalQnAServiceImpl.selectBoard(boardNum)).addAttribute("currentPage", page);

		return "tkRentalQnABoard/QnAUpdateBoard";

	}

	@RequestMapping("RentalBoardUpdate.do")//글쓰기 수정
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



