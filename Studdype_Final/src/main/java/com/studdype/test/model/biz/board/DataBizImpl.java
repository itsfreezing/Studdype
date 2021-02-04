package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.common.FileHandler;
import com.studdype.test.model.dao.board.data.DataBoardDao;
import com.studdype.test.model.dao.board.data.DataFileDao;
import com.studdype.test.model.dao.board.data.DataReplyDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.member.MemberDto;

@Service
public class DataBizImpl implements DataBiz {

	@Autowired
	private DataBoardDao dataDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private DataReplyDao dataReplyDao;
	@Autowired
	private DataFileDao dataFileDao;
	private FileHandler fileHandler = new FileHandler();
	
	@Override
	public int selectTotalBoardNum(int s_no) {
		return dataDao.selectTotalBoardNum(s_no);
	}
	
	@Override
	public List<BoardDto> selectPagingBoardList(Map pageMap) {
		return dataDao.selectPagingBoardList(pageMap);
	}

	@Override
	public Map<Integer, MemberDto> getMemberMap(List<BoardDto> dataList) {
		return memberDao.selectWriteByDataList(dataList);
	}

	@Override
	public Map<Integer, Integer> getReplyCnt(List<BoardDto> dataList) {
		return dataReplyDao.selectReplyCnt(dataList);
	}

	// 조회수 올리고 디테일 페이지 가져오기 
	@Override
	@Transactional
	public BoardDto selectDetail(int b_no, int isVisitPage) {
		int res = 1;
		
		if(isVisitPage == 0) {
			res = dataDao.updateCnt(b_no);
		}
		
		BoardDto dto = dataDao.selectOne(b_no);
		if(dto == null || res < 1) {
			throw new RuntimeException("[학습 자료실] 글 가져오기 에러");
		}
		
		return dto;
	}

	@Override
	public int deleteBoard(int b_no) {
		int res = 0;
		
		List<FileDto> fileList = dataFileDao.selectAttachFileList(b_no); // 게시글 번호로 파일 리스트 가져오기
		res = fileHandler.deleteFile(fileList);
		
		if(res > 0) {
			res = dataDao.deleteBoard(b_no);
		}
		
		if(fileList == null || res < 1) {
			throw new RuntimeException("[학습 자료실] 글 가져오기 에러");
		}
		
		return res;
	}

	@Override
	@Transactional
	public int writeBoard(BoardDto board, MultipartFile[] mfileList, String path, List<FileDto> fileList) {
		int res = 0; // writeBoard 결과
		int insertRes = 0; // 글 삽입 결과
		
		insertRes = dataDao.insertBoard(board);
		int resCnt = dataFileDao.insertFile(fileList);
		
		//둘다 성공하면 실제 파일 저장시킴.
		if(resCnt == fileList.size() && insertRes ==1) {
			res = 1;
			for(int i = 0 ; i < mfileList.length ; i++) {
				fileHandler.writeFile(mfileList[i] , path, fileList.get(i).getF_url());
			}
		}
				
		return res;
	}

	@Override
	public int writeBoard(BoardDto board) {
		return dataDao.insertBoard(board);
	}

	@Override
	public BoardDto selectOne(int b_no) {
		return dataDao.selectOne(b_no);
	}

	@Override
	@Transactional
	public int updateBoard(BoardDto board, MultipartFile[] mfileList, String path, List<FileDto> fileList) {
		int res = 0; // updateBoard 결과
		int updateRes = 0; // 글 수정 결과
		
		updateRes = dataDao.updateBoard(board); // 학습 자료실에 수정
		int resCnt = dataFileDao.insertAddFile(fileList); // 학습 자료실 파일 테이블에 파일 삽입
		
		// 게시판, 파일 테이블 둘다 저장 성공 후 실제 파일 저장
		if(resCnt == fileList.size() && updateRes == 1) {
			res = 1;
			for(int i = 0; i < mfileList.length; i++) {
				fileHandler.writeFile(mfileList[i], path, fileList.get(i).getF_url());
			}
		}
		
		if(updateRes < 1 || res < 1 || resCnt != fileList.size()) {
			throw new RuntimeException("[학습 자료실] 글 수정 오류");
		}
		
		return res;
	}

	@Override
	public int updateBoard(BoardDto board) {
		return dataDao.updateBoard(board);
	}

}
