package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.MeetDto;
import com.studdype.test.model.dto.study.StudyDto;

public interface MeetBiz {
	
	public int selectTotalMeetBoardNum(int s_no);					 	 // 모임 게시판 게시글 총 개수
	public List<MeetDto> selectList(); 			  						 // 모임게시판 리스트
	public List<MeetDto> selectPagingMeetBoardList(Map pageMap); 		 // 페이징(5개 게시글만 가져오기)
	public Map<Integer, String> getWriterNameByList(List<MeetDto> list); // 리스트로 작성자 이름 가져오기
	public MeetDto selectOne(int meet_no, int isVisitPage);				 // 모임게시판 디테일
	public int insert(MeetDto dto); 									 // 모임게시판 모임생성
	public int update(MeetDto dto);
	public int delete(int meet_no);
	public List<MeetDto> selectMeetDBForCalendar(int s_no);
}
