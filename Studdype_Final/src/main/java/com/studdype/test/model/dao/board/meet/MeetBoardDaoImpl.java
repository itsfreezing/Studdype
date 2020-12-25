package com.studdype.test.model.dao.board.meet;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MeetBoardDaoImpl implements MeetBoardDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
}
