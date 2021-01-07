package com.studdype.test.model.dao.board.book;

import java.util.List;

import com.studdype.test.model.dto.board.BookDto;

public interface BookBoardDao {
	//책 게시판 
	String NAMESPACE="bookboard.";
	
	public List<BookDto> booklist();
}
