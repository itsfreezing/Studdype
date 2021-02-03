package com.studdype.test.model.dao.board.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;


@Repository
public class DataFileDaoImpl implements DataFileDao{

	@Autowired
	SqlSessionTemplate sqlSession;

	// 첨부파일 리스트 게시글 번호로 가져오기
	@Override
	public Map<Integer, List<FileDto>> selectBoardFileList(List<BoardDto> dataList) {
		Map<Integer, List<FileDto>> resMap = new HashMap<Integer, List<FileDto>>();
		
		try {
			for(int i = 0; i < dataList.size(); i++) {
				List<FileDto> fileList = null;
				fileList = sqlSession.selectList(NAMESPACE+"selectAttachFileList", dataList.get(i).getB_no());
				resMap.put(dataList.get(i).getB_no(), fileList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resMap;
	}

	@Override
	public FileDto selectFile(int f_no) {
		FileDto resDto = new FileDto();
		
		try {
			resDto = sqlSession.selectOne(NAMESPACE+"selectFile");
		} catch (Exception e) {
			System.out.println("[ERROR] : selectFile");
			e.printStackTrace();
		}
		
		return resDto;
	}

}
