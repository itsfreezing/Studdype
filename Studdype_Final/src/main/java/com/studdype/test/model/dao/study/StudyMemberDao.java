package com.studdype.test.model.dao.study;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.study.StudyMemberDto;

public interface StudyMemberDao {
	String NAMESPACE="studymember.";
	
	public List<StudyMemberDto> StudyMemberList(int s_no); //스터디 번호로 가입된 스터디 멤버번호 가져오기
	public List<StudyMemberDto> StudyList(int mem_no);  //멤버 번호로 가입된 스터디번호 가져오기
	public int StudyTotalNum(int mem_no);
	public List<StudyMemberDto> pagingstudylist(Map pageMap);
	public int deletemember(StudyMemberDto dto);
}
