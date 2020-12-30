package com.studdype.test;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MeetController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/meetlist.do")
	public String meetList(HttpSession session) {
		session.setAttribute("leftnavi", "meet");
		return "community/meet/meetList";
	}
	
	@RequestMapping("/meetinsertform.do")
	public String meetInsert(HttpSession session) {
		session.setAttribute("leftnavi", "meet");
		return "community/meet/meetInsert";
	}
	
	@RequestMapping("/meetdetail.do")
	public String meetDetail(HttpSession session) {
		session.setAttribute("leftnavi", "meet");
		return "community/meet/meetDetail";
	}
	
	@RequestMapping("/meetupdateform.do")
	public String meetUpdate(HttpSession session) {
		session.setAttribute("leftnavi", "meet");
		return "community/meet/meetUpdate";
	}
}
