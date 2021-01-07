package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.studdype.test.model.dao.board.free.FreeBoardDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.member.MemberDto;

@Service
public class FreeBizImpl implements FreeBiz {
	@Autowired
	private FreeBoardDao freeBoardDao; 
	@Autowired
	private MemberDao memberDao;
	
	//자유게시판 총 게시글 갯수
	@Override
	public int selectTotalBoardNum(int s_no) {		
		return freeBoardDao.selectTotalBoardNum(s_no);
	}

	//페이징 (15개 게시글만 가져오기)
	@Override
	public List<BoardDto> selectPagingBoardList(Map pageMap) {
		return freeBoardDao.selectPagingBoardList(pageMap);
	}

	//리스트로 작성자 이름 가져오기
	@Override
	public Map<Integer, String> getWriterNameByList(List<BoardDto> list) {
		return memberDao.selectWriterByFreeList(list);
	}

	//자유게시판 글 작성
	@Override
	public int writeBoard(BoardDto board) {
		return freeBoardDao.insertBoard(board);
	}

	//자유게시판 글 가져오기(오류 무시하고 진행 가능)
	@Transactional
	@Override
	public BoardDto selectOne(int b_no, int isVisitPage) {		
		if(isVisitPage == 0) {
			freeBoardDao.updateCnt(b_no);
		}
		BoardDto dto = freeBoardDao.selectOne(b_no);
		return dto;
	}

	//자유게시판 리스트 member리스트 함수
	@Override
	public Map<Integer, MemberDto> getMemberMap(List<BoardDto> list) {
		return memberDao.selectMemberByFreeList(list);
	}

	//자유게시판 글 삭제
	@Override
	public int deleteBoard(int b_no) {
		return freeBoardDao.deleteBoard(b_no);
	}

	//자유게시판 글 수정
	@Override
	public int updateBoard(BoardDto board) {
		return freeBoardDao.updateBoard(board);
	}

}
