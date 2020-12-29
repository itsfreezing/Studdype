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

	@RequestMapping("/login.do")
	public String login() {
		return "loginpage/login";
	}
	
	@RequestMapping("/studyhome.do")
	public String studyHome(HttpSession session) {
			return "comunitycommon/studyhome";
		
	}
<<<<<<< HEAD
	@RequestMapping("/studdypecategory.do")
=======
	
	
	@RequestMapping("/member/auth.do")
	public String email(HttpSession session) {
			return "member/email";
		
	}
	
	@RequestMapping("/member/email_injeung.do")
	public String emailchk(HttpSession session) {
			return "member/email_injeung";
		
	}
	
	@RequestMapping("/searchbycategory.do")
>>>>>>> d32abc34fe773c36bcf27050c11341ccfb23101a
	public String searchByCategory() {
		return "category/studdypeCategory";
	}
	
	
	@RequestMapping("/communityhome.do")
	public String communityHome(HttpSession session) {

		///////////////////////
		session.setAttribute("studyid", 1);
		session.setAttribute("memberid", 3);
		//////////////////// 화상회의 테스트를 위한 session login, study커뮤니티접근 세션 구현후 삭제
<<<<<<< HEAD
<<<<<<< HEAD
		return "comunitycommon/studyhome";
=======
		session.setAttribute("leftnavi", "studyhome");
		return "community/communityHome";
>>>>>>> 0c0eb1df5e2ab831ae2e3ed9b3f6abc1875ad4e4
=======

		session.setAttribute("leftnavi", "studyhome");
		return "community/communityHome";

>>>>>>> d32abc34fe773c36bcf27050c11341ccfb23101a
	}
	
	@RequestMapping("/notice.do")
	public String notice(HttpSession session) {
		session.setAttribute("leftnavi", "notice");
		return "community/notice";
	}
	
}
