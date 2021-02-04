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
			System.out.println("[ERROR] : selectTotalBoardNum");
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
			System.out.println("[ERROR] : selectPagingBoardList");
			e.printStackTrace();
		}
		
		return dataList;
	}


}
