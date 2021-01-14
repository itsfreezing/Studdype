package com.studdype.test.model.biz.member;

import javax.servlet.http.HttpSession;
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

	//멤버번호로 이름 하나 가져오기
	@Override
	public String getNameByNo(int mem_no) {
		return memberDao.selectNameByNo(mem_no);
	}

	//회원가입
	@Override
	public int memberInsert(MemberDto dto) {
		return memberDao.memberInsert(dto);
	}
	
	//로그인
	@Override
	public MemberDto login(MemberDto dto) {
		return memberDao.login(dto);
	}
	
	//로그아웃
	@Override
	public String logout(HttpSession session) {
		return null;
	}

	
}
