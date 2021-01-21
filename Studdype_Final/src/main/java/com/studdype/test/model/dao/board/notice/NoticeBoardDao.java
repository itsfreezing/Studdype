package com.studdype.test.model.dao.board.notice;

import java.util.List;

import com.studdype.test.model.dto.board.BoardDto;

public interface NoticeBoardDao {
	//공지사항 게시글 
	String NAMESPACE="noticeboard.";

	List<BoardDto> selectNoticeBoard(int s_no); //공지사항 게시글 리스트가져오기
	int insertBoard(BoardDto board); //공지사항 게시글 작성
	int selectNoticeNum(int s_no); //공지사항 게시글 갯수 가져오기
	int updateCnt(int b_no); //공지사항 게시글 조회수 증가
	BoardDto selectOne(int b_no); //공지사항 게시글 하나 가져오기
	List<BoardDto> selectRecentList(int s_no, int b_no); //공지사항 주변글 가져오기
	List<BoardDto> selectNoticeBoardList(int s_no); // 공지사항 게시글 리스트 역순 가져오기
	int deleteBoard(int b_no); //글삭제
	int updateBoard(BoardDto dto); //글 수정
}
