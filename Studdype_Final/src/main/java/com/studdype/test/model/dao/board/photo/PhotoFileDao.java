package com.studdype.test.model.dao.board.photo;

import java.util.List;

import com.studdype.test.model.dto.board.FileDto;

public interface PhotoFileDao {
	//사진 게시판 게시글 사진 
	String NAMESPACE="photofile.";
	
	int insertImage(List<FileDto> fileList); //file테이블에 데이터 삽입
	
	
}
