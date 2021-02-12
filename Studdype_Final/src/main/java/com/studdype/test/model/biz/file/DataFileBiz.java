package com.studdype.test.model.biz.file;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;

public interface DataFileBiz {
	public Map<Integer, List<FileDto>> getBoardFileList(List<BoardDto> dataList); // 첨부파일 리스트 게시글 번호로 가져오기
	public FileDto getFileByFno(int f_no);	// 파일로 파일 정보 가져오기
	public List<FileDto> getAttachFileList(int b_no); // 파일 리스트 가져오기
	public int deleteFile(int f_no);	// 파일 삭제
}
