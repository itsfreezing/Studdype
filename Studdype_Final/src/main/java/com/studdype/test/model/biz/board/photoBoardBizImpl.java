package com.studdype.test.model.biz.board;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;

@Service
public class photoBoardBizImpl implements photoBoardBiz{

	@Override
	public int writeGallery(BoardDto boardDto, MultipartFile[] mfileList, String path, List<FileDto> fileList) {
		return 0;
	}

}
