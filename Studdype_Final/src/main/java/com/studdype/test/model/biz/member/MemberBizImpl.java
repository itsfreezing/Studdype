package com.studdype.test.model.biz.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.member.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz {

	@Autowired 
	private MemberDao memberDao;
	
	//멤버번호로 하나 셀렉트
	@Override
	public MemberDto selectOne(int mem_no) { 
		return memberDao.selectOne(mem_no);
	}
	
}
