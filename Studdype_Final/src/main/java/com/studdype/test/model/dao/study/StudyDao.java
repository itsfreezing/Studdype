package com.studdype.test.model.dao.study;

import java.util.List;

import com.studdype.test.model.dto.study.StudyDto;

public interface StudyDao {
	//스터디 
	String NAMESPACE="study.";
	
	//메소드
	public List<StudyDto> studyList();
	public StudyDto selectOneBySno(int s_no); //스터디 번호로 selectOne
	public int insertStudy(StudyDto dto);	// 스터디 insert
	public int selectStudyFinalNumber(); // 등록된 스터디 마지막 번호
	public int studyListCnt(); //총 게시글 개수
	
	
}
