package com.studdype.test.model.biz.study;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.studdype.test.model.dto.location.LocationGuDto;
import com.studdype.test.model.dto.location.LocationSiDto;
import com.studdype.test.model.dto.study.StudyCategoryDto;
import com.studdype.test.model.dto.study.StudyDto;

@Service
public interface StudyBiz {
	
	public List<StudyDto> studyList();

	public StudyDto selectOneBySno(int s_no);  //스터디 번호로 selectOne
	//public StudyDto selectOneByLeaderNo(int leader_no);  //팀장 번호로 selectOne
	public List<LocationSiDto> locationSiList();
	public List<LocationGuDto> locationGuList();
	public List<StudyCategoryDto> categoryList();
	public Map<Integer, String> selectLeaderNameByMainPage(List<StudyDto> list); //리더이름 가져오기
	public Map<Integer, String> selectGuForMainPage(List<StudyDto> studyList); //구이름 가져오기
	public Map<Integer, String> selectSiForMainPage(List<StudyDto> studyList); //시이름 가져오기
	public Map<Integer, String> categoryListForHome(List<StudyDto> studyList); //카테고리 가져오기 

}
