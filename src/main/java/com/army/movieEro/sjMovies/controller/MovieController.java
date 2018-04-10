package com.army.movieEro.sjMovies.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public ModelAndView loadSummary(ModelAndView mv, HttpServletRequest request) {
		System.out.println("summary.do 도착...................");
		String MVInfoSeq = request.getParameter("MVInfoSeq");
		System.out.println("불러올 영화 시퀀스 : " + MVInfoSeq);
		List<MovieDetailVo> movieSummary = new ArrayList<MovieDetailVo>();
		List<MovieInfoVo> specInfo = new ArrayList<MovieInfoVo>();
		movieSummary = movieService.loadSummary(MVInfoSeq);
		specInfo = movieService.loadSpecInfo(MVInfoSeq);
		
		
		mv.addObject("movieSummary", movieSummary)
		  .addObject("specInfo", specInfo)
		  .setViewName("sjDetail/summary");
		
		System.out.println(movieSummary.toString());
		System.out.println(specInfo.toString());
		
		return mv;
	}
	
	@RequestMapping("trailer.do")
	public ModelAndView loadTrailer(ModelAndView mv, HttpServletRequest request) {
		System.out.println("trailer.do 도착.....................");
		String MVInfoSeq = request.getParameter("MVInfoSeq");
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
	public ModelAndView loadReview(ModelAndView mv, HttpServletRequest request) {
		System.out.println("review.do 도착.....................");
		String MVInfoSeq = request.getParameter("MVInfoSeq");
		List<MovieReviewVo> movieReview = new ArrayList<MovieReviewVo>();
		
		movieReview = movieService.loadReview(MVInfoSeq);
		
		mv.addObject("movieReview", movieReview)
		  .setViewName("sjDetail/review");
		
		return mv;
	}
	
	@RequestMapping("seojin.do")
	public String test() {
		return "sjDetail/detailTemplate";
	}
}