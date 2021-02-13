package com.studdype.test.model.biz.study;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.common.FileHandler;
import com.studdype.test.common.SearchPagination;
import com.studdype.test.model.dao.board.book.BookDao;
import com.studdype.test.model.dao.board.data.DataFileDao;
import com.studdype.test.model.dao.board.notice.NoticeBoardDao;
import com.studdype.test.model.dao.category.StudyCateDao;
import com.studdype.test.model.dao.location.LocationGuDao;
import com.studdype.test.model.dao.location.LocationSiDao;
import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dao.study.StudyDao;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.location.LocationGuDto;
import com.studdype.test.model.dto.location.LocationSiDto;
import com.studdype.test.model.dto.study.StudyCategoryDto;
import com.studdype.test.model.dto.study.StudyDto;

@Service
public class StudyBizImpl implements StudyBiz{
	
	@Autowired
	private StudyDao study_Dao;
	
	@Autowired
	private LocationSiDao locationSidao;
	
	@Autowired
	private LocationGuDao locationGudao;
	
	@Autowired
	private StudyCateDao studyCatedao;
	
	@Autowired
	private DataFileDao dataFiledao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private NoticeBoardDao noticeDao;
	
	@Autowired
	private BookDao bookDao;
	
	@Autowired
	private StudyCateDao studyCateDao;
	
	private FileHandler fileHandler = new FileHandler();
	
	//메인페이지 스터디 list
	@Override
	public List<StudyDto> studyList(SearchPagination searchPagination) {
		return study_Dao.studyList(searchPagination);
	}

	//스터디 번호로 selectOne
	@Override
	public StudyDto selectOneBySno(int s_no) {
		return study_Dao.selectOneBySno(s_no);
	}
	
	// 지역 (시) selectList
	@Override
	public List<LocationSiDto> locationSiList() {
		return locationSidao.locationSiList();
	}
	
	// 지역 (구/군) selectList
	@Override
	public List<LocationGuDto> locationGuList() {
		return locationGudao.locationGuList();
	}
	
	//시 번호로 selectOne
	@Override
	public List<StudyCategoryDto> categoryList() {
		return studyCatedao.categoryList();

	}
	
	// 스터디 insert (파일 미등록 시)
	@Override
	@Transactional
	public int insertStudy(StudyDto dto, MultipartFile[] mfileList, String path, List<FileDto> fileList) {
		int res = 0; // 스터디생성 후 파일 저장 결과 
		int insertRes = 0; // 스터디 생성 결과 
		int basicPhoto = 0;
		
		if(mfileList == null) {
			basicPhoto = 1;
		}
		
		insertRes = study_Dao.insertStudy(dto);
		System.out.println();
		System.out.println("mfileList: "+mfileList+" path: "+path+" fileList:"+fileList);
		// 실행 성공 시 실제 파일 저장
		if(insertRes == 1 && basicPhoto == 0) {
			res = 1;
			fileHandler.writeFile(mfileList[0], path, fileList.get(0).getF_url());
		}else {
			res = insertRes;
		}
		
		return res;
	}
	
	//리더이름 selectOne
	@Override
	public Map<Integer, String> selectLeaderNameByMainPage(List<StudyDto> studyList) {
		return memberDao.selectLeaderNameByMainPage(studyList);
	}
	
	//구 번호로 selectOne
	@Override
	public Map<Integer, String> selectGuForMainPage(List<StudyDto> studyList) {
		return locationGudao.selectGuForMainPage(studyList);
	}
	
	//시 번호로 selectOne
	@Override
	public Map<Integer, String> selectSiForMainPage(List<StudyDto> studyList) {
		return locationSidao.selectSiForMainPage(studyList);
	}
	
	//카테고리 번호로 selectOne
	@Override
	public Map<Integer, String> categoryListForHome(List<StudyDto> studyList) {
		return studyCatedao.categoryListForHome(studyList);
	}
	
	//메인페이지 리스트 갯수
	@Override
	public int selectTotalStudyListNum(SearchPagination searchPagination) {
		return study_Dao.selectTotalStudyListNum(searchPagination);
	}
	//스터디 팀장 번호로 스터디 리스트 가지고오기 
	@Override
	public List<StudyDto> studyLeader(int leader_no) {
		
		return study_Dao.studyLeader(leader_no);
	}
	
	@Override
	public int newLeader(StudyDto dto) {
		
		return study_Dao.newLeader(dto);
	}
	@Transactional
	@Override
	public int newInfo(StudyDto dto,MultipartFile[] mfileList, String path, List<FileDto> fileList) {
		int res = 0;
		int insertRes = 0;
		int basicPhoto = 0;
		System.out.println(dto);
		
		if(mfileList == null) {
			basicPhoto = 1;
		}
		insertRes = study_Dao.newInfo(dto);
		
		if(insertRes == 1 && basicPhoto == 0) {
			res = 1;
			fileHandler.writeFile(mfileList[0], path, fileList.get(0).getF_url());
			System.out.println("mfileList :"+mfileList[0]);
		}else {
			res = insertRes;
		}
		
		
		return res;
	}
	public Map<Integer, String> selectLocationSiOfStudy(int si_no) {

		return locationSidao.selectLocationSiOfStudy(si_no);
	}

	@Override
	public Map<Integer, String> selectLocationGuOfStudy(int gu_no) {
		return locationGudao.selectLocationGuOfStudy(gu_no);
	}

	@Override
	public Map<Integer, String> selectCategoryOfStudy(int cate_no) {
		return studyCateDao.selectCategoryOfStudy(cate_no);
	}

	@Override
	public String categoryNameForStudyHome(int cate_no) {
		return studyCatedao.categoryNameForStudyHome(cate_no);

	}

	@Override
	public String leaderNameForStudyHome(int leader_no) {
		return memberDao.leaderNameForStudyHome(leader_no);
	}

	// [studyHome] 구 번호로 구 이름 가져오기
	@Override
	public String guNameForStudyHome(int gu_no) {
		return locationGudao.selectGuForStudyHome(gu_no);
	}

	// [studyHome] 시 번호로 시 이름 가져오기
	@Override
	public String siNameForStudyHome(int si_no) {
		return locationSidao.selectSiForStudyHome(si_no);
	}

	// [studyHome] 공지사항 게시글 리스트 가져오기
	@Override
	public List<BoardDto> selectNoticeBoard(int s_no) {
		return noticeDao.selectNoticeBoard(s_no);
	}

	@Override

	public Map<Integer,String> selectStudyName(int[] s_no) {
		return study_Dao.selectStudyName(s_no);
	}

	public List<StudyDto> studyListCategory(SearchPagination searchPagination) {
		return study_Dao.studyListCategory(searchPagination);
	}

	//지역별 검색 
	@Override
	public List<StudyDto> studyListLocation(SearchPagination searchPagination) {
		return study_Dao.studyListLocation(searchPagination);
	}
	
	
	// [studyHome] 공지사항 게시글 리스트 최신글 3개 가져오기
	@Override
	public List<BoardDto> recentListForStudyHome(int s_no) {
		return noticeDao.recentListForStudyHome(s_no);
	}

	@Override
	public int nomalStudyImg(StudyDto dto) {
		
		return study_Dao.nomalStudyImg(dto);
	}

	@Override
	public Map<Integer, String> selectOneGuno(int gu_no) {
		return locationGudao.selectLocationGuOfStudy(gu_no);
	}

	@Override
	public Map<Integer, String> selectOneSino(int si_no) {
		return locationSidao.selectLocationSiOfStudy(si_no);
	}


}
