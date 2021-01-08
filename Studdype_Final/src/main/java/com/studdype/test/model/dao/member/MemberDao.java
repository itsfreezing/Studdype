package com.studdype.test.model.dao.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.BookDto;
import com.studdype.test.model.dto.board.ReplyDto;
import com.studdype.test.model.dto.board.MeetDto;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.study.StudyDto;

public interface MemberDao { 
	String NAMESPACE="member.";
	
	
	public MemberDto login(MemberDto dto);//로그인
	public String logout(HttpSession session);//로그아웃
	public int memberInsert(MemberDto dto);//회원가입
	MemberDto selectOne(int mem_no);   //멤버번호로 하나 셀렉트
	String selectNameByNo(int mem_no); //멤버번호로 이름 가져오기
	Map<Integer, String> selectLeaderNameByMainPage(List<StudyDto> studyList); 	//스터디 메인페이지 리스트에 작성자이름 가져오기
	Map<Integer, String> selectWriterByFreeList(List<BoardDto> list); 	  		// 자유 게시판 리스트로 작성자이름 가져오기
	Map<Integer, String> selectWriterByMeetBoardList(List<MeetDto> list); 		// 모임 게시판 리스트로 작성자이름 가져오기
	Map<Integer, MemberDto> selectMemberByFreeList(List<BoardDto> list); //자유게시판 리스트로 memberMap 가져오기
	Map<Integer, MemberDto> selectMemberByFreeReply(List<ReplyDto> replyList); //[자유게시판 댓글]  리스트로 member 정보 가져오기 
	
	// 도서 관련 메소드
	public Map<Integer, Map<String, String>> selectWriterByBookList(List<BookDto> bookList); // 도서 게시판 리스트로 작성자 이름 가져오기
	
	
	
	
	
	
	
	
	
}
