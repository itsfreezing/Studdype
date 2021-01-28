package com.studdype.test.model.biz.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.studdype.test.model.dto.member.MemberDto;

public interface MemberBiz {
	public MemberDto selectOne(int mem_no); //멤버번호로 하나 셀렉트
	public String getNameByNo(int MEM_NO); //멤버 번호로 이름 가져오기
	public int memberInsert(MemberDto dto); //회원가입
	public MemberDto login(MemberDto dto); //로그인
	public String logout(HttpSession session); //로그아웃
	public String findId(MemberDto dto);//	아이디 찾기
	public int updateMember(MemberDto dto); // 마이페이지 정보수정
	public MemberDto idchk(String mem_id); 	// 마이페이지 아이디 중복체크
	public int memberDelete(int mem_no); // 마이페이지 회원 탈퇴
	
	public MemberDto selectMemberByIdAndEmail(MemberDto dto); //아이디와 이메일로 member 가져오기 
	public int updatePw(MemberDto dto); //비밀 번호 변경
	

}
