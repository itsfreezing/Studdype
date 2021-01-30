package com.studdype.test.model.dao.board.book;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.ReplyDto;
import com.studdype.test.model.dto.member.MemberDto;

@Repository
public class BookReplyDaoImpl implements BookReplyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ReplyDto> selectBookReplyList(int b_no) {
		List<ReplyDto> replyList = new ArrayList<ReplyDto>();
		
		try {
			replyList = sqlSession.selectList(NAMESPACE+"selectBookReplyList", b_no);
		} catch (Exception e) {
			System.out.println("[ERROR] : selectBookReplyList");
			e.printStackTrace();
		}
		
		return replyList;
	}

	@Override
	public Map<Integer, MemberDto> getMemberByList(List<ReplyDto> replyList) {
		return null;
	}

	@Override
	public ReplyDto selectOne(int r_no) {
		ReplyDto reply = null;
		try {
			reply = sqlSession.selectOne(NAMESPACE+"selectOne", r_no);
		} catch (Exception e) {
			System.out.println("[ERROR] : [도서 댓글] selectOne");
			e.printStackTrace();
		}
		
		return reply;
	}

	@Override
	public List<ReplyDto> selectGroupReplyList(int r_groupNo) {
		List<ReplyDto> replyList = null;
		
		try {
			replyList = sqlSession.selectList(NAMESPACE+"selectGroupReplyList", r_groupNo);
		} catch (Exception e) {
			System.out.println("[ERROR] : [도서 댓글] selectGroupReplyList");
			e.printStackTrace();
		}
		
		return replyList;
	}

	@Override
	public int deleteReply(int r_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"deleteReply", r_no);
		} catch (Exception e) {
			System.out.println("[ERROR] : [도서 댓글] deleteReply");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int deleteParentReply(int r_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"deleteParentReply", r_no);
		} catch (Exception e) {
			System.out.println("[ERROR] : [도서 댓글] deleteParentReply");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int insertReply(ReplyDto reply) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertReply", reply);
		} catch (Exception e) {
			System.out.println("[ERROR] : [도서 댓글] writeReply");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int updateReply(ReplyDto reply) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"updateReply", reply);
		} catch (Exception e) {
			System.out.println("[ERROR] : [도서 댓글] updateReply");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int insertRecomment(ReplyDto reply) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertRecomment", reply);
		} catch (Exception e) {
			System.out.println("[ERROR] : [도서 댓글] insertRecomment");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int deleteBoardReply(int b_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"deleteBoardReply", b_no);
		} catch (Exception e) {
			System.out.println("[ERROR] : [도서 댓글] deleteBoardReply");
			e.printStackTrace();
		}
		
		return res;
	}

}
