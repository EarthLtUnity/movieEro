package com.army.movieEro.sjMovies.model.service;

import java.util.List;
import java.util.Map;

import com.army.movieEro.sjMovies.model.vo.MovieDetailVo;
import com.army.movieEro.sjMovies.model.vo.MovieInfoVo;
import com.army.movieEro.sjMovies.model.vo.MovieReviewVo;
import com.army.movieEro.sjMovies.model.vo.MovieVisualVo;

public interface MovieService {
	public List<MovieInfoVo> loadMovieList();
	
	public List<MovieInfoVo> loadMovieRating();
	
	public List<MovieInfoVo> loadMovieLecnt();
	
	public MovieDetailVo loadSummary(String MVInfoSeq);
	
	public MovieInfoVo loadSpecInfo(String MVInfoSeq);
	
	public List<MovieVisualVo> loadTrailer(String MVInfoSeq);
	
	public List<MovieVisualVo> loadStillcut(String MVInfoSeq);
	
	public List<MovieReviewVo> loadReview(String MVInfoSeq);

	public void addReview(Map<String, String> reviewInfo);
}
