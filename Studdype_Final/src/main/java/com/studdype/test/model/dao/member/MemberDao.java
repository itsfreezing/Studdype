package com.studdype.test.model.dao.member;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.MeetDto;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.study.StudyDto;

public interface MemberDao {
	//회원 
	String NAMESPACE="member.";

	
	MemberDto selectOne(int mem_no);   //멤버번호로 하나 셀렉트
	String selectNameByNo(int mem_no); //멤버번호로 이름 가져오기
	Map<Integer, String> selectWriterByFreeList(List<BoardDto> list); 	  // 자유 게시판 리스트로 작성자이름 가져오기
	Map<Integer, String> selectWriterByMeetBoardList(List<MeetDto> list); // 모임 게시판 리스트로 작성자이름 가져오기
	Map<Integer, String> selectLeaderNameByMainPage(List<StudyDto> list); // 스터디 메인페이지 리스트에 작성자이름 가져오기
	

	
	
	
	
	
	
	
	
	
}
