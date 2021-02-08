package com.studdype.test.model.biz.reply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studdype.test.model.dao.board.data.DataReplyDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.board.ReplyDto;
import com.studdype.test.model.dto.member.MemberDto;

@Service
public class DataReplyBizImpl implements DataReplyBiz {

	@Autowired
	private DataReplyDao dataReplyDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public List<ReplyDto> selectDataReplyList(int b_no) {
		return dataReplyDao.selectDataReplyList(b_no);
	}

	@Override
	public Map<Integer, MemberDto> getMemberByList(List<ReplyDto> replyList) {
		return memberDao.selectMemberByBookReply(replyList);
	}

	@Override
	public int deleteReply(int r_no) {
		int res = 0;
		// 1. 댓글 가져오기
		ReplyDto reply = dataReplyDao.selectOne(r_no);
		// 2. 가져온 댓글이 부모 댓글이면 값 수정(삭제된 댓글입니다.) / 아닐 경우 삭제
				if(reply.getR_class() == 0) { // 0 -> 부모 댓글
					// 그룹번호로 남은 게시글 수 확인하기 위해 리스트 가져오기
					List<ReplyDto> groupReplyList = dataReplyDao.selectGroupReplyList(reply.getR_groupno());
					
					// 해당 그룹의 리스트가 1개면 삭제
					if(groupReplyList.size() == 1) {
						res = dataReplyDao.deleteReply(r_no);
					}else { // 답글이 있을 시 부모 댓글 계층만 -1로 수정
						res = dataReplyDao.deleteParentReply(r_no);
					}
					
					if(res < 1 || reply == null || groupReplyList == null) {
						throw new RuntimeException("[학습자료실] 댓글 그룹 리스트 가져오기 에러");
					}
				}else {
					res = dataReplyDao.deleteReply(r_no);
					
					// 글 삭제 성공
					if(res > 0) {
						// 3. 삭제 후 댓글 그룹번호로 댓글 리스트 가져오기 (부모 댓글이 삭제된 댓글인지 알기 위해)
						List<ReplyDto> groupReplyList = dataReplyDao.selectGroupReplyList(reply.getR_groupno());
						
						// 4. 삭제 후 댓글 그룹에 남은 댓글이 1개 일때
						if(groupReplyList.size() == 1) {
							// 5. 댓글 클래스 컬럼 가져오기
							int r_class = groupReplyList.get(0).getR_class();
							
							// 6. 댓글 클래스가 -1이면 (삭제된 부모 댓글) 댓글 삭제
							// 그룹에 부모 댓글만 남고 그 댓글이 삭제되었을 때
							if(r_class == -1) {
								res = dataReplyDao.deleteReply(groupReplyList.get(0).getR_no());
							}
							
							if(res < 1 || reply == null || groupReplyList == null) {
								throw new RuntimeException("[학습자료실] 댓글 그룹 리스트 가져오기 에러");
							}
						}
					}
				}
				
				return res;
	}

	@Override
	public int writeReply(ReplyDto reply) {
		return dataReplyDao.insertReply(reply);
	}

	@Override
	public int updateReply(ReplyDto reply) {
		return dataReplyDao.updateReply(reply);
	}

	@Override
	public int writeRecomment(ReplyDto reply) {
		return dataReplyDao.insertRecomment(reply);
	}

}
