package com.army.movieEro.member.service;

import com.army.movieEro.member.vo.MemberVO;

public interface MemberService {

	public int insertMember(MemberVO memberVO);

	public boolean idCheck(String desiredId);

	public MemberVO loginMember(String id, String passwd);

	public int updateMember(MemberVO memberVO);

}
