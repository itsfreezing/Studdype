package com.studdype.test.model.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.studdype.test.model.dao.board.book.BookBoardDao;
import com.studdype.test.model.dto.board.BookDto;

public class BookBizImpl implements BookBiz{
	
	@Autowired
	private BookBoardDao BookBoardDao;
	
	@Override
	public List<BookDto> booklist() {
		return BookBoardDao.booklist();
	}
	
}
