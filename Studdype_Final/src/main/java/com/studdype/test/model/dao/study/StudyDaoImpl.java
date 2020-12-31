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

}
