package com.army.movieEro.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.movieEro.member.vo.MemberVO;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMember(MemberVO memberVO) {

		return sqlSession.insert("Member.insertMember", memberVO);
	}

}
