package com.studdype.test.model.biz.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;

import com.studdype.test.model.dao.board.meet.MeetBoardDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.board.MeetDto;
import com.studdype.test.model.dto.board.VoteDto;
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
	public int updateMeetBoard(MeetDto dto) {
		return meetBoardDao.updateMeetBoard(dto);
	}
	
	// 모임게시판 모임 [삭제]
	@Override
	public int delete(int meet_no) {
		return meetBoardDao.deleteMeetBoard(meet_no);
	}
	
	// 
	@Override
	public List<MeetDto> selectMeetDBForCalendar(int s_no) {
		return meetBoardDao.selectMeetDBForCalendar(s_no);
	}
	
	// 모임게시판_투표 '총' [투표 수]
	@Override
	public int selectVoteResultCnt_Total(int meet_no) {
		return meetBoardDao.selectVoteResultCnt_Total(meet_no);
	}
	
	// 모임게시판_투표 '참가' [투표 수]
	@Override
	public int selectVoteResultCnt_Y(int meet_no) {
		return meetBoardDao.selectVoteResultCnt_Y(meet_no);
	}
	
	// 모임게시판_투표 '불참가' [투표 수]
	@Override
	public int selectVoteResultCnt_N(int meet_no) {
		return meetBoardDao.selectVoteResultCnt_N(meet_no);
	}

	// 모임게시판_투표 [투표하기]
	@Override
	public int insertMeetVote(VoteDto dto) {
		return meetBoardDao.insertMeetVote(dto);
	}
	
	// 모임게시판_투표 [중복체크]
	@Override
	public int selectVoteMemberCnt(VoteDto dto) {
		return meetBoardDao.selectVoteMemberCnt(dto);
	}

	// 모임게시판_투표 '모임번호'로 [참석] 멤버 리스트
	@Override
	public List<VoteDto> selectAttendMember(int meet_no) {
		return meetBoardDao.selectAttendMember(meet_no);
	}
	
	// 모임게시판_투표 '모임번호'로 [불참석] 멤버 리스트
	@Override
	public List<VoteDto> selectAbsentMember(int meet_no) {
		return meetBoardDao.selectAbsentMember(meet_no);
	}
	
	// 모임게시판_투표 [참석자] 리스트로 '작성자 정보' [가져오기]
	@Override
	public Map<Integer, MemberDto> getAttendMemberMap(List<VoteDto> list) {
		return memberDao.selectAttendMemberList(list);
	}

	// 모임게시판_투표 [불참석자] 리스트로 '작성자 정보' [가져오기]
	@Override
	public Map<Integer, MemberDto> getAbsentMemberMap(List<VoteDto> list) {
		return memberDao.selectAbsentMemberList(list);
	}
	
	// 모임리스트 스터디 번호로 가져오기 
	@Transactional
	@Override
	public List<MeetDto> selectMeetByS_no(int s_no[]) {
		return meetBoardDao.selectMeetByS_no(s_no);

	}
	


}
