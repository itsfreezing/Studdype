package com.studdype.test.model.dao.board.sche;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScheBoardDaoImpl implements ScheBoardDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
}
