package com.studdype.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MeetController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/meetlist.do")
	public String meetList() {
		return "community/meet/meetList";
	}
	
	@RequestMapping("/meetinsertform.do")
	public String meetInsert() {
		return "community/meet/meetInsert";
	}
	
	@RequestMapping("/meetdetail.do")
	public String meetDetail() {
		return "community/meet/meetDetail";
	}
}
