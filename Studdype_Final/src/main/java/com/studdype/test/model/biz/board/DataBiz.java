package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.member.MemberDto;

public interface DataBiz {
	public int selectTotalBoardNum(int s_no);	// 자료실 총 글 갯수
	public List<BoardDto> selectPagingBoardList(Map pageMap);	// 학습 자료실 리스트 15개 가져오기
	public Map<Integer, MemberDto> getMemberMap(List<BoardDto> dataList);	//멤버 번호로 작성자 정보 가져오기
	public Map<Integer, Integer> getReplyCnt(List<BoardDto> dataList);	// 게시글 댓글 갯수 가져오기 
	public BoardDto selectDetail(int b_no, int isVisitPage);	// 조회수 올리고 디테일 페이지 가져오기
	public int deleteBoard(int b_no);	// 게시글 삭제
	public int writeBoard(BoardDto board, MultipartFile[] mfileList, String path, List<FileDto> fileList); // 파일이 있을 시 글 작성
	public int writeBoard(BoardDto board); // 파일이 없을 시 글 작성
	public BoardDto selectOne(int b_no);	// 해당 게시글 가져오기
	public int updateBoard(BoardDto board, MultipartFile[] mfileList, String path, List<FileDto> fileList); // 파일이 있을 시 글 수정
	public int updateBoard(BoardDto board); // 파일이 없을 시 글 수정
	public int selectTotalBoardNumOfSearch(Map searchMap); // 검색 시 총 게시글 수
	public List<BoardDto> selectPagingSearchBoardList(Map<String, Object> pageMap); // 검색으로 페이징 게시글 가져오기 
}
