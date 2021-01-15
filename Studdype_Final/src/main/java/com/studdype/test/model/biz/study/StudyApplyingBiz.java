package com.studdype.test.model.biz.study;

import java.util.List;

import org.springframework.stereotype.Service;

import com.studdype.test.model.dto.study.StudyApplyingDto;

@Service
public interface StudyApplyingBiz {
	public List<StudyApplyingDto> studyApplyingList(int mem_no);
	public StudyApplyingDto selectOneByMno(int mem_no);
}
