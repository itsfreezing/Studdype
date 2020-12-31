package com.studdype.test;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.studdype.test.model.biz.board.meet.MeetBiz;

@Controller
public class MeetController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MeetBiz meetbiz;
	
	@RequestMapping("/meetlist.do")
	public String meetList(HttpSession session, Model model) {
		session.setAttribute("leftnavi", "meet");
		
		logger.info("[MEET BOARD SELECT LIST]");
		model.addAttribute("list", meetbiz.selectList());
		
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
