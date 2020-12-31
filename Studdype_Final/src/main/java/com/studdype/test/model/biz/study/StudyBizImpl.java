package com.studdype.test.model.biz.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studdype.test.model.dao.category.StudyCateDao;
import com.studdype.test.model.dao.location.LocationGuDao;
import com.studdype.test.model.dao.location.LocationSiDao;
import com.studdype.test.model.dao.study.StudyDao;
import com.studdype.test.model.dto.location.LocationGuDto;
import com.studdype.test.model.dto.location.LocationSiDto;
import com.studdype.test.model.dto.study.StudyCategoryDto;
import com.studdype.test.model.dto.study.StudyDto;

@Service
public class StudyBizImpl implements StudyBiz{
	
	@Autowired
	private StudyDao study_Dao;
	
	@Autowired
	private LocationSiDao locationSidao;
	
	@Autowired
	private LocationGuDao locationGudao;
	
	@Autowired
	private StudyCateDao studyCatedao;
	
	@Override
	public List<StudyDto> studyList() {
		return study_Dao.studyList();
	}


	//스터디 번호로 selectOne
	@Override
	public StudyDto selectOneBySno(int s_no) {
		return study_Dao.selectOneBySno(s_no);
	}
	@Override
	public List<LocationSiDto> locationSiList() {
		return locationSidao.locationSiList();
	}

	@Override
	public List<LocationGuDto> locationGuList() {
		return locationGudao.locationGuList();
	}

	@Override
	public List<StudyCategoryDto> categoryList() {
		return studyCatedao.categoryList();

	}
		
}
