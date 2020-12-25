package com.studdype.test.model.dao.location;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LocationSiDaoImpl implements LocationSiDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
}
