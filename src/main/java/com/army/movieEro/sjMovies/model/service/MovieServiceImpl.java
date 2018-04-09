package com.army.movieEro.sjMovies.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.movieEro.sjMovies.model.dao.MovieDao;
import com.army.movieEro.sjMovies.model.vo.MovieDetailVo;
import com.army.movieEro.sjMovies.model.vo.MovieInfoVo;
import com.army.movieEro.sjMovies.model.vo.MovieReviewVo;
import com.army.movieEro.sjMovies.model.vo.MovieVisualVo;

@Service("movieService")
public class MovieServiceImpl implements MovieService {

	@Autowired
	MovieDao movieDao;
	
	@Override
	public List<MovieInfoVo> loadMovieList() {
		System.out.println("Service loadMovieList 실행..........");
		List<MovieInfoVo> movieList = new ArrayList<MovieInfoVo>();
		movieList = movieDao.loadMovieList();
		return movieList;
	}
	
	@Override
	public List<MovieDetailVo> loadSummary(String MVInfoSeq) {
		System.out.println("Service loadSummary 실행..............");
		List<MovieDetailVo> movieSummary = new ArrayList<MovieDetailVo>();
		movieSummary = movieDao.loadSummary(MVInfoSeq);
		return movieSummary;
	}

	@Override
	public List<MovieVisualVo> loadTrailer(String MVInfoSeq) {
		System.out.println("Service loadTrailer 실행..............");
		List<MovieVisualVo> movieTrailer = new ArrayList<MovieVisualVo>();
		movieTrailer = movieDao.loadTrailer(MVInfoSeq);
		return movieTrailer;
	}
	
	@Override
	public List<MovieVisualVo> loadStillcut(String MVInfoSeq) {
		System.out.println("Service loadStillcut 실행..............");
		List<MovieVisualVo> movieStillcut = new ArrayList<MovieVisualVo>();
		movieStillcut = movieDao.loadStillcut(MVInfoSeq);
		return movieStillcut;
	}

	@Override
	public List<MovieReviewVo> loadReview(String MVInfoSeq) {
		System.out.println("Service loadReview 실행..............");
		List<MovieReviewVo> movieReview = new ArrayList<MovieReviewVo>();
		movieReview = movieDao.loadReview(MVInfoSeq);
		return movieReview;
	}

}