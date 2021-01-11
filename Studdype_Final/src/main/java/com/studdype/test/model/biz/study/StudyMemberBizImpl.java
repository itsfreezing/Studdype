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
	
	
	@Override
	public List<StudyMemberDto> StudyMemberList(int s_no) {
		
		return  studyMemberDao.StudyMemberList(s_no);
	}

}
