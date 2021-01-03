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
	
	// 모임 게시판 리스트
	@Override
	public List<MeetDto> meetBoardSelectList() {
		List<MeetDto> list = new ArrayList<MeetDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"meetBoardSelectList"); // NAMESPACE: dao의 nameSpace
		} catch (Exception e) {
			System.out.println("[ERROR] ---------- MEET DAO selectList ---------- [ERROR]");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public MeetDto meetBoardSelectOne(int meet_no) {
		return null;
	}

	@Override
	public int meetBoardInsert(MeetDto dto) {
		return 0;
	}

	@Override
	public int meetBoardUpdate(MeetDto dto) {
		return 0;
	}

	@Override
	public int meetBoardDelete(int meet_no) {
		return 0;
	}

}
