package com.studdype.test.controller;

import java.util.ArrayList;
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
import com.studdype.test.model.dto.board.ReplyDto;

@Controller
public class ReplyController {
private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);

	@Autowired
	private FreeReplyBiz freeReplyBiz;
		
	//자유게시판 리플리스트 반환 메소드
	@RequestMapping(value="/freeReplyList.do", method=RequestMethod.POST)
	public @ResponseBody Map freeReplyList(@RequestBody ReplyDto dto) {

		logger.info("[FreeReplyList]");
		Map replyMap = new HashMap(); // 리플리스트dto 및 작성자이름 담을 MAP (반환 할거임)
		List<ReplyDto> replyList = null;  // 댓글 LIST
		Map<Integer,String> replyWriter = new HashMap<Integer,String>();
		
		replyList = freeReplyBiz.selectReplyList(dto.getB_no());
		replyWriter = freeReplyBiz.getWriterNameByList(replyList);
		
	
	
		replyMap.put("replyList", replyList);
		replyMap.put("replyWriter", replyWriter);
		
		return replyMap;
	}
	
	//자유게시판 댓글 삭제 메소드
	@RequestMapping(value="/freeReplyDelete.do", method=RequestMethod.POST)
	public @ResponseBody int freeReplyDelete(@RequestBody ReplyDto dto) {
		logger.info("[FreeReplyDelete]");
		
		int res = freeReplyBiz.deleteReply(dto.getR_no());
		
		return res;
	}
		
	
	
		
		
		
	
}
