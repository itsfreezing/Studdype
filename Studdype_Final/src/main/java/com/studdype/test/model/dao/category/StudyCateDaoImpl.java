package com.studdype.test.model.dao.category;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.study.StudyCategoryDto;

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

}
