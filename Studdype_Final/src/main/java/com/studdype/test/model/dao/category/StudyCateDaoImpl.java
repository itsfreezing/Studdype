package com.studdype.test.model.dao.category;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudyCateDaoImpl implements StudyCateDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
}
