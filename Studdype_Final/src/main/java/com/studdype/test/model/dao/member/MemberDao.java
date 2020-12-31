package com.studdype.test.model.dao.member;

import com.studdype.test.model.dto.member.MemberDto;

public interface MemberDao { 
	String NAMESPACE="member.";
	
	//로그인
	public MemberDto login(MemberDto dto);
	//멤버번호로 하나 셀렉트
	MemberDto selectOne(int mem_no);
	public void register(MemberDto dto);
	
	
	
	
	
	
}
