package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.common.FileHandler;
import com.studdype.test.model.dao.board.free.FreeBoardDao;
import com.studdype.test.model.dao.board.free.FreeFileDao;
import com.studdype.test.model.dao.board.free.FreeReplyDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.board.ReplyDto;
import com.studdype.test.model.dto.member.MemberDto;

@Service
public class FreeBizImpl implements FreeBiz {
	@Autowired
	private FreeBoardDao freeBoardDao; 
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private FreeReplyDao freeReplyDao;
	@Autowired
	private FreeFileDao freeFileDao;
	
	private FileHandler fileHandler = new FileHandler(); //파일 저장하는 클래스
	
	//자유게시판 총 게시글 갯수
	@Override
	public int selectTotalBoardNum(int s_no) {		
		return freeBoardDao.selectTotalBoardNum(s_no);
	}

	//페이징 (15개 게시글만 가져오기)
	@Override
	public List<BoardDto> selectPagingBoardList(Map pageMap) {
		return freeBoardDao.selectPagingBoardList(pageMap);
	}

	//리스트로 작성자 이름 가져오기
	@Override
	public Map<Integer, String> getWriterNameByList(List<BoardDto> list) {
		return memberDao.selectWriterByFreeList(list);
	}

	//자유게시판 글 작성
	@Transactional
	@Override
	public int writeBoard(BoardDto board, MultipartFile[] mfileList, String path, List<FileDto> fileList) {
		int res = 0; //writeBoard 결과
		int insertRes = 0; //글삽입 결과
		
		insertRes = freeBoardDao.insertBoard(board); //자유게시판에 글 삽입
		int resCnt = freeFileDao.insertFile(fileList); // 자유게시판 파일 테이블에 파일 삽입
		
		//둘다 성공하면 실제 파일 저장시킴.
		if(resCnt == fileList.size() && insertRes ==1) {
			res = 1;
			for(int i = 0 ; i < mfileList.length ; i++) {
				fileHandler.writeFile(mfileList[i] , path, fileList.get(i).getF_url());
			}
		}
		
		return res;
	}
	
	//자유게시판 글작성 파일 없을떄
	@Override
	public int writeBoard(BoardDto board) {
		return freeBoardDao.insertBoard(board);
	}

	//자유게시판 글 가져오기(오류 무시하고 진행 가능) 디테일가져오기(조회수)
	@Transactional
	@Override
	public BoardDto selectDetail(int b_no, int isVisitPage) {		
		if(isVisitPage == 0) {
			freeBoardDao.updateCnt(b_no);
		}
		BoardDto dto = freeBoardDao.selectOne(b_no);
		return dto;
	}

	//자유게시판 리스트 member리스트 함수
	@Override
	public Map<Integer, MemberDto> getMemberMap(List<BoardDto> list) {
		return memberDao.selectMemberByFreeList(list);
	}

	//자유게시판 글 삭제
	@Transactional
	@Override
	public int deleteBoard(int b_no) {
		int res = 0;
		
		List<FileDto> fileList = freeFileDao.selectAttachFileList(b_no); //파일리스트 가져오기
		res = fileHandler.deleteFile(fileList);
		
		if( res > 0 ) {
			res = freeBoardDao.deleteBoard(b_no);
		}
		
		return res;
	}

	//자유게시판 글 수정 파일있을떄
	@Transactional
	@Override
	public int updateBoard(BoardDto board, MultipartFile[] mfileList, String path, List<FileDto> fileList) {
		
		int res = 0; //updateBoard 결과
		int updateRes = 0; //글 수정 결과
		
		updateRes = freeBoardDao.updateBoard(board); //자유게시판에 글 삽입
		int resCnt = freeFileDao.insertAddFile(fileList); // 자유게시판 파일 테이블에 파일 삽입
		
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
	public int updateBoard(BoardDto board) {
		return freeBoardDao.updateBoard(board);
	}
	
	//자유게시판 글 가져오기
	@Override
	public BoardDto selectOne(int b_no) {
		return freeBoardDao.selectOne(b_no);
	}

	//자유게시판 디테일 최근글 뽑아오기
	@Override
	public List<BoardDto> getRecentList(int s_no, int b_no) {
		return freeBoardDao.selectRecentList(s_no, b_no);
	}

	//댓글 갯수 가져오기
	@Override
	public Map<Integer, Integer> getReplyCnt(List<BoardDto> list) {
		return freeReplyDao.selectReplyCnt(list);
	}

	//자유게시판 검색시 총 게시글 수
	@Override
	public int selectTotalBoardNumOfSearch(Map searchMap) {
		return freeBoardDao.selectTotalBoardNumOfSearch(searchMap);
	}

	//검색 한 것 페이징
	@Override
	public List<BoardDto> selectPagingSearchBoardList(Map<String, Object> pageMap) {
		return freeBoardDao.selectPagingSearchBoardList(pageMap);
	}

	

	

}
