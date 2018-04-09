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
	
	@RequestMapping("loadMovie.do")
	public ModelAndView loadList(ModelAndView mv) {
		System.out.println("loadMovie.do 도착.......................");
		List<MovieInfoVo> movieList = new ArrayList<MovieInfoVo>();
		movieList = movieService.loadMovieList();
		mv.addObject("movieList", movieList)
		  .setViewName("sjDetail/movieList");
		
		return mv;
	}
	
	@RequestMapping("summary.do")
	public ModelAndView loadSummary(ModelAndView mv, HttpServletRequest request) {
		System.out.println("summary.do 도착...................");
		String MVInfoSeq = request.getParameter("MVInfoSeq");
		List<MovieDetailVo> movieSummary = new ArrayList<MovieDetailVo>();
		movieSummary = movieService.loadSummary(MVInfoSeq);
		
		mv.addObject("movieSummary", movieSummary)
		  .setViewName("sjDetail/summary");
		
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
}