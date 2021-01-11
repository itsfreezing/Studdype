package com.studdype.test.model.dao.study;

import java.util.List;

import com.studdype.test.model.dto.study.StudyMemberDto;

public interface StudyMemberDao {
	String NAMESPACE="studymember.";
	
	public List<StudyMemberDto> StudyMemberList(int s_no);
}
