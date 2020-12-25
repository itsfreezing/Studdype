package com.studdype.test.model.dao.board.book;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookBoardDaoImpl implements BookBoardDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
	
}
