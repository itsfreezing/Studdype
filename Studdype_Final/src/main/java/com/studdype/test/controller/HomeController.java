package com.studdype.test.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.studdype.test.model.biz.member.MemberBiz;
import com.studdype.test.model.biz.study.StudyBiz;
import com.studdype.test.model.biz.study.StudyMemberBiz;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.study.StudyDto;
import com.studdype.test.model.dto.study.StudyMemberDto;

import jdk.nashorn.internal.ir.RuntimeNode.Request;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private MemberBiz memberBiz;
	@Autowired
	private StudyBiz studyBiz;
	@Autowired
	private StudyMemberBiz studymemberBiz;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/studdypehome.do")
	public String studdypeHeader() {
		
		return "studdype/studdypeHome";
	}
	
	@RequestMapping("/studdypeexample.do")
	public String studdypeExample() {
	
		return "studdype/studdypeExample";
	}
	
	@RequestMapping("/searchbycategory.do")
	public String searchByCategory() {
	
		return "studdype/searchByCategory";
	}
	
	//마이페이지로 이동
	@RequestMapping("/myPage.do")
	public String myPage(HttpSession session) {
		MemberDto login = memberBiz.selectOne(1);
		List<StudyMemberDto> joinedstudy = studymemberBiz.StudyList(1);
		List<StudyDto> studylist = new ArrayList<StudyDto>();
		
		for(int i=0;i<joinedstudy.size();i++) {
			StudyDto dto = studyBiz.selectOneBySno(joinedstudy.get(i).getS_no());
			studylist.add(dto);
		}
		
	
		session.setAttribute("studylist", studylist);
		session.setAttribute("login", login);
		
		
		return "studdype/myPage";
	}

	//커뮤니티 홈으로

	@RequestMapping("/communityhome.do")
	public String communityHome(HttpSession session,Model model) {
		

		/////////////////////// 테스트용 세션
		MemberDto login = memberBiz.selectOne(2);
		StudyDto study = studyBiz.selectOneBySno(1);
		
		session.setAttribute("study", study); //스터디 세션
		session.setAttribute("login", login); //스터디 세션
		//////////////////화상회의 테스트를 위한 session login, study커뮤니티접근 세션 구현후 삭제
		session.setAttribute("leftnavi", "studyhome");
	
		return "community/communityHome";
	}
	@RequestMapping("studycommunity.do")
	public String studycommunity(HttpSession session,int s_no) {
		MemberDto login = memberBiz.selectOne(1);
		StudyDto study = studyBiz.selectOneBySno(s_no);
		
		session.setAttribute("study", study);
		session.setAttribute("login", login);
		session.setAttribute("leftnavi", "studyhome");
		
		return "community/communityHome";
	}
	
	@RequestMapping("/notice.do")
	public String notice(HttpSession session) {
		session.setAttribute("leftnavi", "notice");
		return "community/notice";
	}
	

	
	@RequestMapping("/signupform.do")
	public String signup(HttpSession session) {
		return "loginpage/signup";
	}
	
	@RequestMapping("/notetest.do")
	public String notetest() {
		return "notetest";
	}
	
}









