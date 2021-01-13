package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.MeetDto;
import com.studdype.test.model.dto.member.MemberDto;

public interface MeetBiz {
	
	public int selectTotalMeetBoardNum(int s_no);					 	// 모임게시판 모임 [총 개수]
	public List<MeetDto> selectPagingMeetBoardList(Map pageMap); 		// 모임게시판 [페이징]
	public int selectSearchMeetBoardNum(Map searchNumMap);			 	// 모임게시판 '검색' 모임 [총 개수]
	public List<MeetDto> selectPagingSearchMeetList(Map searchPageMap); // 모임게시판 '검색' [페이징]
	public Map<Integer, MemberDto> getMemberMap(List<MeetDto> list); 	// 리스트로 '작성자 정보' [가져오기]
	public MeetDto selectMeetBoardDetail(int meet_no, int isVisitPage);	// 모임게시판 모임 [상세보기]
	public int insert(MeetDto dto); 									// 모임게시판 모임 [생성]
	public MeetDto selectOneMeetBoard(int meet_no);						// 모임게시판 모임 '1개' [가져오기]
	public int update(MeetDto dto);										// 모임게시판 모임 [수정]
	public int delete(int meet_no);										// 모임게시판 모임 [삭제]
	public List<MeetDto> selectMeetDBForCalendar(int s_no);				// 캘린더에 meet DB값 가져오기
}
