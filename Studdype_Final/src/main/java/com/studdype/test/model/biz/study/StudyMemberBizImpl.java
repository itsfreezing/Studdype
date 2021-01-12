package com.studdype.test.model.biz.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studdype.test.model.dao.study.StudyMemberDao;
import com.studdype.test.model.dto.study.StudyMemberDto;

@Service
public class StudyMemberBizImpl implements StudyMemberBiz{
	@Autowired
	private StudyMemberDao studyMemberDao;
	
	
	//스터디 번호로 가입된 스터디 멤버번호 가져오기
	@Override
	public List<StudyMemberDto> StudyMemberList(int s_no) {
		
		return  studyMemberDao.StudyMemberList(s_no);
	}

	
	//멤버 번호로 가입된 스터디번호 가져오기
	@Override
	public List<StudyMemberDto> StudyList(int mem_no) {
		
		return studyMemberDao.StudyList(mem_no);
	}

}
