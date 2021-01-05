package com.studdype.test.model.dao.board.free;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.BoardDto;

public interface FreeBoardDao {
	//자유게시판 게시글 
	String NAMESPACE="freeboard.";

	public int selectTotalBoardNum(int s_no); //자유게시판 종 게시글 수 
	public List<BoardDto> selectPagingBoardList(Map pageMap);//페이징( 15개 게시글만 가져오기)
	public int insertBoard( BoardDto board); //자유게시판 글 작성
	public BoardDto selectOne(int b_no); //자유게시판 글 가져오기
	public void updateCnt(int b_no); //자유게시판 조회수 증가
}
