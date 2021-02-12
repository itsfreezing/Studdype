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
			System.out.println("[ERROR] [FreeFileDaoImpl] insertFile method");
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
			System.out.println("[ERROR} [[FreeFileDaoImpl] selectAttachFileList method");
			e.printStackTrace();
		}
		
		return resList;
	}

	//자유게시판 첨부파일 가져오기
	@Override
	public FileDto selectFile(int f_no) {
		FileDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectFile", f_no);
		} catch (Exception e) {
			System.out.println("[ERROR] [FreeFileDaoImpl] selectFile method");
			e.printStackTrace();
		}
		
		return dto;
	}

	//자유게시판 글 수정시 추가 파일 삽입
	@Override
	public int insertAddFile(List<FileDto> fileList) {
		int res = 0;
		int resCnt = 0;
		
		try {
			for(int i = 0 ; i < fileList.size() ; i++) {
				res = sqlSession.insert(NAMESPACE+"insertAddFile", fileList.get(i));
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

	//파일 삭제
	@Override
	public int deleteFile(int f_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"deleteFile", f_no);
		} catch (Exception e) {
			System.out.println("[ERROR] [FreeFileDaoImpl] deleteFile method");
			e.printStackTrace();
		}
		return res;
	}

}
