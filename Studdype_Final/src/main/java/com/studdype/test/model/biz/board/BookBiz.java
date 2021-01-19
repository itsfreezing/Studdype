package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;


import com.studdype.test.model.dto.board.BookDto;
import com.studdype.test.model.dto.member.MemberDto;

public interface BookBiz {

	public List<BookDto> bookList(int s_no);
	public int selectTotalRegisterBookNum(int s_no); // 등록된 도서 총 개수
	public List<BookDto> selectSearchBookList(int s_no);	// 화면에 보여줄 해당 페이지 도서 리스트
	public Map<Integer, MemberDto> getWriterNameByList(List<BookDto> bookList); // 회원 번호로 회원 아이디, 이름 찾아오기
	public BookDto selectOneBook(BookDto dto);	// 해당 도서 선택
	public Map<Integer, MemberDto> getBookWriterName(int mem_no); // 해당 도서 아이디, 이름 찾아오기
	public int deletebookmain(); //대표도서 없애기
	public int bookmain(int b_no); // 대표도서 설정
}
