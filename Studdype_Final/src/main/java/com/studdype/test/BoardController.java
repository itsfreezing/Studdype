package com.studdype.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private final static int pageSize = 15; //한페이지에 보여줄 개수
	private final static int pageGroupSize = 5; //페이지 그룹 사이즈
	
	
	//자유게시판 리스트 이동 
	@RequestMapping("/freeboard.do")
	public String meetUpdate(HttpSession session) {
		session.setAttribute("leftnavi", "freeboard");
		return "community/freeboard/freeboard";
	}
}
