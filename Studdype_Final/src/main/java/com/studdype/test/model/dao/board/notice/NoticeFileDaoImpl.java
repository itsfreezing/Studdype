package com.studdype.test.model.dao.board.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.FileDto;

@Repository
public class NoticeFileDaoImpl implements NoticeFileDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//공지사항 파일 업로드
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
			System.out.println("[ERROR][NoticeFileDaoImpl] insertFIle method");
			e.printStackTrace();
		}
		
		return resCnt;
	}

	//공지사항 게시판 파일첨부 가져오기
	@Override
	public List<FileDto> selectAttachFileList(int b_no) {
		List<FileDto> resList = null;
		
		try {
			resList = sqlSession.selectList(NAMESPACE+"selectAttachFileList", b_no);
		} catch (Exception e) {
			System.out.println("[ERROR][NoticeFileDaoImpl] selectAttachFileList method");
			e.printStackTrace();
		}
		
		return resList;
	}
	//파일 번호로 파일 가져오기
	@Override
	public FileDto selectFile(int f_no) {
		FileDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectFile", f_no);
		} catch (Exception e) {
			System.out.println("[ERROR]: selectFile");
			e.printStackTrace();
		}
		
		return dto;
	}

}
