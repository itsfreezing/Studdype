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

	//자유게시판 글 작성
	@Override
	public int insertBoard(BoardDto board) {
		int res = 0;
			
		try {
			res = sqlSession.insert(NAMESPACE+"insertBoard", board);
		} catch (Exception e) {
			System.out.println("[ERROR]: insertBoard!");
			e.printStackTrace();
		}
		return res;
	}

	//자유게시판 글 가져오기
	@Override
	public BoardDto selectOne(int b_no) {
		BoardDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", b_no);
		} catch (Exception e) {
			System.out.println("[ERROR]: selectOne!!");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateCnt(int b_no) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"updateCnt", b_no);
		} catch (Exception e) {
			System.out.println("[ERROR]: UpdateCnt");
			e.printStackTrace();
		}
	}

	//자유게시판 글 삭제
	@Override
	public int deleteBoard(int b_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"deleteBoard", b_no);
		} catch (Exception e) {
			System.out.println("[ERROR]: deleteBoard!!");
			e.printStackTrace();
		}
		return res;
	}

	//자유게시판 글 수정
	@Override
	public int updateBoard(BoardDto board) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"updateBoard", board);
		} catch (Exception e) {
			System.out.println("[ERROR}: updateBoard");
			e.printStackTrace();
		}
		return res;
	}

}
