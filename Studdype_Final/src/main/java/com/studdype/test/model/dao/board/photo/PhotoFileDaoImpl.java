package com.studdype.test.model.dao.board.photo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.FileDto;

@Repository
public class PhotoFileDaoImpl implements PhotoFileDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertImage(List<FileDto> fileList) {
		int res = 0;
		int resCnt = 0;
		
		try {
		for(int i=0; i<fileList.size(); i++) {
			
		}
		} catch (Exception e) {

		}
		return 0;
	}

}
