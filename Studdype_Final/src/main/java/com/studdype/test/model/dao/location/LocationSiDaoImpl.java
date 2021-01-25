package com.studdype.test.model.dao.location;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.location.LocationSiDto;
import com.studdype.test.model.dto.study.StudyDto;

@Repository
public class LocationSiDaoImpl implements LocationSiDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<LocationSiDto> locationSiList() {
		List<LocationSiDto> list = new ArrayList<LocationSiDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"locationSiList");
		} catch (Exception e) {
			System.out.println("[ERROR] : locationSiList");
			e.printStackTrace();
		}
		return list;
	}
	
	//메인페이지 리스트 넘기기
	@Override
	public Map<Integer, String> selectSiForMainPage(List<StudyDto> studyList) {
		Map<Integer, String> selectSiForMainMap = new HashMap<Integer, String>();
		String  siName = null;
		int siNo = 0;
		for(int i=0; i<studyList.size(); i++) {
			siNo = studyList.get(i).getSi_no();
			try {
				siName = sqlSession.selectOne(NAMESPACE+"selectSiForMainPage", siNo);
			}catch(Exception e) {
					System.out.println("에러: 시 맵에 넣기");
					e.printStackTrace();
				}
			selectSiForMainMap.put(studyList.get(i).getSi_no(), siName);
			}
		
		return selectSiForMainMap;
	}
	
	// [studyHome] 시 번호로 시 이름 가져오기
	@Override
	public String selectSiForStudyHome(int si_no) {
		String siName = null;
		
		try {
			siName = sqlSession.selectOne(NAMESPACE+"selectSiForMainPage", si_no);
		} catch (Exception e) {
			System.out.println("[ERROR]: selectSiForStudyHome");
			e.printStackTrace();
		}
		
		return siName;
	}



}
