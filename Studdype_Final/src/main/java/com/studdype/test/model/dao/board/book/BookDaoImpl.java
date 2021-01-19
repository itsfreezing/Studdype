package com.studdype.test.model.dao.board.book;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.BookDto;

@Repository
public class BookDaoImpl implements BookDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 등록된 도서 총 개수
	@Override
	public int selectTotalRegisterBookNum(int s_no) {
		int totalRegisterBookNum = 0;
		System.out.println("스터디 번호(매개변수) : "+s_no);
		try {
			totalRegisterBookNum = sqlSession.selectOne(NAMESPACE+"selectTotalRegisterBookNum", s_no);
			System.out.println("쿼리 이후 : "+totalRegisterBookNum);
		} catch (Exception e) {
			System.out.println("[ERROR] : selectTotalRegisterBookNum");
			e.printStackTrace();
		}
		return totalRegisterBookNum;
	}

	// 화면에 보여줄 해당 페이지 도서 리스트
	@Override
	public List<BookDto> selectSearchBookList(int s_no) {
		List<BookDto> selectSearchBookList = new ArrayList<BookDto>();
		
		try {
			selectSearchBookList = sqlSession.selectList(NAMESPACE+"selectSearchBookList", s_no);
		} catch (Exception e) {
			System.out.println("[ERROR] : selectSearchBookList");
			e.printStackTrace();
		}
		return selectSearchBookList;
	}

	@Override
	public BookDto selectOneBook(BookDto dto) {
		BookDto selectOneBook = null;
		
		try {
			selectOneBook = sqlSession.selectOne(NAMESPACE+"selectOneBook", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] : selectOneBook");
			e.printStackTrace();
		}
		return selectOneBook;
	}

	@Override
	public List<BookDto> bookList(int s_no) {
		List<BookDto> bookList = new ArrayList<BookDto>();
		
		try {
			bookList = sqlSession.selectList(NAMESPACE+"bookList",s_no);
		} catch (Exception e) {
			System.out.println("ERROR : bookList");
			e.printStackTrace();
		}
		
		return bookList;
	}

	@Override
	public int insertRegisterBook(BookDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertRegisterBook", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] : insertRegisterBook");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int deleteBook(BookDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"deleteBook", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] : deleteBook");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int bookBoardUpdateBook(BookDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"bookBoardUpdateBook", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] : bookBoardUpdateBook");
			e.printStackTrace();
		}
		
		return res;
	}
	
	

}
