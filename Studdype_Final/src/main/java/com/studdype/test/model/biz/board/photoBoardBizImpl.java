package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.common.FileHandler;
import com.studdype.test.common.SearchPagination;
import com.studdype.test.model.dao.board.photo.PhotoBoardDao;
import com.studdype.test.model.dao.board.photo.PhotoFileDao;
import com.studdype.test.model.dao.board.photo.PhotoReplyDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.member.MemberDto;

@Service
public class photoBoardBizImpl implements photoBoardBiz{
	@Autowired
	private PhotoBoardDao photoDao;
	
	@Autowired
	private PhotoFileDao photoFileDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private PhotoReplyDao replyDao;
	
	private FileHandler fileHandler = new FileHandler(); //파일 저장하는 클래스
	
	@Transactional
	@Override
	public int writeGallery(BoardDto boardDto, MultipartFile[] mfileList, String path, List<FileDto> fileList) {
		int res = 0;
		int insertRes = 0;
		insertRes = photoDao.insertBoard(boardDto);
		fileList.get(0).setPhoto_ismain("Y");
		int resCnt = photoFileDao.insertImage(fileList);
		if(resCnt == fileList.size() && insertRes == 1) {
			res = 1;
			for(int i=0; i<mfileList.length; i++) {
				fileHandler.writeFile(mfileList[i], path, fileList.get(i).getF_url());
			}
			
		}
		return res;
		
	}

	@Override
	public int writeGallery(BoardDto boardDto) {
		return photoDao.insertBoard(boardDto);
	}

	@Override
	public List<BoardDto> galleryList(SearchPagination searchPagination) {
		return photoDao.galleryList(searchPagination);
	}

	@Override
	public int totalGalleryListNum(SearchPagination searchPagination) {
		return photoDao.totalGalleryListNum(searchPagination);
	}

	@Override
	public List<FileDto> attachImageList() {
		return photoFileDao.attachImageList();
	}

	@Override
	public BoardDto galleryDetailOne(int b_no) {
		return photoDao.galleryDetailOne(b_no);
	}
	@Transactional
	@Override
	public int updateGallery(BoardDto board, MultipartFile[] mfileList, String path, List<FileDto> fileList) {
		int res = 0; //updateBoard 결과
		int updateRes = 0; //글 수정 결과
		
		updateRes = photoDao.updateGallery(board); //자유게시판에 글 삽입
		int resCnt = photoFileDao.updateGalleryFile(fileList); // 자유게시판 파일 테이블에 파일 삽입
		
		//둘다 성공하면 실제 파일 저장시킴.
		if(resCnt == fileList.size() && updateRes ==1) {
			res = 1;
			for(int i = 0 ; i < mfileList.length ; i++) {
				fileHandler.writeFile(mfileList[i] , path, fileList.get(i).getF_url());
			}
		}
		
		if(updateRes < 1  || res < 1 || resCnt != fileList.size()) {
			throw new RuntimeException("[자유게시판] 글 가져오기 에러");
		}		
		return res;
	}
	
	
	@Transactional
	@Override
	public int deleteGallery(int b_no) {
		int res =0;
		
		List<FileDto> fileList = photoFileDao.galleryDetailFile(b_no);
		res = fileHandler.deleteFile(fileList);
		
		if(res > 0) {
			res = photoDao.deleteGallery(b_no);
		}
		
		if(fileList == null || res < 1) {
			System.out.println("service 갤러리 삭제 에러");
		}
		return res;
	}

	@Override
	public Map<Integer, MemberDto> getMemberMap(List<BoardDto> list) {
		return memberDao.selectMemberByPhotoList(list);
	}

	@Override
	public Map<Integer, Integer> getReplyCnt(List<BoardDto> list) {
		return replyDao.selectGalleryReplyCnt(list);
	}

	@Override
	public List<BoardDto> getRecentList(int s_no, int b_no) {
		return photoDao.selectRecentList(s_no, b_no);
	}
	

}
