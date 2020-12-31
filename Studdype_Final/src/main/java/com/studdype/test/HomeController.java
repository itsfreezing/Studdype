package com.studdype.test;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.studdype.test.model.biz.member.MemberBiz;
import com.studdype.test.model.biz.study.StudyBiz;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.study.StudyDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private MemberBiz memberBiz;
	@Autowired
	private StudyBiz studyBiz;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
		
	@RequestMapping("/studdypehome.do")
	public String studdypeHeader() {
		return "studdype/studdypeHome";
	}
	
	@RequestMapping("/studdypeexample.do")
	public String studdypeExample() {
		return "studdype/studdypeExample";
	}
	
	@RequestMapping("/searchbycategory.do")
	public String searchByCategory() {
		return "studdype/searchByCategory";
	}
	

	//커뮤니티 홈으로

	@RequestMapping("/createStuddypeform.do")
	public String createStuddype() {
		
		return "studdype/createStuddype";
	}
	

	@RequestMapping("/communityhome.do")
	public String communityHome(HttpSession session) {
		
		/////////////////////// 테스트용 세션
		MemberDto login = memberBiz.selectOne(1);
		StudyDto study = studyBiz.selectOneBySno(1);
		
		
		session.setAttribute("study", study); //스터디 세션
		session.setAttribute("login", login); //로그인 세션
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
