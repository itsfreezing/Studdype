package com.studdype.test.model.biz.file;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studdype.test.model.dao.board.photo.PhotoFileDao;
import com.studdype.test.model.dto.board.FileDto;

@Service
public class photoFileBizImpl implements photoFileBiz{

	@Autowired
	private PhotoFileDao photoFileDao;

	@Override
	public List<FileDto> attachImageList(int b_no) {
		return null;
	}

	@Override
	public List<FileDto> galleryDetailFile(int b_no) {
		return photoFileDao.galleryDetailFile(b_no);
	}
	


}
