package com.studdype.test.model.biz.file;

import java.util.List;

import com.studdype.test.model.dto.board.FileDto;

public interface NoticeFileBiz {

	List<FileDto> getAttachFileList(int b_no);// 첨부 파일 가져오기
	FileDto getFileByFno(int f_no); //게시판 파일 가져오기

}
