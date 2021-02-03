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

import com.studdype.test.model.biz.board.MeetBiz;
import com.studdype.test.model.biz.member.MemberBiz;
import com.studdype.test.model.biz.reply.BookReplyBiz;
import com.studdype.test.model.biz.reply.FreeReplyBiz;
import com.studdype.test.model.biz.reply.MeetReplyBiz;
import com.studdype.test.model.biz.reply.NoticeReplyBiz;
import com.studdype.test.model.dto.board.MeetDto;
import com.studdype.test.model.dto.board.ReplyDto;
import com.studdype.test.model.dto.member.MemberDto;

@Controller
public class ReplyController {
private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);

	@Autowired
	private FreeReplyBiz freeReplyBiz;
	@Autowired
	private MeetReplyBiz meetReplyBiz;
	@Autowired
	private MemberBiz memberBiz;
	@Autowired
	private MeetBiz meetBiz;
	@Autowired
	private NoticeReplyBiz noticeReplyBiz;
	@Autowired
	private BookReplyBiz bookReplyBiz;
		
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
	//공지게시판 리플리스트 반환 메소드
		@RequestMapping(value="/noticeReplyList.do", method=RequestMethod.POST)
		public @ResponseBody Map noticeReplyList(@RequestBody ReplyDto dto) {
			logger.info("[NoticeReplyList]");
			Map replyMap = new HashMap(); // 리플리스트dto 및 작성자이름 담을 MAP (반환 할거임)
			List<ReplyDto> replyList = null;  // 댓글 LIST
			Map<Integer,MemberDto> replyMember = new HashMap<Integer, MemberDto>(); //리플리스트 작성자dto 담을 맵
			
			replyList = noticeReplyBiz.selectReplyList(dto.getB_no());
			replyMember = noticeReplyBiz.getMemberByList(replyList);
			
		
			replyMap.put("replyList", replyList);
			replyMap.put("replyMember", replyMember);
			

			
			return replyMap;
		}
			
		//공지게시판 댓글 삭제 메소드
		@RequestMapping(value="/noticeReplyDelete.do", method=RequestMethod.POST)
		public @ResponseBody int noticeReplyDelete(@RequestBody ReplyDto dto) {
			logger.info("[NoticeReplyDelete]");
			
			int res = noticeReplyBiz.deleteReply(dto.getR_no());
			
			return res;
		}
			
		//공지게시판 댓글 쓰기 메소드
		@RequestMapping(value="/noticeReplyWrite.do", method=RequestMethod.POST)
		public @ResponseBody int noticeReplyWrite(@RequestBody ReplyDto dto) {
			logger.info("[NoticeReplyWrite]");
			
			int res = noticeReplyBiz.writeReply(dto);
			
			return res;
		}
		
		//공지게시판 댓글 수정 메소드
		@RequestMapping(value="/noticeReplyUpdate.do", method=RequestMethod.POST)
		public @ResponseBody int noticeReplyUpdate(@RequestBody ReplyDto dto) {
			logger.info("[NoticeReplyUpdate]");
			
			int res = noticeReplyBiz.updateReply(dto);
			
			return res;
		}
			
		//공지게시판 댓글 답글 작성 메소드
		@RequestMapping(value="/noticeRecommentWrite.do", method=RequestMethod.POST)
		public @ResponseBody int noticeRecommentWrite(@RequestBody ReplyDto dto) {
			logger.info("[NoticeRecommentWrite]");
			
			int res = noticeReplyBiz.writeRecomment(dto);
			
			return res;
		}
	
	// --------------------------------------------------------------------------------------------------------------------------------------//
	
	// [모임게시판] 댓글 '리스트' [반환]
	@RequestMapping(value="/meetReplyList.do", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> meetReplyList(@RequestBody ReplyDto dto, MeetDto meetDto) {
		logger.info("[MEET REPLY LIST]");
		List<ReplyDto> meetReplyList = null; // 댓글 리스트
		Map<Integer,MemberDto> meetReplyMember = new HashMap<Integer, MemberDto>(); // 멤버정보를 담을 맵
		Map<String, Object> meetReplyMap = new HashMap<String, Object>(); // 댓글리스트와 멤버정보를 담을 맵
		meetReplyList = meetReplyBiz.selectMeetReplyList(dto.getB_no());
		meetDto = meetBiz.selectOneMeetBoard(dto.getB_no());
		
		int meetWriter = meetDto.getMeet_writer(); // 모임 작성자 번호 가져오기
		
		System.out.println("-----------------------------------------------------------------------\n"
						  +"<<모임 댓글>> ["+dto.getB_no()+"]번째 모임의 댓글 리스트 입니다.\n"
						  +"-----------------------------------------------------------------------"); 
		meetReplyMember = meetReplyBiz.getMemberByList(meetReplyList);
		
		meetReplyMap.put("meetReplyList", meetReplyList);
		meetReplyMap.put("meetReplyMember", meetReplyMember);
		meetReplyMap.put("meetWriter", meetWriter);
		
		return meetReplyMap;
	}
	
	// [모임게시판] 댓글 [삭제]
	@RequestMapping(value="/meetReplyDelete.do", method=RequestMethod.POST)
	public @ResponseBody int meetReplyDelete(@RequestBody ReplyDto dto) {
		logger.info("[MEET REPLY DELETE]");
		
		int res = meetReplyBiz.deleteMeetReply(dto.getR_no());
		
		System.out.println("-----------------------------------------------------------------------\n"
						  +"<<모임 댓글>> ["+dto.getR_no()+"]번째 모임댓글이 삭제 되었습니다.\n"
						  +"-----------------------------------------------------------------------"); 
		
		return res;
	}
		
	// [모임게시판] 댓글 [작성]
	@RequestMapping(value="/meetReplyWrite.do", method=RequestMethod.POST)
	public @ResponseBody int meetReplyWrite(@RequestBody ReplyDto dto) {
		logger.info("[MEET REPLY WRITE]");
		
		int res = meetReplyBiz.writeMeetReply(dto);
		
		System.out.println("-----------------------------------------------------------------------\n"
						  +"<<모임 댓글>> ["+dto.getB_no()+"]번째 모임에 댓글이 추가 되었습니다.\n"
						  +"-----------------------------------------------------------------------"); 
		
		return res;
	}	
	
	// [모임게시판] 댓글 [수정]
	@RequestMapping(value="/meetReplyUpdate.do", method=RequestMethod.POST)
	public @ResponseBody int meetReplyUpdate(@RequestBody ReplyDto dto) {
		logger.info("[MEET REPLY UPDATE]");
		
		int res = meetReplyBiz.updateMeetReply(dto);
		
		System.out.println("-----------------------------------------------------------------------\n"
						  +"<<모임 댓글>> ["+dto.getR_no()+"]번째 모임에 댓글이 수정 되었습니다.\n"
						  +"-----------------------------------------------------------------------"); 
		
		return res;
	}
		
	// [모임게시판] 댓글 '답글' [작성]
	@RequestMapping(value="/meetRecommentWrite.do", method=RequestMethod.POST)
	public @ResponseBody int meetRecommentWrite(@RequestBody ReplyDto dto) {
		logger.info("[MEET RECOMMENT WRITE]");
		
		int res = meetReplyBiz.writeMeetRecomment(dto);
		
		System.out.println("-----------------------------------------------------------------------\n"
						  +"<<모임 댓글>> ["+dto.getR_no()+"]번째 모임댓글이 추가 되었습니다.\n"
						  +"-----------------------------------------------------------------------"); 
		
		return res;
	}
	
	// --------------------------------------------------------------------------------------------------------------------------------------//
	// [도서 게시판 댓글]
	
	// 도서게시판 리플리스트 반환 메소드
	@RequestMapping(value="/bookReplyList.do", method=RequestMethod.POST)
	public @ResponseBody Map bookReplyList(@RequestBody ReplyDto dto) {
		logger.info("[BookReplyList]");
		Map replyMap = new HashMap(); // 리플리스트 dto 및 작성자이름 담을 MAP (반환 할거임)
		List<ReplyDto> replyList = null;  // 댓글 LIST
		Map<Integer,MemberDto> replyMember = new HashMap<Integer, MemberDto>(); //리플리스트 작성자 dto 담을 맵
		
		replyList = bookReplyBiz.selectBookReplyList(dto.getB_no());
		replyMember = bookReplyBiz.getMemberByList(replyList);
		
		replyMap.put("replyList", replyList);
		replyMap.put("replyMember", replyMember);
		
		return replyMap;
	}
		
	// 도서게시판 댓글 삭제 메소드
	@RequestMapping(value="/bookReplyDelete.do", method=RequestMethod.POST)
	public @ResponseBody int bookReplyDelete(@RequestBody ReplyDto dto) {
		logger.info("[BookReplyDelete]");
		
		int res = bookReplyBiz.deleteReply(dto.getR_no());
		
		return res;
	}
		
	//도서게시판 댓글 쓰기 메소드
	@RequestMapping(value="/bookReplyWrite.do", method=RequestMethod.POST)
	public @ResponseBody int bookReplyWrite(@RequestBody ReplyDto dto) {
		logger.info("[BookReplyWrite]");
		
		int res = bookReplyBiz.writeReply(dto);
		
		return res;
	}
	
	//자유게시판 댓글 수정 메소드
	@RequestMapping(value="/bookReplyUpdate.do", method=RequestMethod.POST)
	public @ResponseBody int bookReplyUpdate(@RequestBody ReplyDto dto) {
		logger.info("[BookReplyUpdate]");
		
		int res = bookReplyBiz.updateReply(dto);
		
		return res;
	}
		
	//도서게시판 댓글 답글 작성 메소드
	@RequestMapping(value="/bookRecommentWrite.do", method=RequestMethod.POST)
	public @ResponseBody int bookRecommentWrite(@RequestBody ReplyDto dto) {
		logger.info("[BookRecommentWrite]");
		
		int res = bookReplyBiz.writeRecomment(dto);
		
		return res;
	}
	
	// --------------------------------------------------------------------------------------------------------------------------------------//
	// [학습 자료실 댓글]
	
	// 학습 자료실 리플리스트 반환 메소드
//	@RequestMapping(value="/dataReplyList.do", method=RequestMethod.POST)
//	public @ResponseBody Map dataReplyList(@RequestBody ReplyDto dto) {
//		logger.info("[dataReplyList]");
//		Map replyMap = new HashMap(); // 리플리스트 dto 및 작성자이름 담을 MAP (반환 할거임)
//		List<ReplyDto> replyList = null;  // 댓글 LIST
//		Map<Integer,MemberDto> replyMember = new HashMap<Integer, MemberDto>(); //리플리스트 작성자 dto 담을 맵
//		
//		replyList = bookReplyBiz.selectBookReplyList(dto.getB_no());
//		replyMember = bookReplyBiz.getMemberByList(replyList);
//		
//		replyMap.put("replyList", replyList);
//		replyMap.put("replyMember", replyMember);
//		
//		return replyMap;
//	}
//			
//	// 도서게시판 댓글 삭제 메소드
//	@RequestMapping(value="/bookReplyDelete.do", method=RequestMethod.POST)
//	public @ResponseBody int bookReplyDelete(@RequestBody ReplyDto dto) {
//		logger.info("[BookReplyDelete]");
//		
//		int res = bookReplyBiz.deleteReply(dto.getR_no());
//		
//		return res;
//	}
//			
//	//도서게시판 댓글 쓰기 메소드
//	@RequestMapping(value="/bookReplyWrite.do", method=RequestMethod.POST)
//	public @ResponseBody int bookReplyWrite(@RequestBody ReplyDto dto) {
//		logger.info("[BookReplyWrite]");
//		
//		int res = bookReplyBiz.writeReply(dto);
//		
//		return res;
//	}
//		
//	//자유게시판 댓글 수정 메소드
//	@RequestMapping(value="/bookReplyUpdate.do", method=RequestMethod.POST)
//	public @ResponseBody int bookReplyUpdate(@RequestBody ReplyDto dto) {
//		logger.info("[BookReplyUpdate]");
//		
//		int res = bookReplyBiz.updateReply(dto);
//		
//		return res;
//	}
//			
//	//도서게시판 댓글 답글 작성 메소드
//	@RequestMapping(value="/bookRecommentWrite.do", method=RequestMethod.POST)
//	public @ResponseBody int bookRecommentWrite(@RequestBody ReplyDto dto) {
//		logger.info("[BookRecommentWrite]");
//		
//		int res = bookReplyBiz.writeRecomment(dto);
//		
//		return res;
//	}
	
}
