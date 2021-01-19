package com.studdype.test.model.biz.file;

import java.util.List;

import com.studdype.test.model.dto.board.FileDto;

public interface NoticeFileBiz {

	List<FileDto> getAttachFileList(int b_no);// 첨부 파일 가져오기

}
