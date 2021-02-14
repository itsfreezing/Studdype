package com.studdype.test.model.dao.study;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.common.SearchPagination;
import com.studdype.test.model.dto.location.LocationGuDto;
import com.studdype.test.model.dto.location.LocationSiDto;
import com.studdype.test.model.dto.study.StudyDto;

@Repository
public class StudyDaoImpl implements StudyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//스터디 list 전체 가져오기
	@Override
	public List<StudyDto> studyList(SearchPagination searchPagination) {

		List<StudyDto> studyList = null;
		
		try {
			studyList = sqlSession.selectList(NAMESPACE + "studyList", searchPagination);
		} catch (Exception e) {
			System.out.println("에러 발생: studyDao - selectList");
			e.printStackTrace();
		}

		return studyList;
	}

	//스터디 번호로 selectOne
	@Override
	public StudyDto selectOneBySno(int s_no) {
		StudyDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectOneBySno", s_no);
		} catch (Exception e) {
			System.out.println("[ERROR]: selectOneBySno");
			e.printStackTrace();
		}
		return res;
	}

	// 스터디 insert 
	@Override
	public int insertStudy(StudyDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertStudy", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] : insertStudy");
			e.printStackTrace();
		}
		
		return res;
	}
	
	//스터디 리스트 총 갯수
	@Override
	public int selectTotalStudyListNum(SearchPagination searchPagination) {
		int totalListNum = 0;
		try {
			totalListNum = sqlSession.selectOne(NAMESPACE+"selectTotalStudyListNum", searchPagination);
		}catch(Exception e) {
			System.out.println("에러: 스터디 리스트 총 갯수");
			e.printStackTrace();
		}
		
		return totalListNum;
	}

	@Override
	public List<StudyDto> studyLeader(int leader_no) {
		List<StudyDto> list = new ArrayList<StudyDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"studyLeader",leader_no);
		} catch (Exception e) {
			System.out.println("ERROR:studyLeader");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int newLeader(StudyDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE+"newLeader",dto);
		} catch (Exception e) {
			System.out.println("ERROR: newLeader!!!!!!!!!!!!!!");
			e.printStackTrace();
		}
		return res;
	}



	@Override
	public int newInfo(StudyDto dto) {
		int res = 0;
		
		try {
			res= sqlSession.update(NAMESPACE+"newInfo",dto);
		} catch (Exception e) {
			System.out.println("ERROR: newInfo!!!!!!!!!!!!!!");
			e.printStackTrace();
		}
		return res;
	}



	@Override
	public List<StudyDto> studyListCategory(SearchPagination searchPagination) {
		List<StudyDto> res = null;
		
		try {
			res = sqlSession.selectList(NAMESPACE+"studyListCategory", searchPagination);
		} catch (Exception e) {
			System.out.println("에러 카테고리 스터디 리스트");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<StudyDto> selectStudyByCategory(int cate_no) {
		List<StudyDto> res = null;
		
		try {
			res = sqlSession.selectList(NAMESPACE+"selectStudyByCategory", cate_no);
		} catch (Exception e) {
			System.out.println("에러 북");
			e.printStackTrace();
		}
		return res;
	}


	@Override
	public Map<Integer, String> selectStudyName(int[] s_no) {
		Map<Integer,String> map = new HashMap<Integer,String>();
		String name = null;
		try {
			for(int i=0; i<s_no.length;i++) {
		   
			name = sqlSession.selectOne(NAMESPACE+"selectStudyName",s_no[i]);
			map.put(s_no[i],name);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public List<StudyDto> studyListLocation(SearchPagination searchPagination) {
		List<StudyDto>res=null;
		
		try {
			res=sqlSession.selectList(NAMESPACE+"studyListLocation",searchPagination);
		} catch (Exception e) {
			System.out.println("[ERROR]:studyListLocationError");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int nomalStudyImg(StudyDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"nomalStudyImg",dto);
		} catch (Exception e) {
			System.out.println("ERROR !!!!!!!!");
			e.printStackTrace();
		}
		
		
		return res;
	}

	//지역별 검색 시 번호 받기
	@Override
	public Map<Integer, String> selectStudyByLocation(int si_no) {
		Map<Integer, String> res=new HashMap<Integer,String>();
		try {
			res=sqlSession.selectOne(NAMESPACE+"selectOneSi",si_no);
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		return res;
	}

	//지역별 검색 구 번호 받기
	@Override
	public Map<Integer, String> selectByLocation(int gu_no) {
		Map<Integer, String> res= new HashMap<Integer,String>();
		
		try {
			res=sqlSession.selectOne(NAMESPACE+"selectOneGu",gu_no);
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int pluscurrent(StudyDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"pluscurrent",dto);
		} catch (Exception e) {
			System.out.println("현재인원 오류");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deletestudy(StudyDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"deletestudy",dto);
		} catch (Exception e) {
			System.out.println("스터디 삭제 오류");
			e.printStackTrace();
		}
				
		return res;
	}

	@Override
	public int deletecurrent(StudyDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"deletecurrent",dto);
		} catch (Exception e) {
			System.out.println("ERORR: DELETECURRENT");
			e.printStackTrace();
		}
		return res;
	}


}


