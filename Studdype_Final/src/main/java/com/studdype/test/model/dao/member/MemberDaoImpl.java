package com.studdype.test.model.dao.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.member.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public MemberDto login(MemberDto dto) {
		MemberDto res=null;
		
		System.out.println(dto.getMem_id());
		
		System.out.println(dto.getMem_pw());
		
		try {
			res=sqlSession.selectOne(NAMESPACE+"login",dto);
		} catch (Exception e) {
			System.out.println("[error]:login");
			e.printStackTrace();
		}
		return res;
	}
	
	
	
}
