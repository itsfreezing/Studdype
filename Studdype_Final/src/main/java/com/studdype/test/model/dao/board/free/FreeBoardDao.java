package com.studdype.test.model.dao.board.free;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.BoardDto;

public interface FreeBoardDao {
	//자유게시판 게시글 
	String NAMESPACE="freeboard.";

	public int selectTotalBoardNum(int s_no); //자유게시판 종 게시글 수 
	public List<BoardDto> selectPagingBoardList(Map pageMap);//페이징( 15개 게시글만 가져오기)
}
