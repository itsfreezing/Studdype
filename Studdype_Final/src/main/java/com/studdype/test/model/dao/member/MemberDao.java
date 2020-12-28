package com.studdype.test.model.dao.member;

import com.studdype.test.model.dto.member.MemberDto;

public interface MemberDao {
	//회원 
	String NAMESPACE="mymember.";
	
	public MemberDto login(MemberDto dto);
	
	
	
	
	
	
	
	
	
}
