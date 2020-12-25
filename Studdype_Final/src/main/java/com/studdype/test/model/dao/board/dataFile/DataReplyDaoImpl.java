package com.studdype.test.model.dao.board.dataFile;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DataReplyDaoImpl implements DataReplyDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
}
