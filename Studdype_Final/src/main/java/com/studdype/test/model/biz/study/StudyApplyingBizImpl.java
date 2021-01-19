package com.studdype.test.model.biz.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studdype.test.model.dao.study.StudyApplyingDao;
import com.studdype.test.model.dto.study.StudyApplyingDto;

@Service
public class StudyApplyingBizImpl implements StudyApplyingBiz {
	@Autowired
	private StudyApplyingDao studyapplyingDao;

	@Override
	public List<StudyApplyingDto> studyApplyingList(int mem_no) {
		
		return studyapplyingDao.studyApplyingList(mem_no);
	}

	@Override
	public StudyApplyingDto selectOneByMno(int mem_no) {
	
		return studyapplyingDao.selectOneByMno(mem_no);
	}

	@Override
	public int receiveagree(StudyApplyingDto dto) {
		
		return studyapplyingDao.receiveagree(dto);
	}

	@Override
	public List<StudyApplyingDto> snoList(int s_no) {
		// TODO Auto-generated method stub
		return studyapplyingDao.snoList(s_no);
	}

	@Override
	public int receivereject(StudyApplyingDto dto) {
		
		return studyapplyingDao.receivereject(dto);
	}

	@Override
	public int receivedelete(StudyApplyingDto dto) {
		
		return studyapplyingDao.receivedelete(dto);
	}
	
	
}
