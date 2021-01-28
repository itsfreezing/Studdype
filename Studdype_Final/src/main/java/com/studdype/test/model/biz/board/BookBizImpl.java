package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.studdype.test.model.dao.board.book.BookDao;
import com.studdype.test.model.dao.board.book.BookReplyDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.board.BookDto;
import com.studdype.test.model.dto.member.MemberDto;

@Service
public class BookBizImpl implements BookBiz{

	@Autowired
	private BookDao bookDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BookReplyDao bookReplyDao;
	
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

	public int deletebookmain() {
		
		return bookDao.deletebookmain();
	}
	
	
	@Override
	public int bookmain(int b_no) {
		int a = bookDao.deletebookmain();
		if(a>0) {
			return bookDao.bookmain(b_no);
		}else {
			return bookDao.bookmain(b_no);
		}
		
	}
	public int insertRegisterBook(BookDto dto) {
		return bookDao.insertRegisterBook(dto);
	}

	@Override
	@Transactional
	public BookDto deleteBook(BookDto dto) {
		BookDto resDto = new BookDto();
		
		int res = bookDao.deleteBook(dto);
		bookReplyDao.deleteBoardReply(dto.getB_no());
		
		if(res > 0) {
			resDto = null;
		}else {
			resDto = bookDao.selectOneBook(dto);
		}
		
		return resDto;
	}

	@Override
	public int bookBoardUpdateBook(BookDto dto) {
		return bookDao.bookBoardUpdateBook(dto);

	}

	// 스터디 메인도서 가져오기
	@Override
	public BookDto selectMainBookOfStudy(int s_no) {
		return bookDao.selectMainBookOfStudy(s_no);
	}

	
}
