package com.studdype.test.model.dao.board.meet;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.MeetDto;

@Repository
public class MeetBoardDaoImpl implements MeetBoardDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MeetDto> meet_selectList() {
		List<MeetDto> meet_list = new ArrayList<MeetDto>();
		
		try {
			meet_list = sqlSession.selectList(NAMESPACE+"meet_selectList");
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET DAO selectList ---------- [ERROR]");
			e.printStackTrace();
		}
		
		return meet_list;
	}

	@Override
	public MeetDto meet_selectOne(int meet_no) {
		return null;
	}

	@Override
	public int meet_insert(MeetDto meet_dto) {
		return 0;
	}

	@Override
	public int meet_update(MeetDto meet_dto) {
		return 0;
	}

	@Override
	public int meet_delete(int meet_no) {
		return 0;
	}

}
