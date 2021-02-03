package com.studdype.test.model.dao.board.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.BoardDto;

@Repository
public class DataReplyDaoImpl implements DataReplyDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Map<Integer, Integer> selectReplyCnt(List<BoardDto> list) {
		Map<Integer, Integer> replyCntList = new HashMap<Integer, Integer>();
		
		for(int i = 0; i < list.size(); i++) {
			int cnt = sqlSession.selectOne(NAMESPACE+"selectReplyCnt", list.get(i).getB_no());
			replyCntList.put(list.get(i).getB_no(), cnt);
		}
		
		return replyCntList;
	}

}
