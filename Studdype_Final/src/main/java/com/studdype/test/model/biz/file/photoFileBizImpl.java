package com.studdype.test.model.biz.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studdype.test.model.dao.board.photo.PhotoFileDao;

@Service
public class photoFileBizImpl implements photoFileBiz{

	@Autowired
	private PhotoFileDao photoFileDao;
	@Override
	public int updateMainPhoto(int b_no) {
		return photoFileDao.updateMainPhoto(b_no);
	}

}
