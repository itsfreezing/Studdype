package com.studdype.test.model.dao.study;

import java.util.List;

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
	
}
