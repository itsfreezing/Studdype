package com.studdype.test.model.biz.file;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studdype.test.model.dao.board.book.BookDao;
import com.studdype.test.model.dao.board.free.FreeFileDao;
import com.studdype.test.model.dto.board.FileDto;

@Service
public class FreeFileBizImpl implements FreeFileBiz {

	@Autowired
	private FreeFileDao freeFileDao;

	//게시판 번호로 첨부파일 가져오기
	@Override
	public List<FileDto> getAttachFileList(int b_no) {
		return freeFileDao.selectAttachFileList(b_no);
	}
}
