package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.common.SearchPagination;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.member.MemberDto;

public interface photoBoardBiz {
	
	//갤러리 글쓰기
	public int writeGallery(BoardDto boardDto, MultipartFile[] mfileList, String path, List<FileDto> fileList);
	public int writeGallery(BoardDto boardDto);
	public List<BoardDto> galleryList(SearchPagination searchPagination);
	public int totalGalleryListNum(SearchPagination searchPagination);
	public List<FileDto> attachImageList();
	public BoardDto galleryDetailOne(int b_no);
	public int updateGallery(BoardDto board, MultipartFile[] mfileList, String path, List<FileDto> fileList);
	public int deleteGallery(int b_no);
	
	public Map<Integer, MemberDto> getMemberMap(List<BoardDto> list); 
	public Map<Integer, Integer> getReplyCnt(List<BoardDto> list); 
	public List<BoardDto> getRecentList(int s_no, int b_no);

}
