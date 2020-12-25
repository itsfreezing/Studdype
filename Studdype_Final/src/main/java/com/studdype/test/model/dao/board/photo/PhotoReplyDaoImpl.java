package com.studdype.test.model.dao.board.photo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PhotoReplyDaoImpl implements PhotoReplyDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
}
