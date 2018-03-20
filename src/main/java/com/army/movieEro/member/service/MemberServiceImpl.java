package com.army.movieEro.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.movieEro.member.dao.MemberDao;
import com.army.movieEro.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public int insertMember(MemberVO memberVO) {
		return memberDao.insertMember(memberVO);
	}

	@Override
	public boolean idCheck(String desiredId) {
		return memberDao.idCheck(desiredId);
	}
}
