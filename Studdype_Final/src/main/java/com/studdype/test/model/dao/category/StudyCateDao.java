package com.studdype.test.model.dao.category;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.study.StudyCategoryDto;
import com.studdype.test.model.dto.study.StudyDto;

public interface StudyCateDao {
	//스터디 카테고리 
	String NAMESPACE="studycate.";
	
	public List<StudyCategoryDto> categoryList();
	public Map<Integer, String> categoryListForHome(List<StudyDto> studyList); 	//메인페이지에 카테고리 리스트 넘기기
	public String categoryNameForStudyHome(int cate_no); // [studyHome] 카테고리 번호로 카테고리 이름 가져오기
	public Map<Integer, String> selectCategoryOfStudy(int cate_no);	// 스터디 카테고리 이름 가져오기

}
