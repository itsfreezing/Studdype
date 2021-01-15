package com.studdype.test.model.dao.study;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.study.StudyApplyingDto;

@Repository
public class StudyApplyingDaoImpl implements StudyApplyingDao{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<StudyApplyingDto> studyApplyingList(int mem_no) {
		List<StudyApplyingDto> list = null;
		
		try {
			list = sqlSession.selectList(NAMESPACE+"studyApplyingList",mem_no);
		} catch (Exception e) {
			System.out.println("ERROR: studyApplyingList!!!!!!!!");
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public StudyApplyingDto selectOneByMno(int mem_no) {
		StudyApplyingDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOneByMno",mem_no);
		} catch (Exception e) {
			System.out.println("ERROR: selectOneByMno!!!!!!!!!!!!!");
			e.printStackTrace();
		}
		return dto;
	}
	
	
	
}
