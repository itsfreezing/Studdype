package com.studdype.test.model.dao.board.data;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.BoardDto;

public interface DataReplyDao {
	//자료실 게시판 게시글 
	String NAMESPACE="dataReply.";
	
	public Map<Integer, Integer> selectReplyCnt(List<BoardDto> list);	// 게시물 댓글 수
}
