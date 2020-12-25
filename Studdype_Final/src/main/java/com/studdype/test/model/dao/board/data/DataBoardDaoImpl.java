package com.studdype.test.model.dao.board.data;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DataBoardDaoImpl implements DataBoardDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
}
