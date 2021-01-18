package com.studdype.test.model.dao.board.meet;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.MeetDto;
import com.studdype.test.model.dto.board.ReplyDto;

public interface MeetReplyDao {
	
	// 모임 게시판 댓글 
	String NAMESPACE="meetreply.";
	
	List<ReplyDto> selectMeetReplyList(int b_no); 				  // 모임 번호로 댓글 [리스트] 받기
	ReplyDto selectOneMeetReply(int r_no);								  // 모임 댓글 '1개' [가져오기]
	int deleteMeetParentReply(int r_no);						  // 모임 댓글이 '부모댓글'이면 [r_class: -1로 번경]
	int deleteMeetReply(int r_no);				  				  // 모임 댓글 [삭제]
	List<ReplyDto> selectGroupMeetReplyList(int r_groupno);		  // 모임 댓글 '그룹번호'로 [리스트] 뽑기
	int insertMeetReply(ReplyDto dto);							  // 모임 댓글 [작성]
	int updateMeetReply(ReplyDto dto);							  // 모임 댓글 [수정]
	int insertMeetRecomment(ReplyDto dto);						  // 모임 댓글 '답글' [작성]
	Map<Integer, Integer> selectMeetReplyCnt(List<MeetDto> list); // 모임게시판 '모임리스트'로 '댓글 개수' [가져오기]
}
