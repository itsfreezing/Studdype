package com.studdype.test.model.dao.location;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.location.LocationSiDto;

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

	@Override
	public Map<Integer, String> selectSiForMainPage(List<LocationSiDto> list) {
		Map<Integer, String> selectSiForMainMap = new HashMap<Integer, String>();
		String  siName = null;
		int siNo = 0;
		for(int i=0; i<list.size(); i++) {
			siNo = list.get(i).getSi_no();
			try {
				siName = sqlSession.selectOne(NAMESPACE+"selectSiForMainPage", siNo);
			}catch(Exception e) {
					System.out.println("에러: 시 맵에 넣기");
					e.printStackTrace();
				}
			selectSiForMainMap.put(list.get(i).getSi_no(), siName);
			}
		
		return selectSiForMainMap;
	}

}
