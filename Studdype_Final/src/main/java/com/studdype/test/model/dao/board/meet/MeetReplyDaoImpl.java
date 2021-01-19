package com.studdype.test.model.dao.board.meet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.MeetDto;
import com.studdype.test.model.dto.board.ReplyDto;

@Repository
public class MeetReplyDaoImpl implements MeetReplyDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 모임 번호로 댓글 [리스트] 받기
	@Override
	public List<ReplyDto> selectMeetReplyList(int b_no) {
		List<ReplyDto> list = null;

		try {
			list = sqlSession.selectList(NAMESPACE+"selectMeetReplyList", b_no);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET_REPLY DAO selectMeetReplyList ---------- [ERROR]");
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 모임 댓글 '1개' [가져오기]
	@Override
	public ReplyDto selectOneMeetReply(int r_no) {
		ReplyDto reply = null;
		
		try {
			reply = sqlSession.selectOne(NAMESPACE+"selectOneMeetReply", r_no);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET_REPLY DAO selectOneMeetReply ---------- [ERROR]");
			e.printStackTrace();
		}
		
		return reply;
	}
	
	// 모임 댓글이 '부모댓글'이면 [r_class: -1로 변경]
	@Override
	public int deleteMeetParentReply(int r_no) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"deleteMeetParentReply", r_no);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET_REPLY DAO deleteMeetParentReply ---------- [ERROR]");
			e.printStackTrace();
		}
		
		return res;
	}
	
	// 모임 댓글 [삭제]
	@Override
	public int deleteMeetReply(int r_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"deleteMeetReply", r_no);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET_REPLY DAO deleteMeetReply ---------- [ERROR]");
			e.printStackTrace();
		}
		return res;
	}
	
	// 모임 댓글 '그룹번호'로 [리스트] 뽑기
	@Override
	public List<ReplyDto> selectGroupMeetReplyList(int r_groupno) {
		List<ReplyDto> resList = null;
		
		try {
			resList = sqlSession.selectList(NAMESPACE+"selectGroupMeetReplyList", r_groupno);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET_REPLY DAO selectGroupMeetReplyList ---------- [ERROR]");
			e.printStackTrace();
		}
		
		return resList;
	}
	
	// 모임 댓글 [작성]
	@Override
	public int insertMeetReply(ReplyDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertMeetReply", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET_REPLY DAO insertMeetReply ---------- [ERROR]");
			e.printStackTrace();
		}
		
		return res;
	}
	
	// 모임 댓글 [수정]
	@Override
	public int updateMeetReply(ReplyDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"updateMeetReply", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET_REPLY DAO updateMeetReply ---------- [ERROR]");
			e.printStackTrace();
		}
		return res;
	}
	
	// 모임 댓글 '답글' [작성]
	@Override
	public int insertMeetRecomment(ReplyDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertMeetRecomment", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET_REPLY DAO insertMeetRecomment ---------- [ERROR]");
			e.printStackTrace();
		}
		
		return res;
	}
	
	// 모임게시판 '모임리스트'로 '댓글개수' [가져오기]
	@Override
	public Map<Integer, Integer> selectMeetReplyCnt(List<MeetDto> list) {
		Map<Integer, Integer> cntList = new HashMap<Integer, Integer>();
		
		for(int i = 0; i < list.size(); i++ ) {
			try {
				int cnt = sqlSession.selectOne(NAMESPACE+"selectMeetReplyCnt", list);
			} catch (Exception e) {
				System.out.println("[ERROR] ---------- MEET_REPLY DAO selectMeetReplyCnt ---------- [ERROR]");
				e.printStackTrace();
			}
		}
		return cntList;
	}

}
