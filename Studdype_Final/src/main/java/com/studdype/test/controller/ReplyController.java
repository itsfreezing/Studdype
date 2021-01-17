package com.studdype.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.studdype.test.model.biz.reply.FreeReplyBiz;
import com.studdype.test.model.biz.reply.MeetReplyBiz;
import com.studdype.test.model.dto.board.ReplyDto;
import com.studdype.test.model.dto.member.MemberDto;

@Controller
public class ReplyController {
private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);

	@Autowired
	private FreeReplyBiz freeReplyBiz;
	
	@Autowired
	private MeetReplyBiz meetReplyBiz;
		
	//자유게시판 리플리스트 반환 메소드
	@RequestMapping(value="/freeReplyList.do", method=RequestMethod.POST)
	public @ResponseBody Map freeReplyList(@RequestBody ReplyDto dto) {
		logger.info("[FreeReplyList]");
		Map replyMap = new HashMap(); // 리플리스트dto 및 작성자이름 담을 MAP (반환 할거임)
		List<ReplyDto> replyList = null;  // 댓글 LIST
		Map<Integer,MemberDto> replyMember = new HashMap<Integer, MemberDto>(); //리플리스트 작성자dto 담을 맵
		
		replyList = freeReplyBiz.selectReplyList(dto.getB_no());
		replyMember = freeReplyBiz.getMemberByList(replyList);
		
	
		replyMap.put("replyList", replyList);
		replyMap.put("replyMember", replyMember);
		

		
		return replyMap;
	}
	
	//자유게시판 댓글 삭제 메소드
	@RequestMapping(value="/freeReplyDelete.do", method=RequestMethod.POST)
	public @ResponseBody int freeReplyDelete(@RequestBody ReplyDto dto) {
		logger.info("[FreeReplyDelete]");
		
		int res = freeReplyBiz.deleteReply(dto.getR_no());
		
		return res;
	}
		
	//자유게시판 댓글 쓰기 메소드
	@RequestMapping(value="/freeReplyWrite.do", method=RequestMethod.POST)
	public @ResponseBody int freeReplyWrite(@RequestBody ReplyDto dto) {
		logger.info("[FreeReplyWrite]");
		
		int res = freeReplyBiz.writeReply(dto);
		
		return res;
	}
	
	//자유게시판 댓글 수정 메소드
	@RequestMapping(value="/freeReplyUpdate.do", method=RequestMethod.POST)
	public @ResponseBody int freeReplyUpdate(@RequestBody ReplyDto dto) {
		logger.info("[FreeReplyUpdate]");
		
		int res = freeReplyBiz.updateReply(dto);
		
		return res;
	}
		
	//자유게시판 댓글 답글 작성 메소드
	@RequestMapping(value="/freeRecommentWrite.do", method=RequestMethod.POST)
	public @ResponseBody int freeRecommentWrite(@RequestBody ReplyDto dto) {
		logger.info("[FreeRecommentWrite]");
		
		int res = freeReplyBiz.writeRecomment(dto);
		
		return res;
	}
	
	// --------------------------------------------------------------------------------------------------------------------------------------//
	
	// [모임게시판] 댓글 '리스트' [반환]
	@RequestMapping(value="/meetReplyList.do", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> meetReplyList(@RequestBody ReplyDto dto) {
		logger.info("[Meet Reply List]");
		List<ReplyDto> meetReplyList = null; // 댓글 리스트
		Map<Integer,MemberDto> meetReplyMember = new HashMap<Integer, MemberDto>(); // 멤버정보를 담을 맵
		Map<String, Object> meetReplyMap = new HashMap<String, Object>(); // 댓글리스트와 멤버정보를 담을 맵
		
		meetReplyList = meetReplyBiz.selectMeetReplyList(dto.getB_no());
		System.out.println("-----------------------------------------------------------------------\n"
						  +"<<모임 댓글>> ["+dto.getB_no()+"]번째 모임 입니다.\n"
						  +"-----------------------------------------------------------------------"); 
		meetReplyMember = meetReplyBiz.getMemberByList(meetReplyList);
		
		meetReplyMap.put("meetReplyList", meetReplyList);
		meetReplyMap.put("meetReplyMember", meetReplyMember);
		
		return meetReplyMap;
	}
	
	// [모임게시판] 댓글 [삭제]
	@RequestMapping(value="/meetReplyDelete.do", method=RequestMethod.POST)
	public @ResponseBody int meetReplyDelete(@RequestBody ReplyDto dto) {
		logger.info("[Meet Reply Delete]");
		System.out.println("qweqweqweqwe");
		int res = meetReplyBiz.deleteMeetReply(dto.getR_no());
		System.out.println("-----------------------------------------------------------------------\n"
						  +"<<모임 댓글>> ["+dto.getR_no()+"]번째 모임댓글이 삭제 되었습니다.\n"
						  +"-----------------------------------------------------------------------"); 
		
		return res;
	}
		
	// [모임게시판] 댓글 [작성]
	@RequestMapping(value="/meetReplyWrite.do", method=RequestMethod.POST)
	public @ResponseBody int meetReplyWrite(@RequestBody ReplyDto dto) {
		logger.info("[Meet Reply Write]");
		
		int res = meetReplyBiz.writeMeetReply(dto);
		
		return res;
	}	
	
	// [모임게시판] 댓글 [수정]
	@RequestMapping(value="/meetReplyUpdate.do", method=RequestMethod.POST)
	public @ResponseBody int meetReplyUpdate(@RequestBody ReplyDto dto) {
		logger.info("[Meet Reply Update]");
		
		int res = meetReplyBiz.updateMeetReply(dto);
		
		return res;
	}
		
	// [모임게시판] 댓글 '답글' [작성]
	@RequestMapping(value="/meetRecommentWrite.do", method=RequestMethod.POST)
	public @ResponseBody int meetRecommentWrite(@RequestBody ReplyDto dto) {
		logger.info("[Meet Recomment Write]");
		
		int res = meetReplyBiz.writeMeetRecomment(dto);
		
		return res;
	}
	
}
