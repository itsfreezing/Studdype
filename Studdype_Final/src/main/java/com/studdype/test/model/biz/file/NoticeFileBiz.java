package com.studdype.test.model.biz.file;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;

public interface NoticeFileBiz {

	List<FileDto> getAttachFileList(int b_no);// 첨부 파일 가져오기
	FileDto getFileByFno(int f_no); //게시판 파일 가져오기
	int deleteFile(int f_no); //게시판 파일 삭제하기
	
	Map<Integer, List<FileDto>> getBoardFileList(List<BoardDto> noticeList); // 첨부파일 리스트 게시글 번호로 가져오기
}
