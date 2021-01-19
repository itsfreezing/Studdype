package com.studdype.test.model.dao.board.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.BoardDto;

@Repository
public class NoticeReplyDaoImpl implements NoticeReplyDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	//댓글 갯수 가져오기
	@Override
	public Map<Integer, Integer> selectReplyCnt(List<BoardDto> noticeList) {
		Map<Integer,Integer> cntList = new HashMap<Integer, Integer>();
		
		for(int i = 0 ; i < noticeList.size() ; i++) {
			int cnt = sqlSession.selectOne(NAMESPACE+"selectReplyCnt", noticeList.get(i).getB_no());
			cntList.put(noticeList.get(i).getB_no(), cnt);
		}
		
		return cntList;
	}

}
