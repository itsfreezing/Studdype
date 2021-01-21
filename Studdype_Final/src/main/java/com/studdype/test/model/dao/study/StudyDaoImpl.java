package com.studdype.test.model.dao.study;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.common.Pagination;
import com.studdype.test.common.SearchPagination;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.study.StudyDto;

@Repository
public class StudyDaoImpl implements StudyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//스터디 list 전체 가져오기
	@Override
	public List<StudyDto> studyList(SearchPagination searchPagination) {

		List<StudyDto> studyList = null;

		try {
			studyList = sqlSession.selectList(NAMESPACE + "studyList", searchPagination);
			System.out.println(searchPagination.getKeyword());
		} catch (Exception e) {
			System.out.println("에러 발생: studyDao - selectList");
			e.printStackTrace();
		}

		return studyList;
	}

	//스터디 번호로 selectOne
	@Override
	public StudyDto selectOneBySno(int s_no) {
		StudyDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectOneBySno", s_no);
		} catch (Exception e) {
			System.out.println("[ERROR]: selectOneBySno");
			e.printStackTrace();
		}
		return res;
	}

	// 스터디 insert 
	@Override
	public int insertStudy(StudyDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertStudy", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] : insertStudy");
			e.printStackTrace();
		}
		
		return res;
	}

	// 등록된 스터디 마지막 번호
	@Override
	public int selectStudyFinalNumber() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectStudyFinalNumber");
		} catch (Exception e) {
			System.out.println("[ERROR] : selectStudyFinalNumber");
			e.printStackTrace();
		}
		return res;
	}
	
	//스터디 리스트 총 갯수
	@Override
	public int selectTotalStudyListNum(SearchPagination searchPagination) {
		int totalListNum = 0;
		try {
			totalListNum = sqlSession.selectOne(NAMESPACE+"selectTotalStudyListNum", searchPagination);
		}catch(Exception e) {
			System.out.println("에러: 스터디 리스트 총 갯수");
			e.printStackTrace();
		}
		
		return totalListNum;
	}

	@Override
	public List<StudyDto> studyLeader(int leader_no) {
		List<StudyDto> list = new ArrayList<StudyDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"studyLeader",leader_no);
		} catch (Exception e) {
			System.out.println("ERROR:studyLeader");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int newLeader(StudyDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE+"newLeader",dto);
		} catch (Exception e) {
			System.out.println("ERROR: newLeader!!!!!!!!!!!!!!");
			e.printStackTrace();
		}
		return res;
	}

}
