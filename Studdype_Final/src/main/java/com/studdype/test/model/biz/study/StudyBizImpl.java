package com.studdype.test.model.biz.study;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studdype.test.model.dao.board.dataFile.DataFileDao;
import com.studdype.test.model.dao.category.StudyCateDao;
import com.studdype.test.model.dao.location.LocationGuDao;
import com.studdype.test.model.dao.location.LocationSiDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dao.study.StudyDao;
import com.studdype.test.model.dto.location.LocationGuDto;
import com.studdype.test.model.dto.location.LocationSiDto;
import com.studdype.test.model.dto.study.StudyCategoryDto;
import com.studdype.test.model.dto.study.StudyDto;

@Service
public class StudyBizImpl implements StudyBiz{
	
	@Autowired
	private StudyDao study_Dao;
	
	@Autowired
	private LocationSiDao locationSidao;
	
	@Autowired
	private LocationGuDao locationGudao;
	
	@Autowired
	private StudyCateDao studyCatedao;
	
	@Autowired
	private DataFileDao dataFiledao;

	private MemberDao memberDao;
	
	//메인페이지 스터디 list
	@Override
	public List<StudyDto> studyList() {
		return study_Dao.studyList();
	}

	//스터디 번호로 selectOne
	@Override
	public StudyDto selectOneBySno(int s_no) {
		return study_Dao.selectOneBySno(s_no);
	}
	// 지역 (시) selectList

	@Override
	public List<LocationSiDto> locationSiList() {
		return locationSidao.locationSiList();
	}
	// 지역 (구/군) selectList
	@Override
	public List<LocationGuDto> locationGuList() {
		return locationGudao.locationGuList();
	}
	
	//시 번호로 selectOne
	@Override
	public List<StudyCategoryDto> categoryList() {
		return studyCatedao.categoryList();

	}

	// 스터디 insert
	@Override
	public int insertStudy(StudyDto dto) {
		return study_Dao.insertStudy(dto);
	}

	// 등록된 스터디 마지막 번호
	@Override
	public int selectStudyFinalNumber() {
		return study_Dao.selectStudyFinalNumber();
	}

	@Override
	public Map<Integer, String> selectLeaderNameByMainPage(List<StudyDto> studyList) {
		return memberDao.selectLeaderNameByMainPage(studyList);
	}
	
	//구 번호로 selectOne
	@Override
	public Map<Integer, String> selectGuForMainPage(List<StudyDto> studyList) {
		return locationGudao.selectGuForMainPage(studyList);
	}
	
	//시 번호로 selectOne
	@Override
	public Map<Integer, String> selectSiForMainPage(List<StudyDto> studyList) {
		return locationSidao.selectSiForMainPage(studyList);
	}
	
	//카테고리 번호로 selectOne
	@Override
	public Map<Integer, String> categoryListForHome(List<StudyDto> studyList) {
		return studyCatedao.categoryListForHome(studyList);
	}
}
