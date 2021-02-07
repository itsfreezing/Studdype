package com.studdype.test.model.dao.board.photo;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.ReplyDto;

public interface PhotoReplyDao {
	//사진 게시판 댓글 
	String NAMESPACE="photoreply.";
	
	public List<ReplyDto> galleryReplyList(int b_no); //reply list
	ReplyDto replySelectOne(int r_no); //reply one
	int deleteParentReply(int r_no);
	int deleteGalleryReply(int r_no); //reply delete
	List<ReplyDto> selectGroupReplyList(int r_groupno); //by groupno list
	int insertGalleryReply(ReplyDto dto); //write reply
	int updateGalleryReply(ReplyDto dto); //update reply
	int insertGalleryRecomment(ReplyDto dto); // reply comment
	Map<Integer, Integer> selectGalleryReplyCnt(List<BoardDto> list); //reply size
}
