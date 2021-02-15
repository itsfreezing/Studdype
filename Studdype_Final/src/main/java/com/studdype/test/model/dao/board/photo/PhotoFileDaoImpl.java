package com.studdype.test.model.dao.board.photo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.BoardDto;
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
			res = sqlSession.insert(NAMESPACE+"insertImage", fileList.get(i));
			fileList.get(0).setPhoto_ismain("Y");
			if(res == 1) {
				resCnt++;
			}
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resCnt;
	}

	@Override
	public List<FileDto> attachImageList() {
		List<FileDto> res = null;
		
		try {
			res = sqlSession.selectList(NAMESPACE+"galleryAttachImage");
			
		} catch (Exception e) {
			System.out.println("에러: 이즈메인 이미지 가져오기");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<FileDto> galleryDetailFile(int b_no) {
		List<FileDto> res = null;
		
		try {
			res = sqlSession.selectList(NAMESPACE+"galleryDetail", b_no);
			for(int i=0; i < res.size(); i++ ) {
			}
		} catch (Exception e) {
			System.out.println("에러: 갤러리 파일 디테일");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int deleteGalleryFile(int f_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"deleteGalleryFile", f_no);
		} catch (Exception e) {
		System.out.println("에러 갤러리 삭제");
		e.printStackTrace();
		}
		return res;
	}

	@Override
	public int updateGalleryFile(List<FileDto> fileList) {
		int res = 0;
		int resCnt = 0;
		
		try {
			for(int i=0; i < fileList.size(); i++) {
				res = sqlSession.insert(NAMESPACE+"updateGalleryFile", fileList.get(i));
				
				if(res == 1) {
					resCnt++;
				}
			}
		} catch (Exception e) {
			System.out.println("에러 업데이트갤러리");
			e.printStackTrace();
		}
		return resCnt;
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


}
