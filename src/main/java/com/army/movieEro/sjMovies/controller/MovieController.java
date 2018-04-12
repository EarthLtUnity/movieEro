package com.army.movieEro.sjMovies.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.army.movieEro.sjMovies.model.service.MovieService;
import com.army.movieEro.sjMovies.model.vo.MovieDetailVo;
import com.army.movieEro.sjMovies.model.vo.MovieInfoVo;
import com.army.movieEro.sjMovies.model.vo.MovieReviewVo;
import com.army.movieEro.sjMovies.model.vo.MovieVisualVo;

@Controller
public class MovieController {
	
	@Autowired
	MovieService movieService;
	
	@RequestMapping("movieList.do")
	public ModelAndView loadList(ModelAndView mv) {
		try {
			System.out.println("loadMovie.do 도착.......................");
			List<MovieInfoVo> movieList = new ArrayList<MovieInfoVo>();
			movieList = movieService.loadMovieList();
			mv.addObject("movieList", movieList)
			  .setViewName("sjDetail/movieList");
		}catch(Exception e) {
			System.out.println("movieList.do 에러 : " + e.getLocalizedMessage());
			mv.setViewName("sjDetail/movieError");
		}
		return mv;
	}
	
	@RequestMapping("movieRating.do")
	public ModelAndView movieRating(ModelAndView mv) {
		try {
			System.out.println("loadMovie.do 도착.......................");
			List<MovieInfoVo> movieList = new ArrayList<MovieInfoVo>();
			movieList = movieService.loadMovieRating();
			mv.addObject("movieList", movieList)
			.setViewName("sjDetail/movieList");
		}catch(Exception e) {
			System.out.println("movieRating.do 에러 : " + e.getLocalizedMessage());
			mv.setViewName("sjDetail/movieError");
		}
		
		
		return mv;
	}
	
	@RequestMapping("movieRecnt.do")
	public ModelAndView movieRecnt(ModelAndView mv) {
		try {
			System.out.println("loadMovie.do 도착.......................");
			List<MovieInfoVo> movieList = new ArrayList<MovieInfoVo>();
			movieList = movieService.loadMovieLecnt();
			mv.addObject("movieList", movieList)
			.setViewName("sjDetail/movieList");
		}catch(Exception e) {
			System.out.println("movieRecnt.do 에러 : " + e.getLocalizedMessage());
			mv.setViewName("sjDetail/movieError");
		}
		return mv;
	}
	
	@RequestMapping("summary.do")
	public ModelAndView loadSummary(ModelAndView mv, HttpServletRequest request, 
			HttpSession session) {
		try {
			System.out.println("summary.do 도착...................");
			String MVInfoSeqParam = request.getParameter("MVInfoSeq");
			if(session.getAttribute("MVInfoSeqParam") ==  null) {
				session.setAttribute("MVInfoSeqParam", MVInfoSeqParam);
			}
			String MVInfoSeq = (String)session.getAttribute("MVInfoSeqParam");
			MovieDetailVo movieSummary = new MovieDetailVo();
			MovieInfoVo specInfo = new MovieInfoVo();
			movieSummary = movieService.loadSummary(MVInfoSeq);
			specInfo = movieService.loadSpecInfo(MVInfoSeq);
			
			System.out.println("영화 정보 확인 : "+movieSummary.toString());
			System.out.println("영화 내용 확인 : "+specInfo.toString());
			
			mv.addObject("movieSummary", movieSummary)
			  .addObject("specInfo", specInfo)
			  .setViewName("sjDetail/summary");
			
		}catch(Exception e) {
			System.out.println("summary.do 에러 : " + e.getLocalizedMessage());
			mv.setViewName("sjDetail/movieError");
		}
		return mv;
	}
	
	@RequestMapping("trailer.do")
	public ModelAndView loadTrailer(ModelAndView mv, HttpServletRequest request, 
			HttpSession session) {
		try {
			System.out.println("trailer.do 도착.....................");
			String MVInfoSeq = (String)session.getAttribute("MVInfoSeqParam");
			System.out.println("영화 시퀀스 확인 : "+MVInfoSeq);
			List<MovieVisualVo> movieTrailer = new ArrayList<MovieVisualVo>();
			List<MovieVisualVo> movieStillcut = new ArrayList<MovieVisualVo>();
			
			movieTrailer = movieService.loadTrailer(MVInfoSeq);
			movieStillcut = movieService.loadStillcut(MVInfoSeq);
			
			mv.addObject("movieTrailer", movieTrailer)
			  .addObject("movieStillcut", movieStillcut)
			  .setViewName("sjDetail/trailer");
		}catch(Exception e) {
			System.out.println("trailer.do 에러 : " + e.getLocalizedMessage());
			mv.setViewName("sjDetail/movieError");
		}
		return mv;
	}
	
	@RequestMapping("review.do")
	public ModelAndView loadReview(ModelAndView mv, HttpServletRequest request, 
			HttpSession session) {
		try {
			System.out.println("review.do 도착.....................");
			String MVInfoSeq = (String)session.getAttribute("MVInfoSeqParam");
			System.out.println("영화 시퀀스 확인 : "+MVInfoSeq);
			List<MovieReviewVo> movieReview = new ArrayList<MovieReviewVo>();
			
			movieReview = movieService.loadReview(MVInfoSeq);
			
			mv.addObject("movieReview", movieReview)
			  .setViewName("sjDetail/review");
		}catch(Exception e) {
			System.out.println("review.do 에러 : " + e.getLocalizedMessage());
			mv.setViewName("sjDetail/movieError");
		}
		return mv;
	}
	
	@RequestMapping("addReview.do")
	public ModelAndView addReview(ModelAndView mv, HttpServletRequest request, 
			HttpSession session) {
		try {
			System.out.println("addReview.do 도착.....................");
			String MVInfoSeq = (String)session.getAttribute("MVInfoSeqParam");
			System.out.println("영화 시퀀스 확인 : "+MVInfoSeq);
			String userId = (String) session.getAttribute("memberID");
			MovieInfoVo specInfo = new MovieInfoVo();
			specInfo = movieService.loadSpecInfo(MVInfoSeq);
			String rvContents = request.getParameter("commentContents");
			String rvTitle = rvContents.substring(0, 15) + "...";
			String MVTitle = specInfo.getMV_TITLE();
			
			Map<String, String> reviewInfo = new HashMap<String, String>();
			reviewInfo.put("MVInfoSeq", MVInfoSeq);
			reviewInfo.put("userId", userId);
			reviewInfo.put("MVTitle", MVTitle);
			reviewInfo.put("rvTitle", rvTitle);
			reviewInfo.put("rvContents", rvContents);
			
			movieService.addReview(reviewInfo);
			
			mv.setViewName("redirect:review.do");
		}catch(Exception e) {
			System.out.println("addReview.do 에러 : " + e.getLocalizedMessage());
			mv.setViewName("sjDetail/movieError");
		}
		return mv;
	}
}