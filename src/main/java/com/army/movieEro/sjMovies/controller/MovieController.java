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
		System.out.println("loadMovie.do 도착.......................");
		List<MovieInfoVo> movieList = new ArrayList<MovieInfoVo>();
		movieList = movieService.loadMovieList();
		mv.addObject("movieList", movieList)
		  .setViewName("sjDetail/movieList");
		
		return mv;
	}
	
	@RequestMapping("movieRating.do")
	public ModelAndView movieRating(ModelAndView mv) {
		System.out.println("loadMovie.do 도착.......................");
		List<MovieInfoVo> movieList = new ArrayList<MovieInfoVo>();
		movieList = movieService.loadMovieRating();
		mv.addObject("movieList", movieList)
		.setViewName("sjDetail/movieList");
		
		return mv;
	}
	
	@RequestMapping("movieRecnt.do")
	public ModelAndView movieRecnt(ModelAndView mv) {
		System.out.println("loadMovie.do 도착.......................");
		List<MovieInfoVo> movieList = new ArrayList<MovieInfoVo>();
		movieList = movieService.loadMovieLecnt();
		mv.addObject("movieList", movieList)
		.setViewName("sjDetail/movieList");
		
		return mv;
	}
	
	@RequestMapping("summary.do")
	public ModelAndView loadSummary(ModelAndView mv, HttpServletRequest request,
			HttpSession storeSession) {
		System.out.println("summary.do 도착...................");
		if(storeSession.getAttribute("MVInfoSeq") == null) {
			String MVInfoSeqPara = request.getParameter("MVInfoSeq");
			storeSession.setAttribute("MVInfoSeq", MVInfoSeqPara);
		}else {
			String MVInfoSeq = (String)storeSession.getAttribute("MVInfoSeq");
			System.out.println("불러올 영화 시퀀스 : " + MVInfoSeq);
			MovieDetailVo movieSummary = new MovieDetailVo();
			MovieInfoVo specInfo = new MovieInfoVo();
			movieSummary = movieService.loadSummary(MVInfoSeq);
			specInfo = movieService.loadSpecInfo(MVInfoSeq);
			
			
			mv.addObject("movieSummary", movieSummary)
			  .addObject("specInfo", specInfo)
			  .setViewName("sjDetail/summary");
			
			System.out.println(movieSummary.toString());
			System.out.println(specInfo.toString());
		
		}
		return mv;
	}
	
	@RequestMapping("trailer.do")
	public ModelAndView loadTrailer(ModelAndView mv, HttpServletRequest request, 
			HttpSession storedSession) {
		System.out.println("trailer.do 도착.....................");
		String MVInfoSeq = (String)storedSession.getAttribute("MVInfoSeq");
		List<MovieVisualVo> movieTrailer = new ArrayList<MovieVisualVo>();
		List<MovieVisualVo> movieStillcut = new ArrayList<MovieVisualVo>();
		
		movieTrailer = movieService.loadTrailer(MVInfoSeq);
		movieStillcut = movieService.loadStillcut(MVInfoSeq);
		
		mv.addObject("movieTrailer", movieTrailer)
		  .addObject("movieStillcut", movieStillcut)
		  .setViewName("sjDetail/trailer");
		
		return mv;
	}
	
	@RequestMapping("review.do")
	public ModelAndView loadReview(ModelAndView mv, HttpServletRequest request, 
			HttpSession storedSession) {
		System.out.println("review.do 도착.....................");
		String MVInfoSeq = (String)storedSession.getAttribute("MVInfoSeq");
		List<MovieReviewVo> movieReview = new ArrayList<MovieReviewVo>();
		
		movieReview = movieService.loadReview(MVInfoSeq);
		System.out.println(movieReview.get(0).toString());
		
		mv.addObject("movieReview", movieReview)
		  .setViewName("sjDetail/review");
		
		return mv;
	}
	
	@RequestMapping("addReview.do")
	public ModelAndView addReview(ModelAndView mv, HttpServletRequest request, 
			HttpSession storedSession) {
		System.out.println("addReview.do 도착.....................");
		String MVInfoSeq = (String)storedSession.getAttribute("MVInfoSeq");
		String userId = (String) storedSession.getAttribute("memberID");
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
		
		return mv;
	}
	
	@RequestMapping("seojin.do")
	public String test() {
		return "sjDetail/detailTemplate";
	}
}