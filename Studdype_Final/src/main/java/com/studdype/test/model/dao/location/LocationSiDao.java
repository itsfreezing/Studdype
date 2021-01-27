package com.studdype.test.model.dao.location;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.location.LocationSiDto;
import com.studdype.test.model.dto.study.StudyDto;

public interface LocationSiDao {
	//지역 시 
	String NAMESPACE="locsi.";
	
	public List<LocationSiDto> locationSiList();
	public Map<Integer, String> selectSiForMainPage(List<StudyDto> studyList); //메인페이지 리스트 넘기기
	public String selectSiForStudyHome(int si_no); // [studyHome] 시 번호로 시 이름 가져오기
	public Map<Integer, String> selectLocationSiOfStudy(int si_no);	// 시 이름 가져오기
}
