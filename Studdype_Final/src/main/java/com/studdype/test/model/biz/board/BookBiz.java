package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.BookDto;

public interface BookBiz {
	public int selectTotalRegisterBookNum(int s_no); // 등록된 도서 총 개수
	public List<BookDto> selectPageBookList(Map pageMap);	// 화면에 보여줄 해당 페이지 도서 리스트(4개)
	public Map<Integer, Map<String, String>> getWriterNameByList(List<BookDto> bookList); // 회원 번호로 회원 아이디, 이름 찾아오기
}
