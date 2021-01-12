package com.studdype.test.model.dao.study;

import java.util.List;

import com.studdype.test.model.dto.study.StudyMemberDto;

public interface StudyMemberDao {
	String NAMESPACE="studymember.";
	
	public List<StudyMemberDto> StudyMemberList(int s_no); //스터디 번호로 가입된 스터디 멤버번호 가져오기
	public List<StudyMemberDto> StudyList(int mem_no);  //멤버 번호로 가입된 스터디번호 가져오기
}
