package com.studdype.test.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

import com.studdype.test.model.dao.member.MemberDao;

public class MemberBizImpl implements MemberBiz{
	
	@Autowired
	MemberDao dao;
	private JavaMailSender mailSender;
	
	//메일 중복확인 
	@Override
	public boolean email_check(String e_mail) throws Exception {
		 boolean result =dao.email_check(e_mail);
	        
	        return result;
	}

}
