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
			return "comunitycommon/studyhome";
		
	}
	@RequestMapping("/studdypecategory.do")
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
		return "comunitycommon/studyhome";
=======
		session.setAttribute("leftnavi", "studyhome");
		return "community/communityHome";
>>>>>>> 0c0eb1df5e2ab831ae2e3ed9b3f6abc1875ad4e4
	}
	
	@RequestMapping("/notice.do")
	public String notice(HttpSession session) {
		session.setAttribute("leftnavi", "notice");
		return "community/notice";
	}
	
}
