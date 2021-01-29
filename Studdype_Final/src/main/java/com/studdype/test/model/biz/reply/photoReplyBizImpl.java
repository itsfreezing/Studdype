package com.studdype.test.model.biz.reply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.studdype.test.model.dao.board.photo.PhotoReplyDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.board.ReplyDto;
import com.studdype.test.model.dto.member.MemberDto;

@Service
public class photoReplyBizImpl implements photoReplyBiz{

		@Autowired
		private PhotoReplyDao photoReplyDao;
		
		@Autowired
		private MemberDao memberDao;

		@Override
		public List<ReplyDto> galleryReplyList(int b_no) {
			return photoReplyDao.galleryReplyList(b_no);
		}
		
		@Transactional
		@Override
		public int deleteGalleryReply(int r_no) {
			int res = 0;
			
			ReplyDto reply = photoReplyDao.replySelectOne(r_no);
			
			if(reply.getR_class() == 0) {
				List<ReplyDto> groupReplyList = photoReplyDao.selectGroupReplyList(reply.getR_groupno());
				if(groupReplyList.size() == 1) {
					res = photoReplyDao.deleteGalleryReply(r_no);
				}else {
					photoReplyDao.deleteParentReply(r_no);
				}
				
				if(res > 1 || reply == null || groupReplyList == null) {
					throw new RuntimeException("에러 댓글 가져오기");
				}
			}else {
				res = photoReplyDao.deleteGalleryReply(r_no);
				
				if(res > 0) {
					List<ReplyDto> groupReplyList = photoReplyDao.selectGroupReplyList(reply.getR_groupno());
					
					if(groupReplyList.size() == 1) {
						
						int r_class = groupReplyList.get(0).getR_class();
						
						if(r_class == -1) {
							res = photoReplyDao.deleteGalleryReply(groupReplyList.get(0).getR_no());
						}
						if(res < 1 || reply == null || groupReplyList == null) {
							throw new RuntimeException("에러 게시판 댓글 가져오기");
						}
					}
				}
			}
			return res;
		}

		@Override
		public int insertGalleryReply(ReplyDto dto) {
			return photoReplyDao.insertGalleryReply(dto);
		}

		@Override
		public int updateGalleryReply(ReplyDto dto) {
			return photoReplyDao.updateGalleryReply(dto);
		}

		@Override
		public int insertGalleryRecomment(ReplyDto dto) {
			return photoReplyDao.insertGalleryRecomment(dto);
		}

		@Override
		public Map<Integer, MemberDto> getMemberByList(List<ReplyDto> replyList) {
			return memberDao.selectMemberByPhotoReply(replyList);
		}
		
		
}
