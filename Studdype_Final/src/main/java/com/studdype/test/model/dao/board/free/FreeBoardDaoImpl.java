package com.studdype.test.model.dao.board.free;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.BoardDto;

@Repository
public class FreeBoardDaoImpl implements FreeBoardDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//자유게시판 총 게시글 수
	@Override
	public int selectTotalBoardNum(int s_no) {
		int totalNum = 0;
		try {
			totalNum = sqlSession.selectOne(NAMESPACE+"totalBoardNum", s_no);
		} catch (Exception e) {
			System.out.println("[ERROR]: selectTotalBoardNum(int s_no)!!");
			e.printStackTrace();
		}
		
		return totalNum;
	}

	//페이징(15개 게시글만 가져오기)
	@Override
	public List<BoardDto> selectPagingBoardList(Map pageMap) {
		List<BoardDto> resList = null;
				
		try {
			resList = sqlSession.selectList(NAMESPACE+"pagingBoardList", pageMap);
		} catch (Exception e) {
			System.out.println("[ERROR]: selectPagingBoardList");
			e.printStackTrace();
		}
		
		return resList;
	}

}
