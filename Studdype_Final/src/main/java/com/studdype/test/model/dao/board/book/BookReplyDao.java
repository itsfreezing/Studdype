package com.studdype.test.model.dao.board.book;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.ReplyDto;
import com.studdype.test.model.dto.member.MemberDto;

public interface BookReplyDao {
	String NAMESPACE = "bookReply.";
	
	public List<ReplyDto> selectBookReplyList(int b_no);
	public ReplyDto selectOne(int r_no); // 댓글 번호로 댓글 정보 가져오기
	public List<ReplyDto> selectGroupReplyList(int r_groupNo); // 그룹 번호로 해당 그룹 댓글 리스트 가져오기
	public int deleteReply(int r_no); // 댓글 삭제
	public int deleteParentReply(int r_no); // 부모 댓글만 삭제
	public int insertReply(ReplyDto reply);	// 댓글 작성
	public int updateReply(ReplyDto reply);	// 댓글 수정
	public int insertRecomment(ReplyDto reply);	// 답글 작성
	public int deleteBoardReply(int b_no);	// 게시물 삭제 시 댓글 전체 삭제
}
