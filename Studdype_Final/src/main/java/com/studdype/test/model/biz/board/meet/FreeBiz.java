package com.studdype.test.model.biz.board.meet;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.BoardDto;

public interface FreeBiz {

	public int selectTotalBoardNum(int s_no); // 자유게시판 총 게시글 갯수
	public List<BoardDto> selectPagingBoardList(Map pageMap); //페이징( 15개 게시글만 가져오기)
	public Map<Integer, String> getWriterNameByList(List<BoardDto> list); //리스트로 작성자 이름 가져오기

}
