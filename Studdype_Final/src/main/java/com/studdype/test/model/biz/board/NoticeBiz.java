package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.member.MemberDto;

public interface NoticeBiz {

	List<BoardDto> selectNoticeBoard(int s_no);// 공지사항 게시글 리스트 가져오기
	List<BoardDto> selectNoticeBoardList(int s_no);// 공지사항 게시글 리스트 역순 가져오기
	Map<Integer, Integer> getReplyCnt(List<BoardDto> noticeList); //공지사항 댓글 갯ㅅ ㅜ가져오기
	Map<Integer, MemberDto> getMemberMap(List<BoardDto> noticeList); //공지사항 작성자 이름 가져오기
	int writeBoard(BoardDto board, MultipartFile[] mfileList, String path, List<FileDto> fileList); //공지사항 글쓰기 첨부파일 있을떄
	int writeBoard(BoardDto board); //공지사항 글쓰기
	int getNoticeNum(int s_no); //공지사항 게시글 수 가져오기
	BoardDto selectDetail(int b_no, int isVisitPage); //공지사항 게시글 디테일페이지 내용 가져오기
	List<BoardDto> getRecentList(int s_no, int b_no); //공지사항 주변글 가져오기

}
