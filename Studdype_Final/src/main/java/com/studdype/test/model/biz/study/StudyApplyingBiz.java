package com.studdype.test.model.biz.study;

import java.util.List;

import org.springframework.stereotype.Service;

import com.studdype.test.model.dto.study.StudyApplyingDto;

@Service
public interface StudyApplyingBiz {
	public List<StudyApplyingDto> studyApplyingList(int mem_no);
	public StudyApplyingDto selectOneByMno(int mem_no);
	public int receiveagree(StudyApplyingDto dto); // 마이페이지 received 수락클릭시
	public List<StudyApplyingDto> snoList(int s_no);
	public int receivereject(StudyApplyingDto dto); // 마이페이지 received 거절클릭시
	public int receivedelete(StudyApplyingDto dto); // 마이페이지 recevie 내역 삭제 
	public int insertStudyMember(StudyApplyingDto dto); // 스터디 가입신청

}
