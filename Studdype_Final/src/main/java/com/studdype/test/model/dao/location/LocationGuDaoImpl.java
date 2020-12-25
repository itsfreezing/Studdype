package com.studdype.test.model.dao.location;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LocationGuDaoImpl implements LocationGuDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
}
