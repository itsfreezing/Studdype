package com.studdype.test.model.biz.file;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.studdype.test.common.FileHandler;
import com.studdype.test.model.dao.board.photo.PhotoFileDao;
import com.studdype.test.model.dto.board.FileDto;

@Service
public class photoFileBizImpl implements photoFileBiz{

	@Autowired
	private PhotoFileDao photoFileDao;
	private FileHandler fileHandler = new FileHandler();

	@Override
	public List<FileDto> attachImageList(int b_no) {
		return null;
	}

	@Override
	public List<FileDto> galleryDetailFile(int b_no) {
		return photoFileDao.galleryDetailFile(b_no);
	}
	
	@Transactional
	@Override
	public int deleteGalleryFile(int f_no) {
		int res = 0;
		
		FileDto dto = photoFileDao.selectFile(f_no); //파일 가져오기
		
		res = fileHandler.deleteFile(dto);
		
		if( res > 0 ) {
			res = photoFileDao.deleteGalleryFile(f_no);
			
		}
		
		if(dto == null || res < 1) {
			throw new RuntimeException("글 가져오기 에러");
		}		
		return res;
	}
	

	@Override
	public FileDto getFileByFno(int f_no) {
		return photoFileDao.selectFile(f_no);
	}
	


}
