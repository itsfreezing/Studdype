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

import com.studdype.test.model.biz.study.StudyBiz;

@Controller
public class StudyController {
	
	private static final Logger logger =  LoggerFactory.getLogger(StudyController.class);
	
	@Autowired
	private StudyBiz studyBiz;
	
	@RequestMapping("/studdypehome.do")
	public String studdypeHeader() {
		return "studdype/studdypeHome";
	}
	@RequestMapping("/studyList.do")
	public String list(Model model) {
		logger.info("STUDY - SELECTLIST");
		model.addAttribute("studyList",studyBiz.studyList());
		
		return "studdype/studdypeHome";
	}
	
	
}

