package com.studdype.test.model.biz.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.studdype.test.model.dao.board.book.BookDao;
import com.studdype.test.model.dao.board.book.BookReplyDao;
import com.studdype.test.model.dao.category.StudyCateDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dao.study.StudyDao;
import com.studdype.test.model.dto.board.BookDto;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.study.StudyCategoryDto;
import com.studdype.test.model.dto.study.StudyDto;

@Service
public class BookBizImpl implements BookBiz{

	@Autowired
	private BookDao bookDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BookReplyDao bookReplyDao;
	
	@Autowired
	private StudyCateDao studyCateDao;
	
	@Autowired
	private StudyDao studyDao;
	
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
	
	@Override
	@Transactional
	public int insertRegisterBook(BookDto dto) {
		int bookCnt = bookDao.selectTotalRegisterBookNum(dto.getS_no());
		int res = 0;
		
		if(bookCnt == 0) {
			dto.setBook_ismain("Y");
			res = bookDao.insertRegisterBook(dto);
		}else {
			dto.setBook_ismain("N");
			res = bookDao.insertRegisterBook(dto);
		}
		
		return res;
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

	@Override
	public List<StudyCategoryDto> selectCateGoryListOfBook() {
		return studyCateDao.categoryList();
	}

	@Override
	public List<StudyDto> selectStudyByCategory(int cate_no) {
		List<StudyDto> studyList = studyDao.selectStudyByCategory(cate_no);
		
		return studyList;
	}

	@Override
	public List<BookDto> selectMainBookByStudy(List<StudyDto> study) {
		Random rand = new Random();
		int[] bookRandom = {};
		int cnt = 0;
		List<BookDto> bookList = new ArrayList<BookDto>();
		List<BookDto> resList = new ArrayList<BookDto>();
		
		bookList = bookDao.selectMainBookByStudy(study);
		
		if(bookList != null) {
			if(bookList.size() > 4) {
				bookRandom[0] = rand.nextInt(bookList.size());
				while(cnt < 4) {
					int random = rand.nextInt(bookList.size());
					
					if(bookRandom[cnt] != random) {
						bookRandom[cnt+1] = random;
						cnt++;
					}
				}
				
				for(int i = 0; i <= cnt; i++) {
					resList.add(bookList.get(bookRandom[i]));
				}
				
			}else {
				for(int i = 0; i < bookList.size(); i++) {
					resList.add(bookList.get(i));
				}
			}
		}
		
		return resList;
	}

}
