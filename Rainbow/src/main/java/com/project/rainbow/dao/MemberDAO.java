package com.project.rainbow.dao;


import com.project.rainbow.vo.MemberVO;


public interface MemberDAO {
	
	//회원가입 
	public void signup(MemberVO vo) throws Exception;
	
	// 로그인 
	public MemberVO login(MemberVO vo) throws Exception;
	
	// 중복 체크 
	public int idCheck(String userId) throws Exception;
	
	public int phoneCheck(String userPhone) throws Exception;

	// 아이디 찾기 
	public MemberVO findId(MemberVO vo) throws Exception;
	
	// 비밀번호 찾기 
	public int findPass(MemberVO vo) throws Exception;
	
	// 비밀번호 변경
	public void updatePass(MemberVO vo) throws Exception;
	
	
}
