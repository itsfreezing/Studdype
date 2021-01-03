package com.studdype.test.model.dao.location;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.location.LocationSiDto;

public interface LocationSiDao {
	//지역 시 
	String NAMESPACE="locsi.";
	
	public List<LocationSiDto> locationSiList();
	public Map<Integer, String> selectSiForMainPage(List<LocationSiDto> list);
}
