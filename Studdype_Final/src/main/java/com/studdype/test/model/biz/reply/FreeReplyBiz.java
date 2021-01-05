package com.studdype.test.model.biz.reply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studdype.test.model.dto.board.ReplyDto;


public interface FreeReplyBiz {

	
	List<ReplyDto> selectReplyList(int b_no); // 글번호로 리플리스트받아오기
	Map<Integer, String> getWriterNameByList(List<ReplyDto> replyList); //리플리스트로 작성자이름 받아오기
	int deleteReply(int r_no); //댓글 삭제

}
