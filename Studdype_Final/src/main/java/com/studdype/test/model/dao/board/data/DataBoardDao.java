package com.studdype.test.model.dao.board.data;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.BoardDto;

public interface DataBoardDao {
	//자료실 게시판 게시글 
	String NAMESPACE="dataBoard.";
	public int selectTotalBoardNum(int s_no);	// 자료실 총 글 갯수
	public List<BoardDto> selectPagingBoardList(Map pageMap);	// 학습 자료실 리스트 15개 가져오기
}
