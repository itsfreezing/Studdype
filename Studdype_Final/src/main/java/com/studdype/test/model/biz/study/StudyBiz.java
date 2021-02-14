package com.studdype.test.model.biz.study;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.common.SearchPagination;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.location.LocationGuDto;
import com.studdype.test.model.dto.location.LocationSiDto;
import com.studdype.test.model.dto.study.StudyCategoryDto;
import com.studdype.test.model.dto.study.StudyDto;

@Service
public interface StudyBiz {
	
	public List<StudyDto> studyList(SearchPagination searchPagination);	//스터디 리스트
	public StudyDto selectOneBySno(int s_no);  //스터디 번호로 selectOne
	public List<LocationSiDto> locationSiList(); // 지역 (시) selectList
	public List<LocationGuDto> locationGuList(); // 지역(구/군) selectList
	public List<StudyCategoryDto> categoryList(); // 카테고리 selectList
	public List<StudyDto> studyListCategory(SearchPagination searchPagination);
	public int insertStudy(StudyDto studyDto, MultipartFile[] mfileList, String path, List<FileDto> fileList); // [스터디 생성] 스터디 insert
	public Map<Integer, String> selectLeaderNameByMainPage(List<StudyDto> studyList); //리더이름 가져오기
	public Map<Integer, String> selectGuForMainPage(List<StudyDto> studyList); //구이름 가져오기
	public Map<Integer, String> selectSiForMainPage(List<StudyDto> studyList); //시이름 가져오기
	public Map<Integer, String> categoryListForHome(List<StudyDto> studyList); //카테고리 가져오기 
	public int selectTotalStudyListNum(SearchPagination searchPagination); //메인페이지 리스트 개수
	public List<StudyDto> studyLeader(int leader_no);
	public int newLeader(StudyDto dto); //스터디관리 리더변경 
	public int newInfo(StudyDto dto,MultipartFile[] mfileList, String path, List<FileDto> fileList); // 스터디관리 스터디 소개변경
	public String categoryNameForStudyHome(int cate_no); // [studyHome] 카테고리 번호로 카테고리 이름 가져오기
	public String leaderNameForStudyHome(int leader_no); // [studyHome] 리더 번호로 리더 이름 가져오기
	public String guNameForStudyHome(int gu_no); // [studyHome] 구 번호로 구 이름 가져오기
	public String siNameForStudyHome(int si_no); // [studyHome] 시 번호로 시 이름 가져오기
	public List<BoardDto> selectNoticeBoard(int s_no); // [studyHome] 공지사항 게시글 리스트 가져오기
	public List<BoardDto> recentListForStudyHome(int s_no); // [studyHome] 공지사항 게시글 리스트 최신글 3개 가져오기
	public Map<Integer, String> selectLocationSiOfStudy(int si_no);	// 시 이름 가져오기
	public Map<Integer, String> selectLocationGuOfStudy(int gu_no);	// 구 이름 가져오기
	public Map<Integer, String> selectCategoryOfStudy(int cate_no);	// 스터디 카테고리 이름 가져오기
	public int nomalStudyImg(StudyDto dto);
	public Map<Integer,String> selectStudyName(int[] s_no);
	public List<StudyDto> studyListLocation(SearchPagination searchPagination);//지역별 검색
	public Map<Integer, String> selectOneGuno(int gu_no);
	public Map<Integer, String> selectOneSino(int si_no);
	public int pluscurrent(StudyDto dto); //스터디 가입시 스터디 현재인원 증가 
	public int deletestudy(StudyDto dto); // 스터디 삭제 
}
