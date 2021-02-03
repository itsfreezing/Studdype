package com.studdype.test.model.dao.board.notice;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;

public interface NoticeFileDao {
	//공지사항 게시글 사진 
	String NAMESPACE="noticefile.";
					  
	int insertFile(List<FileDto> fileList); //파일 디비에 저장
	List<FileDto> selectAttachFileList(int b_no); //게시판 번호로 첨부파일 가져오기
	FileDto selectFile(int f_no); //파일 가져오기
	int insertAddFile(List<FileDto> fileList); // 자유게시판 글 수정시 추가 파일 삽입
	int deleteFile(int f_no); //파일삭제하기
	
	public Map<Integer, List<FileDto>> selectBoardFileList(List<BoardDto> noticeList); // 첨부파일 리스트 게시글 번호로 가져오기
}
