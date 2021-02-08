package com.studdype.test.model.dao.board.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.BoardDto;

@Repository
public class NoticeBoardDaoImpl implements NoticeBoardDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	//공지사항 글 목록 가져오기
	@Override
	public List<BoardDto> selectNoticeBoard(int s_no) {
		List<BoardDto> resList = null;
		
		try {
			resList = sqlSession.selectList(NAMESPACE+"selectNoticeBoard",s_no);
		} catch (Exception e) {
			System.out.println("[ERROR] [NoticeBoardDaoImpl] selectNoticeBoard method");
			e.printStackTrace();
		}
		
		return resList;
	}

	//공지사항 게시글 작성
	@Override
	public int insertBoard(BoardDto board) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertBoard", board);
		} catch (Exception e) {
			System.out.println("[ERROR] [NoticeBoardDaoImpl] insertBoard method");
			e.printStackTrace();
		}
		return res;
	}

	//공지사항 게시글 갯수 가져오기
	@Override
	public int selectNoticeNum(int s_no) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectNoticeNum",s_no);
		} catch (Exception e) {
			System.out.println("[ERROR] [NoticeBoardDaoImpl] selectNoticeNum method");
			e.printStackTrace();
		}
				
		return res;
	}

	//공지사항 조회수 증가
	@Override
	public int updateCnt(int b_no) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"updateCnt", b_no);
		} catch (Exception e) {
			System.out.println("[ERROR][NoticeBoardDaoImpl] UpdateCnt method");
			e.printStackTrace();
		}
		return res;
	}

	//공지사항 글 가져오기
	@Override
	public BoardDto selectOne(int b_no) {
		BoardDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", b_no);
		} catch (Exception e) {
			System.out.println("[ERROR][NoticeBoardDaoImpl] selectOne method");
			e.printStackTrace();
		}
		return dto;
	}

	//공지사항 주변글 가져오기
	@Override
	public List<BoardDto> selectRecentList(int s_no, int b_no) {
		List<BoardDto> resList = null;
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("s_no", s_no);
		paramMap.put("b_no", b_no);
		
		try {
			resList = sqlSession.selectList(NAMESPACE+"selectRecentList", paramMap);
		} catch (Exception e) {
			System.out.println("[ERROR][NoticeBoardDaoImpl] selectRecentList method");
			e.printStackTrace();
		}
		
		return resList;
	}

	//공지사항 리스트 게시글 역순 가져오기
	@Override
	public List<BoardDto> selectNoticeBoardList(int s_no) {
		List<BoardDto> resList = null;
		
		try {
			resList = sqlSession.selectList(NAMESPACE+"selectNoticeBoardList",s_no);
		} catch (Exception e) {
			System.out.println("[ERROR] [NoticeBoardDaoImpl] selectNoticeBoardList method");
			e.printStackTrace();
		}
		
		return resList;
	}

	//공지 게시판 글 삭제
	@Override
	public int deleteBoard(int b_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"deleteBoard", b_no);
		} catch (Exception e) {
			System.out.println("[ERROR]: deleteBoard!!");
			e.printStackTrace();
		}
		return res;
	}

	//공지 게시판 글 수정
	@Override
	public int updateBoard(BoardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"updateBoard", dto);
		} catch (Exception e) {
			System.out.println("[ERROR}: updateBoard");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public List<BoardDto> recentListForStudyHome(int s_no) {
		List<BoardDto> list = null;
		
		try {
			list = sqlSession.selectList(NAMESPACE+"recentListForStudyHome", s_no);
			System.out.println("noticeImpl: "+s_no);
		} catch (Exception e) {
			System.out.println("[ERROR][NoticeBoardDaoImpl] recentListForStudyHome");
			e.printStackTrace();
		}
		
		return list;
	}


}
