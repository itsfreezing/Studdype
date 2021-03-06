package com.studdype.test.model.dao.board.notice;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.ReplyDto;

public interface NoticeReplyDao {
	//공지사항 댓글 
	String NAMESPACE="noticereply.";

	Map<Integer, Integer> selectReplyCnt(List<BoardDto> noticeList);//게시글리스트로 댓글 갯수 가져오기
	List<ReplyDto> selectReplyList(int b_no); //댓글리스트 by 글번호
	ReplyDto selectOne(int r_no); // 댓글 가져오기 
	List<ReplyDto> selectGroupReplyList(int r_groupno); //댓글 그룹번호로 리스트 뽑기
	int deleteReply(int r_no); // 댓글 삭제
	int deleteParentReply(int r_no); //댓글이 부모댓글이면 r_class -> -1로변경
	int updateReply(ReplyDto dto); //댓글 업데이트
	int insertReply(ReplyDto dto); //댓글 쓰기
	int insertRecomment(ReplyDto dto); //댓글 답글 쓰기
}
