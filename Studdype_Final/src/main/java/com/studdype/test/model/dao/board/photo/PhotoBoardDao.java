package com.studdype.test.model.dao.board.photo;


import java.util.List;

import com.studdype.test.common.SearchPagination;
import com.studdype.test.model.dto.board.BoardDto;

public interface PhotoBoardDao {
	//사진 게시판 
	String NAMESPACE="photoboard.";
			
	public int insertBoard(BoardDto boardDto);
	public List<BoardDto> galleryList(SearchPagination searchPagination);
	public int totalGalleryListNum(SearchPagination searchPagination);
	

}
