package com.army.movieEro.tkTheaterRental.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.movieEro.tkTheaterRental.dao.theaterRentalDaoImpl;
import com.army.movieEro.tkTheaterRental.vo.theaterImageVo;
import com.army.movieEro.tkTheaterRental.vo.theaterVO;

@Service("theaterRentalServiceImpl")
public class theaterRentalServiceImpl implements theaterRentalService {

	@Autowired 
	private theaterRentalDaoImpl theaterRentalDaoImpl;
	
	@Override
	public ArrayList<theaterVO> selectList() {
		// TODO Auto-generated method stub
		return theaterRentalDaoImpl.selectList();
	}

	@Override
	public ArrayList<theaterImageVo> selectImage() {
		// TODO Auto-generated method stub
		return theaterRentalDaoImpl.selectImage();
	}

	@Override
	public theaterVO selectView(int bnum) {
		// TODO Auto-generated method stub
		return theaterRentalDaoImpl.selectView(bnum);
	}

	@Override
	public ArrayList<theaterImageVo> selectImageView(int bnum) {
		// TODO Auto-generated method stub
		return theaterRentalDaoImpl.selectImageView(bnum);
	}


}
