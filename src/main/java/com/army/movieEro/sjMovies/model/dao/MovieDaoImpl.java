package com.army.movieEro.sjMovies.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.movieEro.sjMovies.model.vo.MovieDetailVo;
import com.army.movieEro.sjMovies.model.vo.MovieInfoVo;
import com.army.movieEro.sjMovies.model.vo.MovieReviewVo;
import com.army.movieEro.sjMovies.model.vo.MovieVisualVo;

@Repository("movieDao")
public class MovieDaoImpl implements MovieDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<MovieInfoVo> loadMovieList() {
		System.out.println("Dao loadMovieList 실행..........");
		List<MovieInfoVo> movieList = new ArrayList<MovieInfoVo>();
		movieList = sqlSession.selectList("Movie.loadMovie");
		return movieList;
	}

	@Override
	public List<MovieInfoVo> loadMovieRating() {
		System.out.println("Dao loadMovieRating 실행..........");
		List<MovieInfoVo> movieList = new ArrayList<MovieInfoVo>();
		movieList = sqlSession.selectList("Movie.loadMovieRating");
		return movieList;
	}

	@Override
	public List<MovieInfoVo> loadMovieLecnt() {
		System.out.println("Dao loadMovieLecnt 실행..........");
		List<MovieInfoVo> movieList = new ArrayList<MovieInfoVo>();
		movieList = sqlSession.selectList("Movie.loadMovieLecnt");
		return movieList;
	}
	
	@Override
	public List<MovieDetailVo> loadSummary(String MVInfoSeq) {
		System.out.println("Dao loadSummary 실행......................");
		List<MovieDetailVo> movieSummary = new ArrayList<MovieDetailVo>();
		movieSummary = sqlSession.selectList("Movie.loadSummary", MVInfoSeq);
		return movieSummary;
	}
	
	@Override
	public List<MovieInfoVo> loadSpecInfo(String MVInfoSeq) {
		System.out.println("Dao loadSpecInfo 실행..........");
		List<MovieInfoVo> specInfo = new ArrayList<MovieInfoVo>();
		specInfo = sqlSession.selectList("Movie.loadSpecInfo", MVInfoSeq);
		System.out.println("자료 출력 성공");
		return specInfo;
	}

	@Override
	public List<MovieVisualVo> loadTrailer(String MVInfoSeq) {
		System.out.println("Dao loadTrailer 실행......................");
		List<MovieVisualVo> movieTrailer = new ArrayList<MovieVisualVo>();
		movieTrailer = sqlSession.selectList("Movie.loadTrailer", MVInfoSeq);
		return movieTrailer;
	}
	
	@Override
	public List<MovieVisualVo> loadStillcut(String MVInfoSeq) {
		System.out.println("Dao loadStillcut 실행..............");
		List<MovieVisualVo> movieStillcut = new ArrayList<MovieVisualVo>();
		movieStillcut = sqlSession.selectList("Movie.loadStillcut", MVInfoSeq);
		return movieStillcut;
	}

	@Override
	public List<MovieReviewVo> loadReview(String MVInfoSeq) {
		System.out.println("Dao loadReview 실행......................");
		List<MovieReviewVo> movieReview = new ArrayList<MovieReviewVo>();
		movieReview = sqlSession.selectList("Movie.loadReview", MVInfoSeq);
		return movieReview;
	}
}
