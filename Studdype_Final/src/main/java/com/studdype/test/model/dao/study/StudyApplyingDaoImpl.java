package com.studdype.test.model.dao.study;

import java.util.List;
import java.util.Map;

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

	@Override
	public int receiveagree(StudyApplyingDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"receiveagree",dto);
		} catch (Exception e) {
			System.out.println("ERROR: receiveagree!!!!!!!!");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<StudyApplyingDto> snoList(int s_no) {
		List<StudyApplyingDto> list = null;
		
		try {
			list = sqlSession.selectList(NAMESPACE+"snoList",s_no);
		} catch (Exception e) {
			System.out.println("ERROR : snoList!!!!!!!");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int receivereject(StudyApplyingDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE+"receivereject",dto);
		} catch (Exception e) {
			System.out.println("ERROR: receivereject!!!!!!!!!!!");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int receivedelete(StudyApplyingDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"receivedelete",dto);
		} catch (Exception e) {
			System.out.println("ERROR: receivedelete !!!!!!!!!!!!!!!!");
			e.printStackTrace();
		}
		return res;
	}

	// 스터디 가입신청
	@Override
	public int insertStudyMember(StudyApplyingDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertStudyMember", dto);
		} catch (Exception e) {
			System.out.println("[ERROR]: StudyApplyingDao_insertStudyMember");
			e.printStackTrace();
		}
		return res;
	}
	
	// 가입된 스터디인지 확인
	@Override
	public String selectAgree(StudyApplyingDto dto) {
		String agree = null;
		try {
			agree = sqlSession.selectOne(NAMESPACE+"selectAgree", dto);
		} catch (Exception e) {
			System.out.println("[ERROR]: StudyApplyingDao_selectAgree");
			e.printStackTrace();
		}
		return agree;
	}

	
}
