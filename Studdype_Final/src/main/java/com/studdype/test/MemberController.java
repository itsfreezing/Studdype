package com.studdype.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

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
		return "loginpage/signup";
	}
	
	@RequestMapping("/signup.do")
	public String memberInsert(MemberDto dto) {
		int res=0;
		System.out.println(dto.getMem_id());
		System.out.println(dto.getMem_pw());
		
		res=biz.insert(dto);
		if(res>0) {
			return "redirect:loginpage/loginform.do";
		}else {
			return "redirect:loginpage/signupform.do";
		}
	}
	
	
	
	
	
	
	
}
