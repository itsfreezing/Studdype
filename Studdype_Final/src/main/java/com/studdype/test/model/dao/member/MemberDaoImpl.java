package com.studdype.test.model.dao.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.member.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//멤버번호로 하나 셀렉트
	@Override
	public MemberDto selectOne(int mem_no) {
		MemberDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectOne", mem_no);
		} catch (Exception e) {
			System.out.println("[ERROR]: selectOne");
			e.printStackTrace();
		}
		
		return res;
	}

	//[자유게시판]리스트로 작성자 이름 가져오기
	@Override
	public Map<Integer, String> selectWriterByFreeList(List<BoardDto> list) {
		Map<Integer, String> resMap = new HashMap<Integer, String>();
		String writer = null;
		int writerNo = 0;
		for(int i = 0; i < list.size(); i++) {
			writerNo = list.get(i).getB_writer();
			try {
				writer = sqlSession.selectOne(NAMESPACE+"selectNameByNo", writerNo);
			} catch (Exception e) {
				System.out.println("[ERROR]: selectWriterByFreeList !!!!!!");
				e.printStackTrace();
			}
			resMap.put(list.get(i).getB_no(), writer);
		}
		
		return resMap;
	}

	//멤버번호로 이름 가져오기
	@Override
	public String selectNameByNo(int mem_no) {
		String name = null;
		
		try {
			name= sqlSession.selectOne(NAMESPACE+"selectNameByNo", mem_no);
		} catch (Exception e) {
			System.out.println("[ERROR]: selectNameByNO!");
			e.printStackTrace();
		}
				
		return name;
	}

}
