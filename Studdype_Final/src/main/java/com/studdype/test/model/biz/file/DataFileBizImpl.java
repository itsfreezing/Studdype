package com.studdype.test.model.biz.file;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studdype.test.common.FileHandler;
import com.studdype.test.model.dao.board.data.DataFileDao;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;

@Service
public class DataFileBizImpl implements DataFileBiz {

	@Autowired
	private DataFileDao dataFileDao;
	private FileHandler fileHandler = new FileHandler();
	
	// 첨부파일 리스트 게시글 번호로 가져오기
	@Override
	public Map<Integer, List<FileDto>> getBoardFileList(List<BoardDto> dataList) {
		return dataFileDao.selectBoardFileList(dataList);
	}

	// 파일로 파일 정보 가져오기
	@Override
	public FileDto getFileByFno(int f_no) {
		return dataFileDao.selectFile(f_no);
	}

}
