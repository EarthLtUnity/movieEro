package com.army.movieEro.tkTheaterRental.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.movieEro.tkTheaterRental.vo.theaterImageVo;
import com.army.movieEro.tkTheaterRental.vo.theaterVO;



@Repository("theaterRentalDaoImpl")
public class theaterRentalDaoImpl implements theaterRentalDao {

	@Autowired
	SqlSession sqlsession;
	
	@Override
	public ArrayList<theaterVO> selectList() {
		// TODO Auto-generated method stub
		return new ArrayList<theaterVO>(sqlsession.selectList("Thearter.SelectTheaterList"));
	}

	@Override
	public theaterVO selectBoard(int boardNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<theaterImageVo> selectImage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(theaterVO b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertImage(theaterImageVo b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(theaterVO b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int boardNum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}


}
