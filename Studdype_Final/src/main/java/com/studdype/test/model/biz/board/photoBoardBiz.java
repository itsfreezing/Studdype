package com.studdype.test.model.biz.board;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.common.SearchPagination;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;

@Service
public interface photoBoardBiz {
	
	//갤러리 글쓰기
	public int writeGallery(BoardDto boardDto, MultipartFile[] mfileList, String path, List<FileDto> fileList);
	public int writeGallery(BoardDto boardDto);
	public List<BoardDto> galleryList(SearchPagination searchPagination);
	public int totalGalleryListNum(SearchPagination searchPagination);
	public List<FileDto> attachImageList(int b_no);
}
