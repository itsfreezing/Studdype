package com.studdype.test.model.biz.study;

import java.util.List;

import com.studdype.test.model.dto.study.StudyDto;

public interface StudyBiz {
	
	public List<StudyDto> studyList();
	public StudyDto selectOneBySno(int s_no);  //스터디 번호로 selectOne
	//public StudyDto selectOneByLeaderNo(int leader_no);  //팀장 번호로 selectOne
}
