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
import com.studdype.test.model.dto.study.StudyDto;
import com.studdype.test.model.dto.member.MemberDto;

@Validated
@Service
public class MeetBizImpl implements MeetBiz {
	
	@Autowired
	private MeetBoardDao meetBoardDao;
	@Autowired
	private MemberDao memberDao;

	// 모임게시판 모임 [총 개수]
	@Override
	public int selectTotalMeetBoardNum(int s_no) {		
		return meetBoardDao.selectTotalMeetBoardNum(s_no);
	}

	// 모임게시판 [페이징]
	@Override
	public List<MeetDto> selectPagingMeetBoardList(Map pageMap) {
		return meetBoardDao.selectPagingMeetBoardList(pageMap);
	}
	
	// 모임게시판 '검색' 모임 [총 개수]
	@Override
	public int selectSearchMeetBoardNum(Map searchNumMap) {
		return meetBoardDao.selectSearchMeetBoardNum(searchNumMap);
	}
	
	// 모임게시판 '검색' [페이징]
	@Override
	public List<MeetDto> selectPagingSearchMeetList(Map searchPageMap) {
		return meetBoardDao.selectPagingSearchMeetList(searchPageMap);
	}

	// 모임게시판 모임 [상세보기]
	@Transactional
	@Override
	public MeetDto selectMeetBoardDetail(int meet_no, int isVisitPage) {
		if(isVisitPage == 0) {
			meetBoardDao.updateMeetCnt(meet_no);
		}
		MeetDto dto = meetBoardDao.selectMeetBoardDetail(meet_no);
		
		return dto;
	}
	
	// 리스트로 '작성자 정보' [가져오기]
	@Override
	public Map<Integer, MemberDto> getMemberMap(List<MeetDto> list) {
		return memberDao.selectMemberByMeetList(list);
	}
	
	
	// 모임게시판 모임 [생성]
	@Override
	public int insert(MeetDto dto) {
		return meetBoardDao.insertMeetBoard(dto);
	}

	// 모임게시판 모임 '1개' [가져오기]
	@Override
	public MeetDto selectOneMeetBoard(int meet_no) {
		return meetBoardDao.selectOneMeetBoard(meet_no);
	}
	
	// 모임게시판 모임 [수정]
	@Override
	public int update(MeetDto dto) {
		return meetBoardDao.updateMeetBoard(dto);
	}
	
	// 모임게시판 모임 [삭제]
	@Override
	public int delete(int meet_no) {
		return meetBoardDao.deleteMeetBoard(meet_no);
	}

	@Override
	public List<MeetDto> selectMeetDBForCalendar(int s_no) {
		return meetBoardDao.selectMeetDBForCalendar(s_no);
	}

}
