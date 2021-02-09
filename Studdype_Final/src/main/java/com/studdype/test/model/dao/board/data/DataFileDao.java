package com.studdype.test.model.dao.board.data;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;

public interface DataFileDao {
	//자료실 게시판 게시글 사진 
	String NAMESPACE="datafile.";
	public Map<Integer, List<FileDto>> selectBoardFileList(List<BoardDto> dataList); // 첨부파일 리스트 게시글 번호로 가져오기
	public FileDto selectFile(int f_no); // 파일 번로로 파일 정보 가져오기
	public List<FileDto> selectAttachFileList(int b_no); // 파일 리스트 가져오기 
	public int insertFile(List<FileDto> fileList); // 파일 리스트 삽입
	public int deleteFile(int f_no); // 파일 삭제
	public int insertAddFile(List<FileDto> fileList); // 추가 파일 삽입
}
