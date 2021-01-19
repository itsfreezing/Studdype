package com.studdype.test.model.dao.board.meet;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.MeetDto;
import com.studdype.test.model.dto.board.VoteDto;
import com.studdype.test.model.dto.study.StudyDto;

@Repository
public class MeetBoardDaoImpl implements MeetBoardDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 모임게시판 모임 [총 개수]
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
	
	// 모임게시판 [페이징]
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
	
	// 모임게시판 '검색' 모임 [총 개수]
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
	
	// 모임게시판 '검색' [페이징]
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

	
	// 모임게시판 모임 [상세보기]
	@Override
	public MeetDto selectMeetBoardDetail(int meet_no) {
		MeetDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"meetBoardDetail", meet_no);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET DAO selectMeetBoardDetail ---------- [ERROR]");
			e.printStackTrace();
		}
		return dto;
	}
	
	// 모임게시판 '조회수' [증가]
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

	// 모임게시판 모임 [생성]
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
	
	// 모임게시판 모임 '1개' [가져오기]
	@Override
	public MeetDto selectOneMeetBoard(int meet_no) {
		MeetDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOneMeetBoard", meet_no);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET DAO selectOneMeetBoard ---------- [ERROR]");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	// 모임게시판 모임 [수정]
	@Override
	public int updateMeetBoard(MeetDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"updateMeetBoard", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET DAO updateMeetBoard ---------- [ERROR]");
			e.printStackTrace();
		}
		return res;
	}
	
	// 모임게시판 모임 [삭제]
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

	// meetBoard DB 캘린더로 가져오기
	@Override
	public List<MeetDto> selectMeetDBForCalendar(int s_no) {
		List<MeetDto> meetDBForCalendar = null;
		
		try {
			meetDBForCalendar = sqlSession.selectList(NAMESPACE+"selectMeetIntoCalendar");
			
		}catch (Exception e) {
		System.out.println("에러: getDB for calendar");
		e.printStackTrace();
		}
		return meetDBForCalendar;
	}
	
	// 모임게시판_투표 '총' [투표 수]
	@Override
	public int selectVoteResultCnt_Total(int meet_no) {
		int voteTotalResult = 0;
		
		try {
			voteTotalResult = sqlSession.selectOne(NAMESPACE+"selectVoteTotalResult", meet_no);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET DAO selectVoteTotalResult ---------- [ERROR]");
			e.printStackTrace();
		}
		return voteTotalResult;
	}
	
	// 모임게시판_투표 '참가' [투표 수]
	@Override
	public int selectVoteResultCnt_Y(int meet_no) {
		int voteResult = 0;
		
		try {
			voteResult = sqlSession.selectOne(NAMESPACE+"selectVoteResult_Y", meet_no);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET DAO selectVoteResult_Y ---------- [ERROR]");
			e.printStackTrace();
		}
		return voteResult;
	}
	
	// 모임게시판_투표 '불참가' [투표 수]
	public int selectVoteResultCnt_N(int meet_no) {
		int voteResult = 0;
		
		try {
			voteResult = sqlSession.selectOne(NAMESPACE+"selectVoteResult_N", meet_no);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET DAO selectVoteResult_N ---------- [ERROR]");
			e.printStackTrace();
		}
		return voteResult;
	}
	
	// 모임게시판_투표 [투표하기]
	@Override
	public int insertMeetVote(VoteDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"takeVote", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET DAO insertMeetVote ---------- [ERROR]");
			e.printStackTrace();
		}
		return res;
	}

	// 모임게시판_투표 [중복체크]
	@Override
	public int selectVoteMemberCnt(VoteDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectVoteMemberCnt", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET DAO selectVoteMemberCnt ---------- [ERROR]");
			e.printStackTrace();
		}
		
		return res;
	}


}
