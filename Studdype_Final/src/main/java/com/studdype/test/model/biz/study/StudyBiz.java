package com.studdype.test.model.biz.study;

import java.util.List;

import com.studdype.test.model.dto.location.LocationGuDto;
import com.studdype.test.model.dto.location.LocationSiDto;
import com.studdype.test.model.dto.study.StudyCategoryDto;
import com.studdype.test.model.dto.study.StudyDto;

public interface StudyBiz {
	
	public List<StudyDto> studyList();

	public StudyDto selectOneBySno(int s_no);  //스터디 번호로 selectOne
	//public StudyDto selectOneByLeaderNo(int leader_no);  //팀장 번호로 selectOne
	public List<LocationSiDto> locationSiList(); // 지역 (시) selectList
	public List<LocationGuDto> locationGuList(); // 지역(구/군) selectList
	public List<StudyCategoryDto> categoryList(); // 카테고리 selectList
	public int insertStudy(StudyDto dto); //스터디 insert

}
