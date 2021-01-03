package com.studdype.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		logger.info("STUDY - SELECTLIST");
		
		studyList = studyBiz.studyList();
		System.out.println(studyList.get(0).getS_name());
		System.out.println(studyList.get(0).getLeader_no());
		studyMainLeaderNameMap = studyBiz.selectLeaderNameByMainPage(studyList);
		System.out.println(studyMainLeaderNameMap);
		System.out.println(studyMainLeaderNameMap.get(1));
		model.addAttribute("studyList", studyList);
		model.addAttribute("leaderName", studyMainLeaderNameMap);

		
		return "studdype/studdypeHome";
	}
	
	
}

