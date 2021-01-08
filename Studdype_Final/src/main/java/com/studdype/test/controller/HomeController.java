package com.studdype.test.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
<<<<<<< HEAD
=======


>>>>>>> 0e232a854a3787c2c9ae5384bc983575544f8f77
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;
import com.studdype.test.model.biz.member.MemberBiz;
import com.studdype.test.model.biz.study.StudyBiz;
import com.studdype.test.model.dto.study.StudyDto;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.location.LocationGuDto;
import com.studdype.test.model.dto.location.LocationSiDto;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.study.StudyCategoryDto;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private MemberBiz memberBiz;
	@Autowired
	private StudyBiz studyBiz;

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

	//而ㅻ�ㅻ땲�떚 �솃�쑝濡�

	@RequestMapping("/communityhome.do")
	public String communityHome(HttpSession session) {
		
		/////////////////////// �뀒�뒪�듃�슜 �꽭�뀡
		MemberDto login = memberBiz.selectOne(1);
		StudyDto study = studyBiz.selectOneBySno(1);
		
		
		session.setAttribute("study", study); //�뒪�꽣�뵒 �꽭�뀡
		session.setAttribute("login", login); //濡쒓렇�씤 �꽭�뀡
		//////////////////// �솕�긽�쉶�쓽 �뀒�뒪�듃瑜� �쐞�븳 session login, study而ㅻ�ㅻ땲�떚�젒洹� �꽭�뀡 援ы쁽�썑 �궘�젣
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









