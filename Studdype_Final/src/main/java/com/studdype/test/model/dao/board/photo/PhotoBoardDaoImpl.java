package com.studdype.test.model.dao.board.photo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.common.SearchPagination;
import com.studdype.test.model.dto.board.BoardDto;

@Repository
public class PhotoBoardDaoImpl implements PhotoBoardDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertBoard(BoardDto boardDto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertBoard", boardDto);
		} catch (Exception e) {
			System.out.println("[ERROR]: insertBoard!");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<BoardDto> galleryList(SearchPagination searchPagination) {
		List<BoardDto> galleryList = null;
		try {
			galleryList = sqlSession.selectList(NAMESPACE+"galleryList", searchPagination);
		} catch (Exception e) {
		System.out.println("에러: 갤러리 리스트");
		e.printStackTrace();
		}
		return galleryList;
	}

	@Override
	public int totalGalleryListNum(SearchPagination searchPagination) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"totalGalleryListNum", searchPagination);
		} catch (Exception e) {
		System.out.println("에러 갤러리 전체 페이지 리스트 갯수");
		e.printStackTrace();
		}
		return res;
	}

	@Override
	public BoardDto galleryDetailOne(int b_no) {
		BoardDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"galleryDetailOne", b_no);
		} catch (Exception e) {
			System.out.println("에러: 갤러리 디테일");
			e.printStackTrace();
		}
		return res;
	}

}
