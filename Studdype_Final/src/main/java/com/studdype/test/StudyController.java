package com.studdype.test;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.studdype.test.model.biz.study.StudyBiz;
import com.studdype.test.model.dto.study.StudyDto;

@Controller
public class StudyController {
	
	private static final Logger logger =  LoggerFactory.getLogger(StudyController.class);
	
	@Autowired
	private StudyBiz studyBiz;
	
	
	@RequestMapping("/studyList.do")
	public String list(Model model) {
		List<StudyDto> studyList = null;
		Map<Integer, String> studyMainLeaderNameMap = null; //리더이름을 담을 MAP 설정
		Map<Integer, String> selectSiForMainMap = null;
		Map<Integer, String> selectGuForMainMap = null;
		Map<Integer, String> selectCateForMainMap = null;
		
		logger.info("STUDY - SELECTLIST");
		
		studyList = studyBiz.studyList();	//스터디 리스트
		selectSiForMainMap = studyBiz.selectSiForMainPage(studyList); //구 리스트
		selectGuForMainMap = studyBiz.selectGuForMainPage(studyList); //시 리스트
		studyMainLeaderNameMap = studyBiz.selectLeaderNameByMainPage(studyList); //리더이름 리스트
		selectCateForMainMap = studyBiz.categoryListForHome(studyList); //카테고리 리스트
		
		model.addAttribute("studyList", studyList);
		model.addAttribute("leaderName", studyMainLeaderNameMap);
		model.addAttribute("siList", selectSiForMainMap);
		model.addAttribute("guList", selectGuForMainMap);
		model.addAttribute("cateList", selectCateForMainMap);

		
		return "studdype/studdypeHome";
	}
	
	
}

