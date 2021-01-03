package com.studdype.test.model.biz.member;

import com.studdype.test.model.dto.member.MemberDto;

public interface MemberBiz {
	public MemberDto selectOne(int mem_no); //멤버번호로 하나 셀렉트
	public String getNameByNo(int MEM_NO); //멤버 번호로 이름 가져오기
}
