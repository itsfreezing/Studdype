package com.studdype.test.model.dao.location;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.location.LocationGuDto;
import com.studdype.test.model.dto.study.StudyDto;

public interface LocationGuDao {
	//지역 구 
	String NAMESPACE="locgu.";
	
	public List<LocationGuDto> locationGuList();
	public Map<Integer, String> selectGuForMainPage(List<StudyDto> studyList); //메인페이지 리스트 넘기기
	public String selectGuForStudyHome(int gu_no); // [studyHome] 구 번호로 구 이름 가져오기
	public Map<Integer, String> selectLocationGuOfStudy(int gu_no);	// 구 이름 가져오기
}
