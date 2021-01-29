package com.studdype.test.model.biz.file;

import java.util.List;

import org.springframework.stereotype.Service;

import com.studdype.test.model.dto.board.FileDto;

@Service
public interface photoFileBiz {
	
	List<FileDto> attachImageList(int b_no);  //이미지ismain 'Y' 가져오기
	List<FileDto> galleryDetailFile(int b_no); 
}
