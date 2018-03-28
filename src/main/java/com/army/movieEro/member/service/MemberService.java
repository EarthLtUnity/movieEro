package com.army.movieEro.member.service;

import java.util.HashMap;
import java.util.List;

import com.army.movieEro.member.vo.MemberVO;

public interface MemberService {

	public int insertMember(MemberVO memberVO);

	public boolean idCheck(String desiredId);

	public MemberVO loginMember(String id, String passwd);

	public int updateMember(MemberVO memberVO);

	public MemberVO selectMemberInfo(String loginId);

}
