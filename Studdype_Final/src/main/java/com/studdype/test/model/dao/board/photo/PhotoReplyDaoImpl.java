package com.studdype.test.model.dao.board.photo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.ReplyDto;

@Repository
public class PhotoReplyDaoImpl implements PhotoReplyDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ReplyDto> galleryReplyList(int b_no) {
		List<ReplyDto> res = null;
		
		try {
			res = sqlSession.selectList(NAMESPACE+"galleryReplyList", b_no);
		} catch (Exception e) {
		System.out.println("에러 댓글 리스트 가져오기");
		e.printStackTrace();
		}
		return res;
	}

	@Override
	public ReplyDto replySelectOne(int r_no) {
		ReplyDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"replySelectOne", r_no);
		} catch (Exception e) {
		System.out.println("에러 댓글 하나 가져오기");
		e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deleteParentReply(int r_no) {
		int res =0;
		
		try {
			res = sqlSession.update(NAMESPACE+"deleteParentReply", r_no);
		} catch (Exception e) {
			System.out.println("에러 부모댓글 삭제");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deleteGalleryReply(int r_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"deleteReply", r_no);
		} catch (Exception e) {
			System.out.println("에러 갤러리 댓글 삭제");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<ReplyDto> selectGroupReplyList(int r_groupno) {
		List<ReplyDto> resList = null;
		
		try {
			resList = sqlSession.selectList(NAMESPACE+"selectGroupReplyList", r_groupno);
		} catch (Exception e) {
			System.out.println("에러 그룹번호로 갤러리 댓글 리스트");
			e.printStackTrace();
		}
		return resList;
	}

	@Override
	public int insertGalleryReply(ReplyDto dto) {
		int res = 0 ;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertReply", dto);
		} catch (Exception e) {
			System.out.println("에러 갤러리댓글 쓰기");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int updateGalleryReply(ReplyDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"updateReply", dto);
		} catch (Exception e) {
			System.out.println("에러 갤러리 댓글 업데이트");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int insertGalleryRecomment(ReplyDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertRecomment", dto);
		} catch (Exception e) {
			System.out.println("에러 갤러리 댓글에 댓글쓰기");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public Map<Integer, Integer> selectGalleryReplyCnt(List<BoardDto> list) {
		Map<Integer, Integer> cntList = new HashMap<Integer, Integer>();
		
		try {
			for(int i = 0 ; i < list.size() ; i++) {
				int cnt = sqlSession.selectOne(NAMESPACE+"selectReplyCnt", list.get(i).getB_no());
				cntList.put(list.get(i).getB_no(), cnt);
			}
		} catch (Exception e) {
			System.out.println("에러 게시글 리스트 댓글 갯수");
			e.printStackTrace();
		}
		
		return cntList;
	}
	

}
