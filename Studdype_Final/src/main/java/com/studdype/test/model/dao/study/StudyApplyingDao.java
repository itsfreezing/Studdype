package com.studdype.test.model.dao.study;

import java.util.List;
import java.util.Map;

import com.studdype.test.model.dto.study.StudyApplyingDto;

public interface StudyApplyingDao {
	String NAMESPACE="studyapplying.";
	
	public List<StudyApplyingDto> studyApplyingList(int mem_no);

	public StudyApplyingDto selectOneByMno(int mem_no);
	public int receiveagree(StudyApplyingDto dto); //마이페이지 received 수락 클릭시
	public List<StudyApplyingDto> snoList(int s_no);
	public int receivereject(StudyApplyingDto dto); // 마이페이지 received 거절 클릭시
	public int receivedelete(StudyApplyingDto dto); // 마이페이지 신청내역 삭제
	public int insertStudyMember(StudyApplyingDto dto); // 스터디 가입신청
}
