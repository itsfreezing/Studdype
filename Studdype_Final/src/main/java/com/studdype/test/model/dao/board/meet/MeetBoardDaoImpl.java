package com.studdype.test.model.dao.board.meet;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.common.SearchPagination;
import com.studdype.test.model.dto.board.MeetDto;

@Repository
public class MeetBoardDaoImpl implements MeetBoardDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 모임게시판 게시물 총 개수
	@Override
	public int selectTotalMeetBoardNum(int s_no) {
		int totalNum = 0;
		
		try {
			totalNum = sqlSession.selectOne(NAMESPACE+"totalMeetBoardNum", s_no);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET DAO selectTotalMeetBoardNum ---------- [ERROR]");
			e.printStackTrace();
		}
		
		return totalNum;
	}
	
	// 모임게시판 페이징
	@Override
	public List<MeetDto> selectPagingMeetBoardList(Map pageMap) {
		List<MeetDto> resList = null;
		
		try {
			resList = sqlSession.selectList(NAMESPACE+"pagingMeetBoardList", pageMap);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET DAO selectPagingMeetBoardList ---------- [ERROR]");
			e.printStackTrace();
		}
		return resList;
	}
	
	// 모임게시판 검색 게시물 총 개수
	@Override
	public int selectSearchMeetBoardNum(Map searchNumMap) {
		int totalNum = 0;
		
		try {
			totalNum = sqlSession.selectOne(NAMESPACE+"totalSearchMeetBoardNum", searchNumMap);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET DAO selectTotalSearchMeetBoardNum ---------- [ERROR]");
			e.printStackTrace();
		}
		
		return totalNum;
	}
	
	// 모임게시판 검색 페이징
	@Override
	public List<MeetDto> selectPagingSearchMeetList(Map searchPageMap) {
		List<MeetDto> resList = null;
		
		try {
			resList = sqlSession.selectList(NAMESPACE+"pagingSearchMeetList", searchPageMap);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET DAO selectPagingSearchMeetList ---------- [ERROR]");
			e.printStackTrace();
		}
		return resList;
	}

	
	// 모임게시판 디테일
	@Override
	public MeetDto meetBoardSelectOne(int meet_no) {
		MeetDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"meetBoardSelectOne", meet_no);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET DAO meetBoardSelectOne ---------- [ERROR]");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateMeetCnt(int meet_no) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"updateMeetCnt", meet_no);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET DAO updateMeetCnt ---------- [ERROR]");
			e.printStackTrace();
		}
	}

	// 모임 게시판 모임생성
	@Override
	public int insertMeetBoard(MeetDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertMeetBoard", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET DAO insertMeetBoard ---------- [ERROR]");
			e.printStackTrace();
		}
		
		return res;
	}
 
	@Override
	public int updateMeetBoard(MeetDto dto) {
		return 0;
	}
	
	// 모임 게시판 모임삭제
	@Override
	public int deleteMeetBoard(int meet_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"deleteMeetBoard", meet_no);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET DAO deleteMeetBoard ---------- [ERROR]");
			e.printStackTrace();
		}
		
		return res;
	}

}
