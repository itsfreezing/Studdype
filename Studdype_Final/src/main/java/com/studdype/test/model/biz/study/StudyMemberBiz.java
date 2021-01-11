package com.studdype.test.model.biz.study;

import java.util.List;

import org.springframework.stereotype.Service;

import com.studdype.test.model.dto.study.StudyMemberDto;

@Service
public interface StudyMemberBiz {
	public List<StudyMemberDto> StudyMemberList(int s_no);
	
}
