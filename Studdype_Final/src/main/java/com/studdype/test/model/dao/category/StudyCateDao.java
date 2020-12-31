package com.studdype.test.model.dao.category;

import java.util.List;

import com.studdype.test.model.dto.study.StudyCategoryDto;

public interface StudyCateDao {
	//스터디 카테고리 
	String NAMESPACE="studycate.";
	
	public List<StudyCategoryDto> categoryList();
}
