package com.studdype.test.model.dao.board.free;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.model.dto.board.FileDto;

public interface FreeFileDao {
	//자유 게시판 댓글 
	String NAMESPACE="freefile.";

	int insertFile(List<FileDto> fileList); //자유게시판 file테이블에 데이터 삽입
	List<FileDto> selectAttachFileList(int b_no);//자유게시판 게시판번호로 첨부파일가져오기
	FileDto selectFile(int f_no); //파일가져오기
	int insertAddFile(List<FileDto> fileList); // 자유게시판 글 수정시 추가파일 삽입
	int deleteFile(int f_no); //파일 삭제
}
