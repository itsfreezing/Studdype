package com.studdype.test.model.biz.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studdype.test.model.dao.study.StudyDao;
import com.studdype.test.model.dto.study.StudyDto;

@Service
public class StudyBizImpl implements StudyBiz{
	
	@Autowired
	private StudyDao study_Dao;
	
	@Override
	public List<StudyDto> studyList() {
		return study_Dao.studyList();
	}
		
}
