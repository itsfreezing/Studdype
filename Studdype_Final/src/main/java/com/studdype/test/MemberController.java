package com.studdype.test;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.studdype.test.model.biz.MemberBiz;
import com.studdype.test.model.dto.member.MemberDto;

@Controller
public class MemberController {
	
	private Logger logger=LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberBiz biz;
	
	@RequestMapping("/loginPage.do")
	public String loginPage() {
		logger.info("[login]");
		return "loginpage/login";
	}
	
	   @RequestMapping(value="/ajaxlogin.do", method=RequestMethod.POST)
	   @ResponseBody 
	public Map<String,Boolean>ajaxLogin(HttpSession session,@RequestBody MemberDto dto ){
		logger.info("[LOGIN]");
	      
	      MemberDto res = biz.login(dto);
	      
	      boolean check = false;
	      
	      if(res != null) {
	         session.setAttribute("login",res);
	         check=true;
	      }
	      
	      Map<String,Boolean> map = new HashMap<String,Boolean>();
	      map.put("check",check);
	      
	      
	      
	      return map;
	   		}
	   }
