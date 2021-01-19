package com.studdype.test.model.dao.board.book;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.BookDto;

public interface BookDao {
	String NAMESPACE="book.";
	
	public int selectTotalRegisterBookNum(int s_no); // 등록된 도서 총 개수
	public List<BookDto> selectSearchBookList(int s_no);	// 화면에 보여줄 해당 페이지 도서 리스트
	public BookDto selectOneBook(BookDto dto);	// 해당 도서 선택
	public List<BookDto> bookList(int s_no); // 마이페이지 스터디 관리 접근시 booklist
	public int deletebookmain(); // 스터디관리 대표도서 변경시 대표도서 없애기
	public int bookmain(int b_no); // 대표도서 변경 메소드
	
}
