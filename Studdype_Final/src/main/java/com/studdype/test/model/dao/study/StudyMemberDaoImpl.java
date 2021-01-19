package com.studdype.test.model.dao.study;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.study.StudyMemberDto;
@Repository
public class StudyMemberDaoImpl implements StudyMemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//스터디 번호로 가입된 스터디 멤버번호 가져오기
	@Override
	public List<StudyMemberDto> StudyMemberList(int s_no) {
		List<StudyMemberDto> list = null;
		
		try {
			list = sqlSession.selectList(NAMESPACE+"StudyMemberList",s_no);
		} catch (Exception e) {
			System.out.println("ERROR:StudyMemberList");
			e.printStackTrace();
		}
		
		return list;
	}
	
	//멤버 번호로 가입된 스터디번호 가져오기
	@Override
	public List<StudyMemberDto> StudyList(int mem_no) {
		List<StudyMemberDto> list = null;
		
		try {
			list = sqlSession.selectList(NAMESPACE+"StudyList",mem_no);
		} catch (Exception e) {
			System.out.println("----------ERROR   :   StudyList--------------");
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public int StudyTotalNum(int mem_no) {
		int StudyTotalNum = 0;
		
		try {
			StudyTotalNum = sqlSession.selectOne(NAMESPACE+"StudyTotalNum",mem_no);
		} catch (Exception e) {
			System.out.println("ERROR : StudyTotalNum!!!!!!!!!!");
			e.printStackTrace();
		}
		return StudyTotalNum;
	}

	@Override
	public List<StudyMemberDto> pagingstudylist(Map pageMap) {
		List<StudyMemberDto> List = null;
		
		try {
			List = sqlSession.selectList(NAMESPACE+"pagingstudylist",pageMap);
		} catch (Exception e) {
			System.out.println("ERROR : pagingstudylist!!!!!!!");
			e.printStackTrace();
		}
		
		return List;
	}
	
}
