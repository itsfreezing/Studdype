
package com.studdype.test.model.dao.board.meet;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.MeetDto;


public interface MeetBoardDao {
	
	//모임 게시판 게시글 
	String NAMESPACE="meetboard.";
	
	public int selectTotalMeetBoardNum(int s_no);				 // 모임게시판 게시글 총 개수 
	public List<MeetDto> selectPagingMeetBoardList(Map pageMap); // 페이징(5개 게시글만 가져오기)
	public List<MeetDto> meetBoardSelectList(); 				 // 모임게시판 리스트
	public MeetDto meetBoardSelectOne(int meet_no);				 // 모임게시판 디테일 		
	public void updateMeetCnt(int meet_no);					 	 // 모임게시판 조회수 증가
	public int insertMeetBoard(MeetDto dto); 					 // 모임게시판 모임생성
	public int updateMeetBoard(MeetDto dto);
	public int deleteMeetBoard(int meet_no);
	
}

