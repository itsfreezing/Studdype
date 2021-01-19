package com.studdype.test.model.biz.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;

public interface photoBoardBiz {
	
	//갤러리 글쓰기
	public int writeGallery(BoardDto boardDto, MultipartFile[] mfileList, String path, List<FileDto> fileList);
}
