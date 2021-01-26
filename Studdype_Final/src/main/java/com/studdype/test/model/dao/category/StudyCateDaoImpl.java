package com.studdype.test.model.dao.category;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.study.StudyCategoryDto;
import com.studdype.test.model.dto.study.StudyDto;

@Repository
public class StudyCateDaoImpl implements StudyCateDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<StudyCategoryDto> categoryList() {
		List<StudyCategoryDto> list = new ArrayList<StudyCategoryDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"categoryList");
		} catch (Exception e) {
			System.out.println("[ERROR] : categoryList");
			e.printStackTrace();
		}
		return list;
	}
	
	//메인페이지에 카테고리 리스트 넘기기
	@Override
	public Map<Integer, String> categoryListForHome(List<StudyDto> studyList) {
		Map<Integer, String> cateListForHomeMap = new HashMap<Integer, String>();
		String cateName = null; //카테이름 넣을 곳
		int cateNo = 0; //카테번호 넣을 곳
		for(int i=0; i < studyList.size(); i++ ) {
			cateNo = studyList.get(i).getCate_no();
			try {
				cateName = sqlSession.selectOne(NAMESPACE+"categoryListForHome", cateNo);
				
			}catch (Exception e) {
				System.out.println("에러: 카테고리 리스트 for home");
				e.printStackTrace();
			}
			cateListForHomeMap.put(studyList.get(i).getCate_no(), cateName); //put (번호, 카테이름);
		}
		return cateListForHomeMap;
	}
	
	// [studyHome] 카테고리 번호로 카테고리 이름 가져오기
	@Override
	public String categoryNameForStudyHome(int cate_no) {
		String cateName = null;
		
		try {
			cateName = sqlSession.selectOne(NAMESPACE+"categoryListForHome", cate_no);
		} catch (Exception e) {
			System.out.println("[ERROR]: categoryNameForStudyHome");
			e.printStackTrace();
		}
		
		return cateName;
	}

	@Override
	public Map<Integer, String> selectCategoryOfStudy(int cate_no) {
		Map<Integer, String> cate_Name = new HashMap<Integer, String>();
		String name = "";
		
		try {
			name = sqlSession.selectOne(NAMESPACE+"categoryListForHome", cate_no);
			cate_Name.put(cate_no, name);
		} catch (Exception e) {
			System.out.println("[ERROR] : categoryListForHome");
			e.printStackTrace();
		}
		return cate_Name;
	}

}
