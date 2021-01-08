package com.studdype.test.model.dao.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.BookDto;
import com.studdype.test.model.dto.board.ReplyDto;
import com.studdype.test.model.dto.board.MeetDto;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.study.StudyDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//로그인
	@Override
	public MemberDto login(MemberDto dto) {
		MemberDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"login",dto);
		}catch (Exception e) {
			System.out.println("[ERROR]:login");
		}
		return res;
	}

	//로그아웃
	@Override
	public String logout(HttpSession session) {
		return null;
	}
	
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

	//스터디 메인페이지 리스트에 작성자이름 가져오기
	@Override
	public Map<Integer, String> selectLeaderNameByMainPage(List<StudyDto> studyList) {
		Map<Integer, String> studyMainMap = new HashMap<Integer, String>();
		String  leaderName = null;
		int writerNo = 0;
		for(int i=0; i<studyList.size(); i++) {
			writerNo = studyList.get(i).getLeader_no();
			try {
				leaderName = sqlSession.selectOne(NAMESPACE+"selectNameByNo", writerNo);
			}catch(Exception e) {
					System.out.println("에러: 메인페이지 리더이름 불러오기");
					e.printStackTrace();
				}
				studyMainMap.put(studyList.get(i).getLeader_no(), leaderName);
			}
		return studyMainMap;
	}
	
	// [모임 게시판]리스트로 작성자 이름 가져오기
	@Override
	public Map<Integer, String> selectWriterByMeetBoardList(List<MeetDto> list) {
		Map<Integer, String> resMap = new HashMap<Integer, String>();
		String writer = null;
		int writerNo = 0;
		for(int i = 0; i < list.size(); i++) {
			writerNo = list.get(i).getMeet_writer();
			try {
				writer = sqlSession.selectOne(NAMESPACE+"selectNameByNo", writerNo);
			} catch (Exception e) {
				System.out.println("[ERROR] ---------- MEMBER DAO selectWriterByMeetBoardList ---------- [ERROR]");
				e.printStackTrace();
			}
			resMap.put(list.get(i).getMeet_no(), writer);
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
	
	//회원가입
	@Override
	public int memberInsert(MemberDto dto) {
		int res=0;
		System.out.println(dto.getMem_id());
		try {
			res=sqlSession.insert(NAMESPACE+"insert",dto);
			
		} catch (Exception e) {
			System.out.println("[error]:insert");
			e.printStackTrace();
		}

		return res;
	}

	//[자유게시판]게시판 리스트로 member리스트 받아서 map에 넣기
	@Override
	public Map<Integer, MemberDto> selectMemberByFreeList(List<BoardDto> list) {
		Map<Integer, MemberDto> resMap =  new HashMap<Integer, MemberDto>();
		MemberDto dto = null;
		int mem_no = 0;
		for(int i = 0; i < list.size(); i++) {
			mem_no = list.get(i).getB_writer();
			try {
				dto = sqlSession.selectOne(NAMESPACE+"selectOne", mem_no);
			} catch (Exception e) {
				System.out.println("[ERROR]:  selectMemberByFreeList( !!!!!!");
				e.printStackTrace();
			}
			resMap.put(list.get(i).getB_no(), dto);
		}
		
		return resMap;
	}

	//[자유게시판 댓글]  리스트로 member 정보 가져오기 
	@Override
	public Map<Integer, MemberDto> selectMemberByFreeReply(List<ReplyDto> replyList) {
		Map<Integer, MemberDto> resMap =  new HashMap<Integer, MemberDto>();
		MemberDto dto = null;
		int mem_no = 0;
		for(int i = 0; i < replyList.size(); i++) {
			mem_no = replyList.get(i).getR_writer();
			try {
				dto = sqlSession.selectOne(NAMESPACE+"selectOne", mem_no);
			} catch (Exception e) {
				System.out.println("[ERROR]: selectMemberByFreeReply !!!!!!");
				e.printStackTrace();
			}
			resMap.put(replyList.get(i).getR_no(), dto);
		}
		
		return resMap;
	}

	// [도서 게시판] 리스트로 작성자 이름 가져오기
	@Override
	public Map<Integer, Map<String, String>> selectWriterByBookList(List<BookDto> bookList) {
		Map<Integer, Map<String, String>> bookMap = new HashMap<Integer, Map<String, String>>();
		Map<String, String> memberInfo = new HashMap<String, String>();
		int mem_no;
		
		for(int i = 0; i <bookList.size(); i++) {
			mem_no = bookList.get(i).getB_writer();
			MemberDto dto = new MemberDto();
			try {
				dto = sqlSession.selectOne(NAMESPACE+"selectWriterByBookList", mem_no);
				memberInfo.put(dto.getMem_id(), dto.getMem_name());
			} catch (Exception e) {
				System.out.println("[ERROR] : selectWriterByBookList"+i+"번째 실행");
				e.printStackTrace();
			}
			bookMap.put(mem_no, memberInfo);
		}
		
		return bookMap;
	}

}
