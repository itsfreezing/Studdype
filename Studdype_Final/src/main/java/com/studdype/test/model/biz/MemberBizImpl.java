package com.studdype.test.model.biz;

import org.springframework.beans.factory.annotation.Autowired;

import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.member.MemberDto;

public class MemberBizImpl implements MemberBiz{
	
	@Autowired
	private MemberDao dao ;
	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}

}
