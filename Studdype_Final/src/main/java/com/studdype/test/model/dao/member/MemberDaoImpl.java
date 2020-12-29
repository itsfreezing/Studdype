package com.studdype.test.model.dao.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public boolean email_check(String e_mail) throws Exception {
		 String email
	        =sqlSession.selectOne("member.email_check", e_mail);
	    
	        //조건식 ? true일때의 값 : false일때의 값
	        return (email==null) ? true : false;
	}

}
