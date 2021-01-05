package com.studdype.test.model.biz.reply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studdype.test.model.dto.board.ReplyDto;
import com.studdype.test.model.dto.member.MemberDto;


public interface FreeReplyBiz {

	
	List<ReplyDto> selectReplyList(int b_no); // 글번호로 리플리스트받아오기
	int deleteReply(int r_no); //댓글 삭제
	Map<Integer, MemberDto> getMemberByList(List<ReplyDto> replyList); //리플 리스트로 member정보 받아오기
	int writeReply(ReplyDto dto); //댓글 쓰기

}
