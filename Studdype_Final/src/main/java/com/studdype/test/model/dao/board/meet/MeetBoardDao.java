package com.studdype.test.model.dao.board.meet;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.MeetDto;
import com.studdype.test.model.dto.board.VoteDto;
import com.studdype.test.model.dto.study.StudyDto;


public interface MeetBoardDao { 
	
	//모임 게시판 게시글 
	String NAMESPACE="meetboard.";
	

	public int selectTotalMeetBoardNum(int s_no);				 		// 모임게시판 모임 [총 개수] 
	public List<MeetDto> selectPagingMeetBoardList(Map pageMap); 		// 모임게시판 모임 [페이징]
	public int selectSearchMeetBoardNum(Map searchNumMap);			 	// 모임게시판 '검색' 게시글 [총 개수]
	public List<MeetDto> selectPagingSearchMeetList(Map searchPageMap); // 모임게시판 '검색' [페이징]
	public MeetDto selectMeetBoardDetail(int meet_no);				 	// 모임게시판 모임 [상세보기] 		
	public void updateMeetCnt(int meet_no);					 	 		// 모임게시판 '조회수' [증가]
	public int insertMeetBoard(MeetDto dto); 					 		// 모임게시판 모임 [생성]
	public MeetDto selectOneMeetBoard(int meet_no);						// 모임게시판 모임 '1개' [가져오기]
	public int updateMeetBoard(MeetDto dto);							// 모임게시판 모임 [수정]
	public int deleteMeetBoard(int meet_no);					 		// 모임게시판 모임 [삭제]
	public int selectVoteResultCnt_Total(int meet_no);					// 모임게시판_투표 '총' [투표 수]
	public int selectVoteResultCnt_Y(int meet_no);						// 모임게시판_투표 '참가' [투표 수]
	public int selectVoteResultCnt_N(int meet_no);						// 모임게시판_투표 '불참가' [투표 수]
	public int insertMeetVote(VoteDto dto);								// 모임게시판_투표 [투표하기]
	public int selectVoteMemberCnt(VoteDto dto);						// 모임게시판_투표 [중복체크]
	public List<MeetDto> selectMeetDBForCalendar(int s_no);				// 캘린더에 meet DB값 가져오기

}
