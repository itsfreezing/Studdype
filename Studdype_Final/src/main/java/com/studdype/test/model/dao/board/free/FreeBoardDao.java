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
	public int deleteBoard(int b_no); //자유게시판 글 삭제
	public int updateBoard(BoardDto board); //자유게시판 글 수정
	public List<BoardDto> selectRecentList(int s_no, int b_no); //자유게시판 최근글 5개 가져오기
	public int selectTotalBoardNumOfSearch(Map searchMap); //자유게시판 검색 총 게시글 수 
	public List<BoardDto> selectPagingSearchBoardList(Map<String, Object> pageMap); //자유게시판 검색한글 15개 페이징
}
