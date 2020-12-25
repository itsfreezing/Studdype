package com.studdype.test.model.dao.study;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudyDaoImpl implements StudyDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
}
