package com.studdype.test.model.biz.reply;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.ReplyDto;
import com.studdype.test.model.dto.member.MemberDto;

public interface photoReplyBiz {

	public List<ReplyDto> galleryReplyList(int b_no); //reply list
	int deleteGalleryReply(int r_no); //reply delete
	int insertGalleryReply(ReplyDto dto); //write reply
	int updateGalleryReply(ReplyDto dto); //update reply
	int insertGalleryRecomment(ReplyDto dto); // reply comment
	Map<Integer, MemberDto> getMemberByList(List<ReplyDto> replyList); //리플 리스트로 member정보 받아오기

}
