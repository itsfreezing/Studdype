package com.studdype.test.model.biz.member;

import javax.servlet.http.HttpSession;

import com.studdype.test.model.dto.member.MemberDto;

public interface MemberBiz {
	public MemberDto selectOne(int mem_no); //멤버번호로 하나 셀렉트
	public String getNameByNo(int MEM_NO); //멤버 번호로 이름 가져오기
	public int memberInsert(MemberDto dto); //회원가입
	public MemberDto login(MemberDto dto); //로그인
	public String logout(HttpSession session); //로그아웃
	public String IdChk(String mem_id);//아이디 중복체크


}
