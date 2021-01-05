package com.studdype.test.model.dao.study;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.study.StudyDto;

public interface StudyDao {
	//스터디 
	String NAMESPACE="study.";
	
	//메소드
	public List<StudyDto> studyList(Map pageMap); //메인페이지 리스트
	public StudyDto selectOneBySno(int s_no); //스터디 번호로 selectOne
	public int insertStudy(StudyDto dto);	// 스터디 insert
	public int selectStudyFinalNumber(); // 등록된 스터디 마지막 번호
	public int selectTotalStudyListNum(); //리스트 총 갯수
	
	
	
}
