package com.studdype.test.model.dao.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.study.StudyDto;

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
				writer = sqlSession.selectOne(NAMESPACE+"selectWriterByFreeList", writerNo);
			} catch (Exception e) {
				System.out.println("[ERROR]: selectWriterByFreeList !!!!!!");
				e.printStackTrace();
			}
			resMap.put(list.get(i).getB_no(), writer);
		}
		
		return resMap;
	}

	@Override
	public Map<Integer, String> selectLeaderNameByMainPage(List<StudyDto> list) {
		Map<Integer, String> studyMainMap = new HashMap<Integer, String>();
		String  leaderName = null;
		int leaderNo = 0;
		for(int i=0; i<list.size(); i++) {
			leaderNo = list.get(i).getLeader_no();
			try {
				leaderName = sqlSession.selectOne(NAMESPACE+"selectLeaderNameByMainPage", leaderNo);
			}catch(Exception e) {
					System.out.println("에러: 메인페이지 리더이름 불러오기");
					e.printStackTrace();
				}
				studyMainMap.put(list.get(i).getS_no(), leaderName);
			}
		
		return studyMainMap;
	}

}
