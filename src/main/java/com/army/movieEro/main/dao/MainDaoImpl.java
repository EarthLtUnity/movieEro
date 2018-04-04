package com.army.movieEro.main.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("mainDao")
public class MainDaoImpl implements MainDao {
	@Inject
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<HashMap> selectBoardList(String param) {
		return sqlSession.selectList("Main.selectNoticeList", param);
	}

}
