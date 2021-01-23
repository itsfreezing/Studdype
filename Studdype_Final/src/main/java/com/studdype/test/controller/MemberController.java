package com.studdype.test.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.studdype.test.model.biz.member.MemberBiz;
import com.studdype.test.model.dto.member.MemberDto;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	
	@Autowired 
	private MemberBiz memberBiz;
	
	@RequestMapping(value = "/Member.do",method = RequestMethod.GET)
	public String Member(Locale locale,Model model) {
		logger.info("Welcome Member! The client locale is{}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,DateFormat.LONG,locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime",formattedDate);
		return "Member";
	}

	@RequestMapping("/signform.do")
	public String memberInsertForm(HttpSession session) {
		logger.info("signup form ");
		session.setAttribute("headerMenu", "signUpMenu");
		
		return "loginpage/signup";
	}
	
	@RequestMapping("/signup.do")
	public String memberInsert(MemberDto dto) {
		logger.info("signup page");
		int res=0;
	System.out.println(dto);
		System.out.println(dto.getMem_id());
		System.out.println(dto.getMem_pw());

		res=memberBiz.memberInsert(dto);
		if(res>0) {
			return "loginpage/login";
		}else {
			return "redirect:signupform.do";
		}
	}
	
	//로그인 폼
	@RequestMapping("/loginform.do")
	public String loginForm(HttpSession session) {
		logger.info("login page");
		session.setAttribute("headerMenu", "loginMenu");
		return "loginpage/login";
	}
	
	//로그인
	@RequestMapping("/login.do")
	public String login(HttpSession session, MemberDto dto,Model model) {
		logger.info("login");
		MemberDto loginDto = memberBiz.login(dto);
		
		System.out.println(loginDto);
		
		if(loginDto != null) {
			session.setAttribute("login", loginDto);
			session.setMaxInactiveInterval(-1);
			return "redirect:/studyList.do";
		}else {
			model.addAttribute("msg","로그인 실패!");
			model.addAttribute("url","loginform.do");
			return "commond/alert";
		}
	}		
	
	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		logger.info("logout");
		
		session.invalidate();
		return "redirect:/studyList.do";		
	}
}
	

	