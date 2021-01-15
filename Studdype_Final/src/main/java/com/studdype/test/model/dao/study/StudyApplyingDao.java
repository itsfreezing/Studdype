package com.studdype.test.model.dao.study;

import java.util.List;

import com.studdype.test.model.dto.study.StudyApplyingDto;

public interface StudyApplyingDao {
	String NAMESPACE="studyapplying.";
	
	public List<StudyApplyingDto> studyApplyingList(int mem_no);
	public StudyApplyingDto selectOneByMno(int mem_no);
	
}
