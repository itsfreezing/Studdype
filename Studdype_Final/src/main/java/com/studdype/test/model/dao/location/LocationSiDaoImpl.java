package com.studdype.test.model.dao.location;

import java.util.ArrayList;
import java.util.List;

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

}
