package com.studdype.test.model.dao.board.free;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.model.dto.board.FileDto;

@Repository
public class FreeFileDaoImpl implements FreeFileDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertFile(List<FileDto> fileList) {
		int res = 0;
		int resCnt = 0;
		
		try {
			for(int i = 0 ; i < fileList.size() ; i++) {
				res = sqlSession.insert(NAMESPACE+"insertFile", fileList.get(i));
				//성공하면
				if(res == 1) {
					resCnt++;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resCnt;
	}

	//자유게시판 첨부파일 글번호로 가져오기
	@Override
	public List<FileDto> selectAttachFileList(int b_no) {
		List<FileDto> resList = null;
		
		try {
			resList = sqlSession.selectList(NAMESPACE+"selectAttachFileList", b_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resList;
	}

}
