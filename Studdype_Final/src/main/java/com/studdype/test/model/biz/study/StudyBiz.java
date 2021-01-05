package com.studdype.test.model.biz.study;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.studdype.test.common.Pagination;
import com.studdype.test.model.dto.location.LocationGuDto;
import com.studdype.test.model.dto.location.LocationSiDto;
import com.studdype.test.model.dto.study.StudyCategoryDto;
import com.studdype.test.model.dto.study.StudyDto;

@Service
public interface StudyBiz {
	
	public List<StudyDto> studyList(Pagination pagination);	//스터디 리스트
	public StudyDto selectOneBySno(int s_no);  //스터디 번호로 selectOne
	public List<LocationSiDto> locationSiList(); // 지역 (시) selectList
	public List<LocationGuDto> locationGuList(); // 지역(구/군) selectList
	public List<StudyCategoryDto> categoryList(); // 카테고리 selectList
	public int insertStudy(StudyDto dto); //스터디 insert
	public int selectStudyFinalNumber();	// 등록된 스터디 마지막 번호
	public Map<Integer, String> selectLeaderNameByMainPage(List<StudyDto> studyList); //리더이름 가져오기
	public Map<Integer, String> selectGuForMainPage(List<StudyDto> studyList); //구이름 가져오기
	public Map<Integer, String> selectSiForMainPage(List<StudyDto> studyList); //시이름 가져오기
	public Map<Integer, String> categoryListForHome(List<StudyDto> studyList); //카테고리 가져오기 
	public int selectTotalStudyListNum(); //메인페이지 리스트 개수
	

}
