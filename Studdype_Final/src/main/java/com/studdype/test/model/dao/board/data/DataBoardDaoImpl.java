package com.studdype.test.model.dao.board.data;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.BoardDto;

@Repository
public class DataBoardDaoImpl implements DataBoardDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectTotalBoardNum(int s_no) {
		int totalBoardNum = 0;
		
		try {
			totalBoardNum = sqlSession.selectOne(NAMESPACE+"selectTotalBoardNum", s_no);
		} catch (Exception e) {
			System.out.println("[ERROR] : [학습자료실] selectTotalBoardNum");
			e.printStackTrace();
		}
		
		return totalBoardNum;
	}

	@Override
	public List<BoardDto> selectPagingBoardList(Map pageMap) {
		List<BoardDto> dataList = new ArrayList<BoardDto>();
		
		try {
			dataList = sqlSession.selectList(NAMESPACE+"selectPagingBoardList", pageMap);
		} catch (Exception e) {
			System.out.println("[ERROR] : [학습자료실] selectPagingBoardList");
			e.printStackTrace();
		}
		
		return dataList;
	}

	@Override
	public int updateCnt(int b_no) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"updateCnt", b_no);
		} catch (Exception e) {
			System.out.println("[ERROR] : [학습자료실] updateCnt");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public BoardDto selectOne(int b_no) {
		BoardDto dto = new BoardDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", b_no);
		} catch (Exception e) {
			System.out.println("[ERROR] : [학습자료실] selectOne");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int deleteBoard(int b_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"deleteBoard", b_no);
		} catch (Exception e) {
			System.out.println("[ERROR] : [학습자료실] deleteBoard");
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int insertBoard(BoardDto board) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertBoard", board);
		} catch (Exception e) {
			System.out.println("[ERROR] : [학습 자료실] insertBoard");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int updateBoard(BoardDto board) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"updateBoard"+board);
		} catch (Exception e) {
			System.out.println("[ERROR] : [학습 자료실] updateBoard");
			e.printStackTrace();
		}
		
		return res;
	}


}
