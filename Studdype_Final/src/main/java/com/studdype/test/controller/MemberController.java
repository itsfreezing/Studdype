package com.studdype.test.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.studdype.test.common.MailSender;
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
	
	@RequestMapping(value="/signup.do",method=RequestMethod.POST)
	public String memberInsert(HttpServletRequest request,MemberDto dto) {
		logger.info("signup page");
		int res=0;
		System.out.println(dto.getMem_id());
		System.out.println(dto.getMem_pw());
		String memberrrn=request.getParameter("mem_rno")+"-"+request.getParameter("memrno");
		System.out.println(memberrrn);
		System.out.println(dto);
		res=memberBiz.memberInsert(dto);
		if(res>0) {
			System.out.println("성공");
			return "loginpage/login";
		}else {
			System.out.println("실패");
			return "redirect:signupform.do";
		}
	}
	
	@RequestMapping(value="/idcheck.do", method=RequestMethod.POST)
	public @ResponseBody int idchk(@RequestBody MemberDto dto) {
		logger.info("ID CHECK");
		MemberDto res=null;
		int isUsed=0;
		System.out.println(dto.getMem_id());
		res=memberBiz.idchk(dto.getMem_id());
		if(res!=null) { //중복되지 않는 아이디일경우 
			 isUsed=1;
		}else {
			 isUsed=0;
		}
		return isUsed;
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
	
	//비밀번호 찾기
	@RequestMapping("/findpwform.do")
	public String findPasswordForm() { 
		
		return "loginpage/findpwform";
	}
	
	//인증번호 보내기
	@RequestMapping(value="/sendVerification.do", method=RequestMethod.POST)
	public @ResponseBody Map sendVerification(@RequestBody MemberDto dto, HttpSession session) {
		MailSender sender = new MailSender();
		Map resMap = new HashMap();
		
		MemberDto resDto = memberBiz.selectMemberByIdAndEmail(dto);
		
		//아이디와 이메일이 일치하면
		if ( resDto != null) {
			resMap.put("isExist", "y"); //결과
			String randNum = sender.getRandNum();
			
			sender.sendVerifiMail(resDto, randNum);
			session.setAttribute("randNum", randNum);
		}else {
			resMap.put("isExist", "n"); //결과
		}
		
		
		return resMap;
	}
	
	//인증번호 확인
		@RequestMapping(value="/chkVerification.do", method=RequestMethod.POST)
		public @ResponseBody Map chkVerification(@RequestBody String chk, HttpSession session) {
			MailSender sender = new MailSender();
			Map resMap = new HashMap();
			
			String[] chkList = chk.split("\"");
			String chkVal = chkList[chkList.length-2];
			//인증번호와  입력인증번호가 일치하면
			if ( chkVal.equals( session.getAttribute("randNum") ) ) {
				resMap.put("isExist", "y"); //결과
			}else {
				resMap.put("isExist", "n"); //결과
			}
			
			
			return resMap;
		}
		
		//임시 비밀번호 보내기
		@RequestMapping("/sendExtraPw.do")
		public String sendExtraPw(Model model, MemberDto member) {
			MailSender sender = new MailSender();
			String extraPw = ""; //임시 비밀번호
			for(int i = 0; i < 12 ; i++) {
				int random = (int)(Math.random()*2)+1; //영어일지 숫자일지
				if( i  ==  0) {
					char rand_alpabet = (char)((int)(Math.random()*26)+97 );
					extraPw += rand_alpabet;
				}else if(random == 1) {
					char rand_alpabet = (char)((int)(Math.random()*26)+97 );
					extraPw += rand_alpabet;
				}else {
					char rand_num =  (char)((int)(Math.random()* 10 )+48);
					extraPw += rand_num;
				}
			}
			MemberDto dto = memberBiz.selectMemberByIdAndEmail(member);
			dto.setMem_pw(extraPw);
			int res = memberBiz.updatePw(dto);
			sender.sendExtraPwMail(dto);
			model.addAttribute("member", dto);
			return "loginpage/findpwres";
		}		
}
	

	