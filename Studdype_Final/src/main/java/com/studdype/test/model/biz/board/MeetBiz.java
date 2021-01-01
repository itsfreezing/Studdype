package com.studdype.test.model.biz.board;

import java.util.List;

import com.studdype.test.model.dto.board.MeetDto;

public interface MeetBiz {
	
	public List<MeetDto>selectList();
	public MeetDto selectOne(int meet_no);
	public int insert(MeetDto dto);
	public int update(MeetDto dto);
	public int delete(int meet_no);
}
