package com.studdype.test.model.biz.file;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.studdype.test.common.FileHandler;
import com.studdype.test.model.dao.board.book.BookDao;
import com.studdype.test.model.dao.board.free.FreeFileDao;
import com.studdype.test.model.dto.board.FileDto;

@Service
public class FreeFileBizImpl implements FreeFileBiz {

	@Autowired
	private FreeFileDao freeFileDao;
	private FileHandler fileHandler = new FileHandler();

	//게시판 번호로 첨부파일 가져오기
	@Override
	public List<FileDto> getAttachFileList(int b_no) {
		return freeFileDao.selectAttachFileList(b_no);
	}

	//파일 가져오기
	@Override
	public FileDto getFileByFno(int f_no) {
		return freeFileDao.selectFile(f_no);
	}

	//파일삭제하기
	@Override
	@Transactional
	public int deleteFile(int f_no) {
		int res = 0;
		
		FileDto dto = freeFileDao.selectFile(f_no); //파일 가져오기
		
		res = fileHandler.deleteFile(dto);
		
		if( res > 0 ) {
			res = freeFileDao.deleteFile(f_no);
			
		}
		
		if(dto == null || res < 1) {
			throw new RuntimeException("[자유게시판] 글 가져오기 에러");
		}		
		return res;
	}
}
