package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.member.MemberDto;

public interface FreeBiz {

	public int selectTotalBoardNum(int s_no); // 자유게시판 총 게시글 갯수
	public List<BoardDto> selectPagingBoardList(Map pageMap); //페이징( 15개 게시글만 가져오기)
	public Map<Integer, String> getWriterNameByList(List<BoardDto> list); //리스트로 작성자 이름 가져오기
	public int writeBoard(BoardDto board, MultipartFile[] mfileList, String path, List<FileDto> fileList); //자유게시판 글 작성
	public int writeBoard(BoardDto board); //자유게시판 글 작성 파일없을떄
	public BoardDto selectDetail(int b_no, int isVisitPage); //자유게시판 글 디테일
	public Map<Integer, MemberDto> getMemberMap(List<BoardDto> list); //자유게시판 memberMap
	public int deleteBoard(int b_no); //자유게시판 글 삭제
	public int updateBoard(BoardDto board, MultipartFile[] mfileList, String path, List<FileDto> fileList); // 자유게시판 글 수정 (파일있을떄)
	public int updateBoard(BoardDto board); // 자유게시판 글 수정 (파일없을떄)
	public BoardDto selectOne(int b_no); //자유게시판 글 하나 가져오기
	public List<BoardDto> getRecentList(int s_no, int b_no); //자유게시판 디테일페이지 최근글 가져오기
	public Map<Integer, Integer> getReplyCnt(List<BoardDto> list); //댓글 갯수 가져오기
	

}
