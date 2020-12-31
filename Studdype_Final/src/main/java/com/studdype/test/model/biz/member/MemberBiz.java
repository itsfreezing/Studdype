package com.studdype.test.model.biz.member;

import com.studdype.test.model.dto.member.MemberDto;

public interface MemberBiz {
	public MemberDto selectOne(int mem_no); //멤버번호로 하나 셀렉트
}
