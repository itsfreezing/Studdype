package com.studdype.test.model.biz.file;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.studdype.test.common.FileHandler;
import com.studdype.test.model.dao.board.notice.NoticeFileDao;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;

@Service
public class NoticeFileBizImpl implements NoticeFileBiz {

	@Autowired
	private NoticeFileDao noticeFileDao;
	
	private FileHandler fileHandler =new FileHandler();
	//게시판 번호로 첨부파일 가져오기
	@Override
	public List<FileDto> getAttachFileList(int b_no) {
		return noticeFileDao.selectAttachFileList(b_no);
	}
	//파일 가져오기
	@Override
	public FileDto getFileByFno(int f_no) {
		return noticeFileDao.selectFile(f_no);
	}
	
	//파일삭제하기
	@Transactional
	@Override
	public int deleteFile(int f_no) {
		int res = 0;
		
		FileDto dto = noticeFileDao.selectFile(f_no); //파일 가져오기
		
		res = fileHandler.deleteFile(dto);
		
		if( res > 0 ) {
			res = noticeFileDao.deleteFile(f_no);
			
		}
		
		if(dto == null || res < 1) {
			throw new RuntimeException("[자유게시판] 글 가져오기 에러");
		}		
		
		return res;
	}
	
	// 첨부파일 리스트 게시글 번호로 가져오기
	@Override
	public Map<Integer, List<FileDto>> getBoardFileList(List<BoardDto> noticeList) {
		return noticeFileDao.selectBoardFileList(noticeList);
	}

}
