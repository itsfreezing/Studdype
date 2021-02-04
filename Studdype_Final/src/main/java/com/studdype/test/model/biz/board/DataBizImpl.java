package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.studdype.test.model.dao.board.data.DataBoardDao;
import com.studdype.test.model.dao.board.data.DataReplyDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.member.MemberDto;

@Service
public class DataBizImpl implements DataBiz {

	@Autowired
	private DataBoardDao dataDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private DataReplyDao dataReplyDao;
	
	@Override
	public int selectTotalBoardNum(int s_no) {
		return dataDao.selectTotalBoardNum(s_no);
	}
	
	@Override
	public List<BoardDto> selectPagingBoardList(Map pageMap) {
		return dataDao.selectPagingBoardList(pageMap);
	}

	@Override
	public Map<Integer, MemberDto> getMemberMap(List<BoardDto> dataList) {
		return memberDao.selectWriteByDataList(dataList);
	}

	@Override
	public Map<Integer, Integer> getReplyCnt(List<BoardDto> dataList) {
		return dataReplyDao.selectReplyCnt(dataList);
	}

	// 조회수 올리고 디테일 페이지 가져오기 
	@Override
	@Transactional
	public BoardDto selectDetail(int b_no, int isVisitPage) {
		int res = 1;
		
//		if(isVistPage == 0) {
//			
//		}
		
		return null;
	}

}
