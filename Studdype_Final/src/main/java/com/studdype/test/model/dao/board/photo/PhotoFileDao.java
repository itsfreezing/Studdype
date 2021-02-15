package com.studdype.test.model.dao.board.photo;

import java.util.List;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;

public interface PhotoFileDao {
	//사진 게시판 게시글 사진 
	String NAMESPACE="photofile.";
	
	int insertImage(List<FileDto> fileList); //file테이블에 데이터 삽입
	List<FileDto> attachImageList();  //이미지ismain 'Y' 가져오기
	public List<FileDto> galleryDetailFile(int b_no); //b_no로 한개만 가져오기
	public int deleteGalleryFile(int f_no);
	public int updateGalleryFile(List<FileDto> fileList);
	FileDto selectFile(int f_no);
	
}
