package com.studdype.test.model.dao.board.notice;

import java.util.List;

import com.studdype.test.model.dto.board.FileDto;

public interface NoticeFileDao {
	//공지사항 게시글 사진 
	String NAMESPACE="noticefile.";
					  
	int insertFile(List<FileDto> fileList); //파일 디비에 저장
	List<FileDto> selectAttachFileList(int b_no); //게시판 번호로 첨부파일 가져오기
	
}
