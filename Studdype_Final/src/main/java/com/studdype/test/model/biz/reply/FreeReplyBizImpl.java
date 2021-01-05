package com.studdype.test.model.biz.reply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.studdype.test.model.dao.board.free.FreeReplyDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.board.ReplyDto;
import com.studdype.test.model.dto.member.MemberDto;

@Service
public class FreeReplyBizImpl implements FreeReplyBiz {

	@Autowired
	private FreeReplyDao freeReplyDao;

	@Autowired
	private MemberDao memberDao;

	@Override
	public List<ReplyDto> selectReplyList(int b_no) {
		return freeReplyDao.selectReplyList(b_no);
	}
	// 댓글 삭제
	@Transactional
	@Override
	public int deleteReply(int r_no) {
		int res = 0;
		// 1, 댓글 가져오기
		ReplyDto reply = freeReplyDao.selectOne(r_no);

		// 2. 넘어온 댓글이 부모 댓글이면 값 수정 / 아니면 삭제
		if (reply.getR_class() == 0) {
			res = freeReplyDao.deleteParentReply(r_no);
		} else {
			res = freeReplyDao.deleteReply(r_no);

			//글 삭제에 성공했으면
			if (res > 0) {
				// 3. 삭제 후 댓글 그룹번호로 그룹번호 댓글 리스트 뽑아옴 ( 부모 댓글이 삭제된 댓글인지 알기위해 )
				List<ReplyDto> groupReplyList = freeReplyDao.selectGroupReplyList(reply.getR_groupno());

				// 4. 삭제 후 댓글 그룹 남은 댓글이 1개이면
				if (groupReplyList.size() == 1) { 

					// 5. 댓글 클래스 컬럼 가져옴
					int r_class = groupReplyList.get(0).getR_class();
					// 6. 댓글 클래스가 -1이면(삭제된컬럼) 댓글 삭제
					if (r_class == -1) {
						res = freeReplyDao.deleteReply(groupReplyList.get(0).getR_no());
					}
				}
			}
		}

		return res;
	}

	//댓글리스트로 member 정보 받아오기
	@Override
	public Map<Integer, MemberDto> getMemberByList(List<ReplyDto> replyList) {
		return memberDao.selectMemberByFreeReply(replyList);
	}
	
	//댓글 쓰기
	@Override
	public int writeReply(ReplyDto dto) {
		return freeReplyDao.insertReply(dto);
	}
}
