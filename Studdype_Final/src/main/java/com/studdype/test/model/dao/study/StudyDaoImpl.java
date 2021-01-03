package com.studdype.test.model.dao.study;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.study.StudyDto;

@Repository
public class StudyDaoImpl implements StudyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//스터디 list 전체 가져오기
	@Override
	public List<StudyDto> studyList() {

		List<StudyDto> studyList = new ArrayList<StudyDto>();

		try {
			studyList = sqlSession.selectList(NAMESPACE + "studyList");
		} catch (Exception e) {
			System.out.println("에러 발생: studyDao - selectList");
			e.printStackTrace();
		}

		return studyList;
	}

	//스터디 번호로 selectOne
	@Override
	public StudyDto selectOneBySno(int s_no) {
		StudyDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectOneBySno", s_no);
		} catch (Exception e) {
			System.out.println("[ERROR]: selectOneBySno");
			e.printStackTrace();
		}
		return res;
	}

}
