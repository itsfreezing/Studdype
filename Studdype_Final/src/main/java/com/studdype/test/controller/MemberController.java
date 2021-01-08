package com.studdype.test.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.studdype.test.model.biz.member.MemberBiz;
import com.studdype.test.model.dto.member.MemberDto;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired 
	private MemberBiz biz;
	
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
	public String memberInsertForm() {
		logger.info("signup form ");
		
		return "loginpage/signup";
	}
	
	@RequestMapping("/signup.do")
	public String memberInsert(MemberDto dto) {
		logger.info("signup page");
		int res=0;
	System.out.println(dto);
		System.out.println(dto.getMem_id());
		System.out.println(dto.getMem_pw());

		res=biz.memberInsert(dto);
		if(res>0) {
			return "loginpage/login";
		}else {
			return "redirect:signupform.do";
		}
	}

	@RequestMapping("/loginform.do")
	public String loginForm() {
		logger.info("login page");
		return "loginpage/login";
	}
	
	@RequestMapping("/login.do")
	public String login(HttpSession session, MemberDto dto) {
		logger.info("login");
		MemberDto loginDto = biz.login(dto);
		if(loginDto == null) {
<<<<<<< HEAD
			session.setAttribute("login", null);
		}else {
			session.setAttribute("login", loginDto);
		}
		if(session.getAttribute("login") == null)
		{
			//TODO: 세션설정이 안된 경우
			return "";
		}
		else			
		{
			//TODO: 세션설정이 된 경우
			session.setMaxInactiveInterval(-1);
			return "studdype/studdypeHome";
		}		
=======
			session.setAttribute("member", true);
		}else {
			session.setAttribute("member", false);
		}
		return "studdype/studdypeHome";
>>>>>>> 0e232a854a3787c2c9ae5384bc983575544f8f77
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		logger.info("logout");
		
		session.invalidate();
<<<<<<< HEAD
		return "loginpage/login";
	}
=======
		return "studdype/studdypeHome";
	}
	
	
	
>>>>>>> 0e232a854a3787c2c9ae5384bc983575544f8f77
}
