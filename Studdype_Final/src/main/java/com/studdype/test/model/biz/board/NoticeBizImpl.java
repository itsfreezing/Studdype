package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.common.FileHandler;
import com.studdype.test.model.dao.board.notice.NoticeBoardDao;
import com.studdype.test.model.dao.board.notice.NoticeFileDao;
import com.studdype.test.model.dao.board.notice.NoticeReplyDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.member.MemberDto;

@Service
public class NoticeBizImpl implements NoticeBiz {
	@Autowired
	private NoticeBoardDao noticeBoardDao;
	@Autowired
	private NoticeReplyDao noticeReplyDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private NoticeFileDao noticeFileDao;
	private FileHandler fileHandler = new FileHandler(); //파일 저장하는 클래스
	
	//공지사항 게시글 리스트가져오기
	@Override
	public List<BoardDto> selectNoticeBoard(int s_no) {
		return noticeBoardDao.selectNoticeBoard(s_no);
	}
	
	//공지사항 게시글 리스트 역순 가져오기
	@Override
	public List<BoardDto> selectNoticeBoardList(int s_no) {
		return noticeBoardDao.selectNoticeBoardList(s_no);
	}

	//공지사항 댓글 갯수 가져오기
	@Override
	public Map<Integer, Integer> getReplyCnt(List<BoardDto> noticeList) {
		return noticeReplyDao.selectReplyCnt(noticeList);
	}

	//작성자 이름가져오기
	@Override
	public Map<Integer, MemberDto> getMemberMap(List<BoardDto> noticeList) {
		return memberDao.selectMemberByFreeList(noticeList);
	}

	//공지사항 글쓰기 첨부파일 있을때
	@Transactional
	@Override
	public int writeBoard(BoardDto board, MultipartFile[] mfileList, String path, List<FileDto> fileList) {
		int res = 0; //writeBoard 결과
		int insertRes = 0; //글삽입 결과
		
		insertRes = noticeBoardDao.insertBoard(board); //공지사항게시판에 글 삽입
		int resCnt = noticeFileDao.insertFile(fileList); // 공지사항게시판 파일 테이블에 파일 삽입
		
		//둘다 성공하면 실제 파일 저장시킴.
		if(resCnt == fileList.size() && insertRes ==1) {
			res = 1;
			for(int i = 0 ; i < mfileList.length ; i++) {
				fileHandler.writeFile(mfileList[i] , path, fileList.get(i).getF_url());
			}
		}else {
			throw new RuntimeException("[공지사항]게시글삽입 or 첨부파일저장이 되지않음!!");
		}
		
		return res;
	}
	
	//공지사항 글쓰기 첨부파일 x
	@Override
	public int writeBoard(BoardDto board) {
		return noticeBoardDao.insertBoard(board);
	}

	//공지사항 게시글 수 가져오기
	@Override
	public int getNoticeNum(int s_no) {
		return noticeBoardDao.selectNoticeNum(s_no);
	}

	//공지사항 디테일 글 가져오기
	@Transactional
	@Override
	public BoardDto selectDetail(int b_no, int isVisitPage) {
		int res = 1 ;
		if(isVisitPage == 0) {
			res = noticeBoardDao.updateCnt(b_no);
		}
		BoardDto dto = noticeBoardDao.selectOne(b_no);
		if(dto == null || res < 1) {
			throw new RuntimeException("[자유게시판] 글 가져오기 에러");
		}
		return dto;
	}

	//공지사항 주변 글 가져오기
	@Override
	public List<BoardDto> getRecentList(int s_no, int b_no) {
		return noticeBoardDao.selectRecentList(s_no, b_no);
	}
	//자유게시판 글 삭제
	@Transactional
	@Override
	public int deleteBoard(int b_no) {
		int res = 0;
		
		List<FileDto> fileList = noticeFileDao.selectAttachFileList(b_no); //파일리스트 가져오기
		res = fileHandler.deleteFile(fileList);
		
		if( res > 0 ) {
			res = noticeBoardDao.deleteBoard(b_no);
		}
		
		return res;
	}

	//자유게시판 글 가져오기
	@Override
	public BoardDto selectOne(int b_no) {
		return noticeBoardDao.selectOne(b_no);
	}

	//자유게시판 글 수정 파일있을떄
	@Transactional
	@Override
	public int updateBoard(BoardDto dto, MultipartFile[] mfileList, String path, List<FileDto> fileList) {
		
		int res = 0; //updateBoard 결과
		int updateRes = 0; //글 수정 결과
		
		updateRes = noticeBoardDao.updateBoard(dto); //자유게시판에 글 삽입
		int resCnt = noticeFileDao.insertAddFile(fileList); // 자유게시판 파일 테이블에 파일 삽입
		
		//둘다 성공하면 실제 파일 저장시킴.
		if(resCnt == fileList.size() && updateRes ==1) {
			res = 1;
			for(int i = 0 ; i < mfileList.length ; i++) {
				fileHandler.writeFile(mfileList[i] , path, fileList.get(i).getF_url());
			}
		}
		
		
		return res;
	}

	//자유게시판 글수정 파일 없을떄
	@Override
	public int updateBoard(BoardDto dto) {
		return noticeBoardDao.updateBoard(dto);
	}

}
