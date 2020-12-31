package com.studdype.test.model.dao.board.meet;

import java.util.List;

import com.studdype.test.model.dto.board.MeetDto;


public interface MeetBoardDao {
	
	//모임 게시판 게시글 
	String NAMESPACE="meetboard.";
	
	public List<MeetDto> meetBoardSelectList();
	public MeetDto meetBoardSelectOne(int meet_no);
	public int meetBoardInsert(MeetDto dto);
	public int meetBoardUpdate(MeetDto dto);
	public int meetBoardDelete(int meet_no);
	
}
