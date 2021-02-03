package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.member.MemberDto;

public interface DataBiz {
	public int selectTotalBoardNum(int s_no);	// 자료실 총 글 갯수
	public List<BoardDto> selectPagingBoardList(Map pageMap);	// 학습 자료실 리스트 15개 가져오기
	public Map<Integer, MemberDto> getMemberMap(List<BoardDto> dataList);	//멤버 번호로 작성자 정보 가져오기
	public Map<Integer, Integer> getReplyCnt(List<BoardDto> dataList);	// 게시글 댓글 갯수 가져오기 
	public BoardDto selectDetail(int b_no, int isVisitPage);	// 조회수 올리고 디테일 페이지 가져오기 
}
