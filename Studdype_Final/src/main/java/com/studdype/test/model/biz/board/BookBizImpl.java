package com.studdype.test.model.biz.board;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studdype.test.model.dao.board.book.BookDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.board.BookDto;
import com.studdype.test.model.dto.member.MemberDto;

@Service
public class BookBizImpl implements BookBiz{

	@Autowired
	private BookDao bookDao;
	
	@Autowired
	private MemberDao memberDao;
	
	// 스터디에 등록한 도서 리스트 검색
	@Override
	public List<BookDto> selectSearchBookList(int s_no) {
		return bookDao.selectSearchBookList(s_no);
	}

	@Override
	public int selectTotalRegisterBookNum(int s_no) {
		return bookDao.selectTotalRegisterBookNum(s_no);
	}

	@Override
	public Map<Integer, MemberDto> getWriterNameByList(List<BookDto> bookList) {
		return memberDao.selectWriterByBookList(bookList);
	}

	@Override
	public BookDto selectOneBook(BookDto dto) {
		return bookDao.selectOneBook(dto);
	}

	@Override
	public Map<Integer, MemberDto> getBookWriterName(int mem_no) {
		return memberDao.getBookWriterName(mem_no);
	}

	@Override
	public List<BookDto> bookList(int s_no) {
		return bookDao.bookList(s_no);
	}

	@Override
	public int insertRegisterBook(BookDto dto) {
		return bookDao.insertRegisterBook(dto);
	}

	
}
