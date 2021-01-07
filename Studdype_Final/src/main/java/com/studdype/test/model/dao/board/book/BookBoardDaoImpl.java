package com.studdype.test.model.dao.board.book;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.BookDto;

@Repository
public class BookBoardDaoImpl implements BookBoardDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<BookDto> booklist() {
		List<BookDto> list = new ArrayList<BookDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"booklist");
		} catch (Exception e) {
			System.out.println("[ERROR]: ----- book dao booklist ------------");
			e.printStackTrace();
		}
		
		
		
		return list;
	}
	

	
}
