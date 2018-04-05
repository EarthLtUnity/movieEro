package com.army.movieEro.tkTheaterRental.dao;

import java.util.ArrayList;

import com.army.movieEro.tkTheaterRental.vo.theaterImageVo;
import com.army.movieEro.tkTheaterRental.vo.theaterVO;


public interface theaterRentalDao {

	public ArrayList<theaterVO> selectList();
	
	public theaterVO selectView(int bnum);
	
	public ArrayList<theaterImageVo> selectImageView(int bnum);
	
	public ArrayList<theaterImageVo> selectImage();
	
	public int insertBoard(theaterVO b);
	
	public int insertImage(theaterImageVo b);
	
	public int updateBoard(theaterVO b);
	
	public int deleteBoard(int boardNum);
	
	public int getListCount();
	
}
