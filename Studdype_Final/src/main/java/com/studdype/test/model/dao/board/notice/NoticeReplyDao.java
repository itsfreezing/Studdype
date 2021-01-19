package com.studdype.test.model.dao.board.notice;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.BoardDto;

public interface NoticeReplyDao {
	//공지사항 댓글 
	String NAMESPACE="noticereply.";

	Map<Integer, Integer> selectReplyCnt(List<BoardDto> noticeList);
}
