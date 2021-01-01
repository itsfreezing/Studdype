package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studdype.test.model.dao.board.free.FreeBoardDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.board.BoardDto;

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

}
