package com.studdype.test.model.dao.board.free;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.ReplyDto;

@Repository
public class FreeReplyDaoImpl implements FreeReplyDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ReplyDto> selectReplyList(int b_no) {
		List<ReplyDto> list = null;
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectReplyList", b_no);
		} catch (Exception e) {
			System.out.println("[ERROR]: selectReplyList");
			e.printStackTrace();
		}
		
		return list;
	}

	//댓글 가져오기
	@Override
	public ReplyDto selectOne(int r_no) {
		ReplyDto reply = null;
		
		try {
			reply = sqlSession.selectOne(NAMESPACE+"selectOne", r_no);
		} catch (Exception e) {
			System.out.println("[ERROR]: selectOne");
			e.printStackTrace();
		}
		return reply;
	}

	//댓글이 부모댓글이면 r_class -> -1로변경   UPDATE
	@Override
	public int deleteParentReply(int r_no) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"deleteParentReply", r_no);
		} catch (Exception e) {
			System.out.println("[ERROR]: deleteParentReply");
			e.printStackTrace();
		}
		return res;
	}

	//댓글 삭제
	@Override
	public int deleteReply(int r_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"deleteReply", r_no);
		} catch (Exception e) {
			System.out.println("[ERROR]: deleteReply");
			e.printStackTrace();
		}
		return res;
	}

	//그룹번호로 댓글리스트 뽑기
	@Override
	public List<ReplyDto> selectGroupReplyList(int r_groupno) {
		List<ReplyDto> resList = null;
		
		try {
			resList = sqlSession.selectList(NAMESPACE+"selectGroupReplyList", r_groupno);
		} catch (Exception e) {
			System.out.println("[ERROR]: selectGroupReplyList");
			e.printStackTrace();
		}
		return resList                ;
	}

}
