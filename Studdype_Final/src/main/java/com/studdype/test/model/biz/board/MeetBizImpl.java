package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;

import com.studdype.test.model.dao.board.meet.MeetBoardDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.board.MeetDto;

@Validated
@Service
public class MeetBizImpl implements MeetBiz {
	
	@Autowired
	private MeetBoardDao meetBoardDao;
	@Autowired
	private MemberDao memberDao;
	
	// 모임게시판 리스트
	@Override
	public List<MeetDto> selectList() {
		return meetBoardDao.meetBoardSelectList();
	}
	
	// 모임 게시판 총 게시글 갯수
	@Override
	public int selectTotalMeetBoardNum(int s_no) {		
		return meetBoardDao.selectTotalMeetBoardNum(s_no);
	}

	// 페이징(5개 게시글만 가져오기)
	@Override
	public List<MeetDto> selectPagingMeetBoardList(Map pageMap) {
		return meetBoardDao.selectPagingMeetBoardList(pageMap);
	}
	
	// 리스트로 작성자 이름 가져오기
	@Override
	public Map<Integer, String> getWriterNameByList(List<MeetDto> list) {
		return memberDao.selectWriterByMeetBoardList(list);
	}
	
	// 모임게시판 디테일
	@Transactional
	@Override
	public MeetDto selectOne(int meet_no, int isVisitPage) {
		if(isVisitPage == 0) {
			meetBoardDao.updateMeetCnt(meet_no);
		}
		MeetDto dto = meetBoardDao.meetBoardSelectOne(meet_no);
		
		return dto;
	}
	
	// 모임게시판 모임생성
	@Override
	public int insert(MeetDto dto) {
		return meetBoardDao.insertMeetBoard(dto);
	}

	@Override
	public int update(MeetDto dto) {
		return meetBoardDao.updateMeetBoard(dto);
	}

	@Override
	public int delete(int meet_no) {
		return meetBoardDao.deleteMeetBoard(meet_no);
	}

}
