package com.studdype.test.model.biz.reply;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.ReplyDto;
import com.studdype.test.model.dto.member.MemberDto;

public interface BookReplyBiz {
	public List<ReplyDto> selectBookReplyList(int b_no); // 도서게시판에서 해당 게시물에 대한 댓글 리스트 불러오기
	public Map<Integer, MemberDto> getMemberByList(List<ReplyDto> replyList); // 댓글 리스트에 대한 작성자 정보 불러오기
	public int deleteReply(int r_no); // 댓글 삭제
	public int writeReply(ReplyDto reply);	// 댓글 작성
	public int updateReply(ReplyDto reply);	// 댓글 수정
	public int writeRecomment(ReplyDto reply);	// 답글 작성
}
