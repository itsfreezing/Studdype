package com.studdype.test.model.biz.board;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.MeetDto;
import com.studdype.test.model.dto.board.VoteDto;
import com.studdype.test.model.dto.member.MemberDto;

public interface MeetBiz {
	

	public int selectTotalMeetBoardNum(int s_no);					 		// 모임게시판 모임 [총 개수]
	public List<MeetDto> selectPagingMeetBoardList(Map pageMap); 			// 모임게시판 [페이징]
	public int selectSearchMeetBoardNum(Map searchNumMap);			 		// 모임게시판 '검색' 모임 [총 개수]
	public List<MeetDto> selectPagingSearchMeetList(Map searchPageMap); 	// 모임게시판 '검색' [페이징]
	public Map<Integer, MemberDto> getMemberMap(List<MeetDto> list); 		// 리스트로 '작성자 정보' [가져오기]
	public MeetDto selectMeetBoardDetail(int meet_no, int isVisitPage);		// 모임게시판 모임 [상세보기]
	public int insert(MeetDto dto); 										// 모임게시판 모임 [생성]
	public MeetDto selectOneMeetBoard(int meet_no);							// 모임게시판 모임 '1개' [가져오기]
	public int updateMeetBoard(MeetDto dto);								// 모임게시판 모임 [수정]
	public int delete(int meet_no);											// 모임게시판 모임 [삭제]
	public int selectVoteResultCnt_Total(int meet_no);						// 모임게시판_투표 '총' [투표 수]
	public int selectVoteResultCnt_Y(int meet_no);							// 모임게시판_투표 '참가' [투표 수]
	public int selectVoteResultCnt_N(int meet_no);							// 모임게시판_투표 '불참가' [투표 수]
	public int selectVoteMemberCnt(VoteDto dto);							// 모임게시판_투표 [중복체크]
	public int insertMeetVote(VoteDto dto);									// 모임게시판_투표 [투표하기]
	public List<VoteDto> selectAttendMember(int meet_no);					// 모임게시판_투표 '모임번호'로 [참석] 멤버 리스트
	public List<VoteDto> selectAbsentMember(int meet_no);					// 모임게시판_투표 '모임번호'로 [불참석] 멤버 리스트
	public Map<Integer, MemberDto> getAttendMemberMap(List<VoteDto> list);	// 모임게시판_투표 [참석자] 리스트로 '작성자 정보' [가져오기]
	public Map<Integer, MemberDto> getAbsentMemberMap(List<VoteDto> list);	// 모임게시판_투표 [불참석자] 리스트로 '작성자 정보' [가져오기]
	public List<MeetDto> selectMeetDBForCalendar(int s_no);					// 캘린더에 meet DB값 가져오기
	public MeetDto selectCalendarByData(int s_no, String meet_title, String vote_startdate, String vote_enddate);
	
}
