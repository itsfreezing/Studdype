package com.studdype.test.model.biz.study;

import java.util.List;

import org.springframework.stereotype.Service;

import com.studdype.test.model.dto.study.StudyDto;

@Service
public interface StudyBiz {
	public List<StudyDto> studyList();
}
