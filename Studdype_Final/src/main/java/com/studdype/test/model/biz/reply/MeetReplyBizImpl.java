package com.studdype.test.model.biz.reply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.studdype.test.model.dao.board.meet.MeetReplyDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.board.ReplyDto;
import com.studdype.test.model.dto.member.MemberDto;

@Service
public class MeetReplyBizImpl implements MeetReplyBiz{
	
	@Autowired
	private MeetReplyDao meetReplyDao;
	
	@Autowired
	private MemberDao memberDao;
	
	// 모임 번호로 댓글 [리스트] 받기
	@Override
	public List<ReplyDto> selectMeetReplyList(int b_no) {
		return meetReplyDao.selectMeetReplyList(b_no);
	}
	
	// 모임 댓글 [삭제]
	@Transactional
	@Override
	public int deleteMeetReply(int r_no) {
		int res = 0;
		
		// 1. 댓글 가져오기
		ReplyDto reply = meetReplyDao.selectOneMeetReply(r_no);
		
		// 2. 넘어온 댓글이 부모 댓글이면 값 수정 / 아니면 삭제
		if( reply.getR_class() == 0 ) {
			
			// 2-1. 그룹번호로 남은 게시글 개수 확인을 위해서 리스트를 찾아옴
			List<ReplyDto> groupReplyList = meetReplyDao.selectGroupMeetReplyList(reply.getR_groupno());
			
			// 2-2. 사이즈가 1이면 삭제
			if( groupReplyList.size() == 1 ) {
				res = meetReplyDao.deleteMeetReply(r_no);
			// 2-3. 사이즈가 1이 아니면( == 답글이 있으면 )삭제
			} else {
				res = meetReplyDao.deleteMeetParentReply(r_no);
			}
		}else {
			res = meetReplyDao.deleteMeetReply(r_no);
			
			// 3. 글 삭제에 성공했다면
			if(res > 0) {
				
				// 3-1. 삭제 후 부모 댓글이 삭제 된 댓글인지 알기 위해서 댓글 그룹번호로 그룹번호 댓글 리스트 뽑아옴
				List<ReplyDto> groupReplyList = meetReplyDao.selectGroupMeetReplyList(reply.getR_groupno());
				
				// 4. 삭제 후 댓글 그룹 남은 댓글이 1개면
				if( groupReplyList.size() == 1 ) {
					
					// 4-1. 댓글 클래스 컬럼 가져옴 
					int r_class = groupReplyList.get(0).getR_class();
					
					// 4-2. [댓글 클래스가 -1이면: 삭제된 컬럼] 댓글 삭제
					if( r_class == -1 ) {
						res = meetReplyDao.deleteMeetReply(groupReplyList.get(0).getR_no());
					}
				}
			}
		}
		
		return res;
	}
	
	// 모임 댓글 '리스트'로 [member 정보] 받기
	@Override
	public Map<Integer, MemberDto> getMemberByList(List<ReplyDto> replyList) {
		return memberDao.selectMemberByMeetReply(replyList);
	}
	
	// 모임 댓글 [작성]
	@Override
	public int writeMeetReply(ReplyDto dto) {
		return meetReplyDao.insertMeetReply(dto);
	}
	
	// 모임 댓글 [수정]
	@Override
	public int updateMeetReply(ReplyDto dto) {
		return meetReplyDao.updateMeetReply(dto);
	}
	
	// 모임 댓글 '답글' [작성]
	@Override
	public int writeMeetRecomment(ReplyDto dto) {
		return meetReplyDao.insertMeetRecomment(dto);
	}

}
