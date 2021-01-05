package com.studdype.test.model.dao.board.free;

import java.util.List;

import com.studdype.test.model.dto.board.ReplyDto;

public interface FreeReplyDao {
	//자유 게시판 댓글 
	String NAMESPACE="freereply.";

	List<ReplyDto> selectReplyList(int b_no); //댓글리스트 by 글번호
	ReplyDto selectOne(int r_no); // 댓글 가져오기 
	int deleteParentReply(int r_no); //댓글이 부모댓글이면 r_class -> -1로변경
	int deleteReply(int r_no); // 댓글 삭제
	List<ReplyDto> selectGroupReplyList(int r_groupno); //댓글 그룹번호로 리스트 뽑기
	int insertReply(ReplyDto dto); //댓글 쓰기
	int updateReply(ReplyDto dto); //댓글 업데이트
}
