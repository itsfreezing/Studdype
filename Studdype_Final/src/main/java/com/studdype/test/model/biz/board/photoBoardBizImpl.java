package com.studdype.test.model.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.common.FileHandler;
import com.studdype.test.common.SearchPagination;
import com.studdype.test.model.dao.board.photo.PhotoBoardDao;
import com.studdype.test.model.dao.board.photo.PhotoFileDao;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;

@Service
public class photoBoardBizImpl implements photoBoardBiz{
	@Autowired
	private PhotoBoardDao photoDao;
	
	@Autowired
	private PhotoFileDao photoFileDao;
	
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
		return 0;
	}

	@Override
	public List<FileDto> attachImageList(int b_no) {
		return photoFileDao.attachImageList(b_no);
	}

	@Override
	public BoardDto galleryDetailOne(int b_no) {
		return photoDao.galleryDetailOne(b_no);
	}


}
