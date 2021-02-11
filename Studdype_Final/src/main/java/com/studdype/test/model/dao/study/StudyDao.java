package com.studdype.test.model.dao.study;

import java.util.List;
import java.util.Map;

import com.studdype.test.common.SearchPagination;
import com.studdype.test.model.dto.study.StudyDto;

public interface StudyDao {
		String NAMESPACE="study.";
	
	//메소드
	public List<StudyDto> studyList(SearchPagination searchPagination); //메인페이지 리스트
	public StudyDto selectOneBySno(int s_no); //스터디 번호로 selectOne
	public int insertStudy(StudyDto studyDto); //[스터디 생성] 스터디 insert
	public int selectTotalStudyListNum(SearchPagination searchPagination); //리스트 총 갯수
	public List<StudyDto> studyLeader(int leader_no); //스터디 리더 

	public int newLeader(StudyDto dto); //스터디관리 스터디리더 변경
	public int newInfo(StudyDto dto); //스터디관리 스터디 정보 변경

	public List<StudyDto> studyListCategory(SearchPagination searchPagination); // 카테고리 번호로 스터디 정보 가져오기
	public List<StudyDto> selectStudyByCategory(int cate_no); // 카테고리 번호로 스터디 정보 가져오기
	public Map<Integer,String> selectStudyName(int[] s_no); //스터디 번호에 맞는 스터디 이름가져오기 
	public int nomalStudyImg(StudyDto dto); 


	public List<StudyDto>selectStudyByLocation(int gu_no);//지역 시와 구 스터디 검색
	public List<StudyDto> studyListLocation(SearchPagination searchPagination);

}

