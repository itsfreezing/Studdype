package com.studdype.test;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.studdype.test.model.biz.member.MemberBiz;
import com.studdype.test.model.dto.member.MemberDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private MemberBiz memberBiz;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
		

	
	@RequestMapping("/studdypeexample.do")
	public String studdypeExample() {
		return "studdype/studdypeExample";
	}
	
	@RequestMapping("/searchbycategory.do")
	public String searchByCategory() {
		return "studdype/searchByCategory";
	}
	
	
	@RequestMapping("/communityhome.do")
	public String communityHome(HttpSession session) {
		
		MemberDto member = memberBiz.selectOne(1);
		System.out.println(member.getMem_name());
		///////////////////////
		session.setAttribute("studyid", 1);
		session.setAttribute("memberid", 3);
		//////////////////// 화상회의 테스트를 위한 session login, study커뮤니티접근 세션 구현후 삭제
		session.setAttribute("leftnavi", "studyhome");
		return "community/communityHome";
	}
	
	@RequestMapping("/notice.do")
	public String notice(HttpSession session) {
		session.setAttribute("leftnavi", "notice");
		return "community/notice";
	}
	
	@RequestMapping("/loginform.do")
	public String Login(HttpSession session) {
		return "loginpage/login";
	}
	
	@RequestMapping("/signupform.do")
	public String Signup(HttpSession session) {
		return "loginpage/signup";
	}
}
