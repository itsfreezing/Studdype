package com.studdype.test;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping("/mainpage.do")
	public String mainPage() {
		return "studdypemain/mainPage";
	}
	
	@RequestMapping("/studyhome.do")
	public String studyHome(HttpSession session) {
		///////////////////////
		session.setAttribute("studyid", 1);
		session.setAttribute("memberid", 3);
		//////////////////// 화상회의 테스트를 위한 session login, study커뮤니티접근 세션 구현후 삭제
		return "comunitycommon/studyhome";
	}
	
	@RequestMapping("/signup.do")
	public String signup() {
		return "loginpage/signup";
	}
	
	@RequestMapping("/login.do")
	public String login() {
		return "loginpage/login";
	}
}
