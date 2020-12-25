package com.studdype.test.model.dao.board.notice;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeBoardDaoImpl implements NoticeBoardDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
}
