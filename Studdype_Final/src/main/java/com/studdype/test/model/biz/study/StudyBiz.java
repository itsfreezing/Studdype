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
	public List<LocationSiDto> locationSiList();
	public List<LocationGuDto> locationGuList();
	public List<StudyCategoryDto> categoryList();

}
