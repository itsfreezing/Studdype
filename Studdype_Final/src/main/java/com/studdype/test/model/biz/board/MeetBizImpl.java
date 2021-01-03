package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studdype.test.model.dao.board.meet.MeetBoardDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.board.MeetDto;

@Service
public class MeetBizImpl implements MeetBiz {
	
	@Autowired
	private MeetBoardDao meetboarddao;
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public List<MeetDto> selectList() {
		return meetboarddao.meetBoardSelectList();
	}
	
	//리스트로 작성자 이름 가져오기
	@Override
	public Map<Integer, String> getWriterNameByList(List<MeetDto> list) {
		return memberDao.selectWriterByFreeList(list);
	}

	@Override
	public MeetDto selectOne(int meet_no) {
		return meetboarddao.meetBoardSelectOne(meet_no);
	}

	@Override
	public int insert(MeetDto dto) {
		return meetboarddao.meetBoardInsert(dto);
	}

	@Override
	public int update(MeetDto dto) {
		return meetboarddao.meetBoardUpdate(dto);
	}

	@Override
	public int delete(int meet_no) {
		return meetboarddao.meetBoardDelete(meet_no);
	}

}
