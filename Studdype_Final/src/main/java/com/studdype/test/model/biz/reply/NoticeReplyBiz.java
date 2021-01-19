package com.studdype.test.model.biz.reply;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.ReplyDto;
import com.studdype.test.model.dto.member.MemberDto;

public interface NoticeReplyBiz {

	List<ReplyDto> selectReplyList(int b_no); //글번호로 리플리스트 받아오기
	Map<Integer, MemberDto> getMemberByList(List<ReplyDto> replyList); //리플 리스트로 member정보받아오기
	int deleteReply(int r_no); //댓글삭제
	int writeReply(ReplyDto dto); //댓글 쓰기
	int updateReply(ReplyDto dto); //댓글 수정
	int writeRecomment(ReplyDto dto);//댓글 답글 쓰기

}
