package com.studdype.test.model.dao.study;

import java.util.List;

import com.studdype.test.model.dto.study.StudyDto;

public interface StudyDao {
		//스터디 
		String NAMESPACE="study.";
		
		//메소드
		public List<StudyDto> studyList();
	
	
	
	
}
