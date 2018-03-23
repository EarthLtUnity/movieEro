package com.army.movieEro.member.dao;

import com.army.movieEro.member.vo.MemberVO;

public interface MemberDao {
	
	public int insertMember(MemberVO memberVO);

	public boolean idCheck(String desiredId);

	public MemberVO loginMember(String id, String passwd);

	public int updateMember(MemberVO memberVO);
}
