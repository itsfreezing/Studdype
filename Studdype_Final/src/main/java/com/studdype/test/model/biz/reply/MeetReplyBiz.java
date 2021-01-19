package com.studdype.test.model.biz.reply;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.MeetDto;
import com.studdype.test.model.dto.board.ReplyDto;
import com.studdype.test.model.dto.member.MemberDto;

public interface MeetReplyBiz {
	
	List<ReplyDto> selectMeetReplyList(int b_no); 						// 모임 번호로 댓글 [리스트] 받기
	int deleteMeetReply(int r_no);				  						// 모임 댓글 [삭제]
	Map<Integer, MemberDto> getMemberByList(List<ReplyDto> replyList);  // 모임 댓글 '리스트'로 [member 정보] 받기
	int writeMeetReply(ReplyDto dto);									// 모임 댓글 [작성]
	int updateMeetReply(ReplyDto dto);									// 모임 댓글 [수정]
	int writeMeetRecomment(ReplyDto dto);								// 모임 댓글 '답글' [작성]
	public Map<Integer, MemberDto> getMemberMap(List<MeetDto> list); 	// 리스트로 '작성자 정보' [가져오기]
}
