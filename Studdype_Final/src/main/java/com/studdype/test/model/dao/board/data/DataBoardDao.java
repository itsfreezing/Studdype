package com.studdype.test.model.dao.board.data;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.BoardDto;

public interface DataBoardDao {
	//자료실 게시판 게시글 
	String NAMESPACE="dataBoard.";
	public int selectTotalBoardNum(int s_no);	// 자료실 총 글 갯수
	public List<BoardDto> selectPagingBoardList(Map pageMap);	// 학습 자료실 리스트 15개 가져오기
	public int updateCnt(int b_no);	// 조회수 증가  
	public BoardDto selectOne(int b_no);	// 해당 게시물 가져오기 
	public int deleteBoard(int b_no);	// 해당 게시물 삭제
	public int insertBoard(BoardDto board);	// 글삽입
	public int updateBoard(BoardDto board); // 글 수정
}
