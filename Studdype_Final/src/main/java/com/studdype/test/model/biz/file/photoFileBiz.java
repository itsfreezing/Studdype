package com.studdype.test.model.biz.file;

import java.util.List;

import com.studdype.test.model.dto.board.FileDto;

public interface photoFileBiz {
	
	List<FileDto> attachImageList(int b_no);  //이미지ismain 'Y' 가져오기
}
