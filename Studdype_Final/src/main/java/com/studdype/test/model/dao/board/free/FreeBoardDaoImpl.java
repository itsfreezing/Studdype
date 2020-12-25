package com.studdype.test.model.dao.board.free;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDaoImpl implements FreeBoardDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
}
