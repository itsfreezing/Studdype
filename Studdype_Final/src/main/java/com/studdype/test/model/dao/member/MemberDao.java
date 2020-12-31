package com.studdype.test.model.dao.member;

import com.studdype.test.model.dto.member.MemberDto;

public interface MemberDao {
	//회원 
	String NAMESPACE="member.";

	//멤버번호로 하나 셀렉트
	MemberDto selectOne(int mem_no);
	
	
	
	
	
	
	
	
	
}
