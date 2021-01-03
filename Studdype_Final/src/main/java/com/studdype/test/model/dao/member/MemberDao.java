package com.studdype.test.model.dao.member;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.member.MemberDto;

public interface MemberDao {
	//회원 
	String NAMESPACE="member.";

	
	MemberDto selectOne(int mem_no); //멤버번호로 하나 셀렉트
	Map<Integer, String> selectWriterByFreeList(List<BoardDto> list); //자유게시판 리스트로 작성자이름 가져오기
	
	
	
	
	
	
	
	
	
	
}
