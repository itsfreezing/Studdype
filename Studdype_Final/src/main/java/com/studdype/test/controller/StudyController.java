package com.studdype.test.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.common.FileHandler;
import com.studdype.test.common.PageMaker;
import com.studdype.test.common.SearchPagination;
import com.studdype.test.common.UploadFile;
import com.studdype.test.model.biz.board.BookBiz;
import com.studdype.test.model.biz.member.MemberBiz;
import com.studdype.test.model.biz.study.StudyApplyingBiz;
import com.studdype.test.model.biz.study.StudyBiz;
import com.studdype.test.model.biz.study.StudyMemberBiz;
import com.studdype.test.model.dto.board.BookDto;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.location.LocationGuDto;
import com.studdype.test.model.dto.location.LocationSiDto;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.study.StudyApplyingDto;
import com.studdype.test.model.dto.study.StudyCategoryDto;
import com.studdype.test.model.dto.study.StudyDto;
import com.studdype.test.model.dto.study.StudyMemberDto;

@Controller
public class StudyController {

	private static final Logger logger = LoggerFactory.getLogger(StudyController.class);
	private final static int pageSize = 15; // 한페이지에 보여줄 개수
	private final static int pageGroupSize = 5; // 페이지 그룹 사이즈
	@Autowired
	private StudyBiz studyBiz;
	@Autowired
	private MemberBiz memberBiz;
	@Autowired
	private BookBiz bookBiz;
	@Autowired
	private StudyMemberBiz StudyMemberBiz;
	@Autowired
	private StudyApplyingBiz studyApplyingBiz;
	
	private FileHandler fileHandler = new FileHandler(); // 스터디 대표사진 관련 파일 핸들러
	@RequestMapping(value = "/studyList.do", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("searchPagination") SearchPagination searchPagination, HttpSession session, StudyDto studyDto) {

		Map<Integer, String> studyMainLeaderNameMap = null; // 리더이름을 담을 MAP 설정
		List<StudyDto> studyList = null; // 스터디 리스트 담을 곳
		Map<Integer, String> selectSiForMainMap = null; // 시 리스트 담을 곳
		Map<Integer, String> selectGuForMainMap = null; // 구 리스트 담을 곳
		Map<Integer, String> selectCateForMainMap = null; // 카테고리 리스트 담을 곳

		// 로그
		logger.info("STUDY - SELECTLIST");

		studyList = studyBiz.studyList(searchPagination); // 스터디 리스트
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPagination(searchPagination);
		pageMaker.setTotalCount(studyBiz.selectTotalStudyListNum(searchPagination));
		selectSiForMainMap = studyBiz.selectSiForMainPage(studyList); // 구 리스트
		selectGuForMainMap = studyBiz.selectGuForMainPage(studyList); // 시 리스트
		studyMainLeaderNameMap = studyBiz.selectLeaderNameByMainPage(studyList); // 리더이름 리스트
		selectCateForMainMap = studyBiz.categoryListForHome(studyList); // 카테고리 리스트
			
		
		for(int i=0; i<studyList.size(); i++) {
				studyList.get(i).setPhoto(fileHandler.getFileName(studyList.get(i).getPhoto(), "Studdype_Final"));
		}
			
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("studyList", studyList);
		model.addAttribute("leaderName", studyMainLeaderNameMap);
		model.addAttribute("siList", selectSiForMainMap);
		model.addAttribute("guList", selectGuForMainMap);
		model.addAttribute("cateList", selectCateForMainMap);
		session.setAttribute("headerMenu", "home");

		return "studdype/studdypeHome";
	}
	

	
	// 스터디 생성 폼
	@RequestMapping("/createStuddypeform.do")
	public String createStuddypeForm(Model model,HttpSession session) {
		logger.info("createStuddypeform");
		
		// 로그인 인터셉터 완료 전까지 비로그인 스터디생성 막기
		if(session.getAttribute("login") == null) {
			model.addAttribute("msg", "로그인을 하고 진행주세요.");
			model.addAttribute("url", "studyList.do");
			return "commond/alert";
		}
		
		List<LocationSiDto> sidtos = studyBiz.locationSiList();
		List<LocationGuDto> gudtos = studyBiz.locationGuList();
		List<StudyCategoryDto> catedtos = studyBiz.categoryList();

		model.addAttribute("sidtos", sidtos);
		model.addAttribute("gudtos", gudtos);
		model.addAttribute("catedtos", catedtos);
		session.setAttribute("headerMenu", "create");

		return "studdype/createStuddype";
	}

	// 스터디 생성 후 Stduddypehome으로
	@RequestMapping("createStuddype.do")
	public String createStuddype(HttpServletRequest request, StudyDto studyDto, UploadFile uploadFile, Model model) {
		logger.info("createStuddype");
		int res = 0;
		MultipartFile[] mfileList = null;
		List<FileDto> fileList = null;
		String path = "";
		System.out.println("씨발실마리를찾았다"+request);
		if(studyDto.getPhoto().equals("")) {
			//파일 업로드
			mfileList = uploadFile.getFile();  //multipartFile 리스트 반환해서 생성
			
			// 파일요소들 뽑아서 fileList에 저장
			fileList = fileHandler.getFileList(mfileList, request);//파일리스트 생성
			
			path = fileHandler.getPath(request); //파일이 저장될 가장 기본 폴더
			studyDto.setPhoto(fileList.get(0).getF_url());
		}
		
		res = studyBiz.insertStudy(studyDto, mfileList, path, fileList);
		
		// 성공 시 -> 스터디 커뮤니티 홈
		// 실패 시 -> 스터디 생성 폼
		if (res > 0) {
			model.addAttribute("msg", "스터디 생성 완료");
			model.addAttribute("url", "myPage.do");
			return "commond/alert";
		} else {
			model.addAttribute("msg", "스터디 생성 실패");
			model.addAttribute("url", "createStuddypeform.do");
			return "commond/alert";
		}
	}
	
	// 스터디 관리 페이지 이동
	@RequestMapping("/updateStudy.do")
	public String updateStudy(HttpSession session, Model model,HttpServletRequest request) {
		MemberDto login = (MemberDto)session.getAttribute("login");
		MemberDto dto = memberBiz.selectOne(login.getMem_no());
		List<StudyCategoryDto> category = studyBiz.categoryList();
		List<LocationGuDto> gudto = studyBiz.locationGuList();
		List<LocationSiDto> sidto = studyBiz.locationSiList();
		List<BookDto> bookList = bookBiz.bookList(Integer.parseInt(request.getParameter("s_no")));
		List<StudyDto> LeaderList = studyBiz.studyLeader(login.getMem_no());
		List<StudyMemberDto> memberlist = StudyMemberBiz.StudyMemberList(Integer.parseInt(request.getParameter("s_no")));
		StudyDto img = studyBiz.selectOneBySno(Integer.parseInt(request.getParameter("s_no")));
		List<MemberDto> membername = new ArrayList<MemberDto>();
		for (int i = 0; i < memberlist.size(); i++) {
			
			MemberDto dto2 = memberBiz.selectOne(memberlist.get(i).getMem_no());
			membername.add(dto2);
		}
	
		if(img.getPhoto() == null ) {
			img.setPhoto("no_url_of_photo_from_studyTB"); 
		}
		FileHandler filehandler = new FileHandler();
		String fileName = filehandler.getFileName(img.getPhoto(), "Studdype_Final");
		model.addAttribute("fileName",fileName);
		System.out.println(img.getPhoto());
		model.addAttribute("img",img);

		model.addAttribute("membername", membername);
		model.addAttribute("memberlist", memberlist);
		session.setAttribute("login", dto);
		model.addAttribute("bookList", bookList);
		model.addAttribute("gudto", gudto);
		model.addAttribute("sidto", sidto);
		model.addAttribute("category", category);

		session.setAttribute("leftnavi", "updateStudy");
		
		return "studdype/updateStudy";
	}
	// 스터디 관리 페이지 update버튼 클릭시
	@RequestMapping("studyupdate.do")
	public String studyupdate(HttpServletRequest request,Model model,HttpSession session,UploadFile uploadFile,StudyDto dto) {
		int res = 0;
		MultipartFile[] mfileList = null;
		List<FileDto> fileList = null;
		String path = "";
		
		if(dto.getPhoto().equals("")) {
			//파일 업로드
			mfileList = uploadFile.getFile();  //multipartFile 리스트 반환해서 생성
			
			// 파일요소들 뽑아서 fileList에 저장
			fileList = fileHandler.getFileList(mfileList, request);//파일리스트 생성
			
			path = fileHandler.getPath(request); //파일이 저장될 가장 기본 폴더
			
			dto.setPhoto(fileList.get(0).getF_url());
		}
	
		res = studyBiz.newInfo(dto, mfileList, path, fileList);
		
		
		if (res > 0) {
			model.addAttribute("msg", "수정 완료");
			model.addAttribute("url", "studyList.do");
			return "commond/alert";
		} else {
			model.addAttribute("msg", "수정 실패");
			model.addAttribute("url", "studycommunity.do?s_no="+request.getParameter("s_no"));
			return "commond/alert";
		}
		

	
	}

	
	//스터디관리 멤버관리 대표만 변경할때
	@RequestMapping("/updatelead.do")
	public String updatelead(Model model,HttpServletRequest request) {
		
		StudyDto dto = new StudyDto(Integer.parseInt(request.getParameter("leader_no")),Integer.parseInt(request.getParameter("s_no")));
		int dto2 = studyBiz.newLeader(dto);
		if(dto2>0) {
			model.addAttribute("msg","수정성공!");
			model.addAttribute("url","studycommunity.do?s_no="+request.getParameter("s_no"));
			return "commond/alert";
		}else {
			model.addAttribute("msg","수정실패!");
			model.addAttribute("url","studycommunity.do?s_no="+request.getParameter("s_no"));
			return "commond/alert";
			
		}
		
	}
	//스터디관리 추방, 대표변경 동시
	@RequestMapping("/updateleader.do")
	public String updateleader(Model model,HttpServletRequest request) {
		System.out.println("아니");
		StudyDto dto = new StudyDto(Integer.parseInt(request.getParameter("leader_no")),Integer.parseInt(request.getParameter("s_no")));
		int dto2 = studyBiz.newLeader(dto);
		
		System.out.println(request.getParameter("exile_no"));
		if(request.getParameter("exile_no")==null) {
			if(dto2>0) {
				model.addAttribute("msg","수정성공  !");
				model.addAttribute("url","studycommunity.do?s_no="+request.getParameter("s_no"));
				return "commond/alert";
			}else {
				model.addAttribute("msg"," 수정 실패!");
				model.addAttribute("url","studycommunity.do?s_no="+request.getParameter("s_no"));
				
				
				return "commond/alert";
				
			}
		}else {
			String a = request.getParameter("exile_no");
			String[] array = a.split(",");
		for(int i=0; i<array.length;i++) {
			StudyMemberDto dto3 = new StudyMemberDto(Integer.parseInt(request.getParameter("s_no")),Integer.parseInt(array[i]));
			int res = StudyMemberBiz.deletemember(dto3);
			if(res>0) {
				
			}else {
				model.addAttribute("msg","멤버삭제 실패!");
			}
		}
		}
		
		if(dto2>0) {
			model.addAttribute("msg","수정성공  !");
			model.addAttribute("url","studycommunity.do?s_no="+request.getParameter("s_no"));
			return "commond/alert";
		}else {
			model.addAttribute("msg"," 수정 실패!");
			model.addAttribute("url","studycommunity.do?s_no="+request.getParameter("s_no"));
			
			
			return "commond/alert";
			
		}
	
	}

	
	
	//도서 관리 버튼 클릭시
	@RequestMapping(value="/bookchange.do",method = RequestMethod.GET)
	public String bookchange(Model model,HttpServletRequest request) {
		
		int a = bookBiz.deletebookmain();
		int b = bookBiz.bookmain(Integer.parseInt(request.getParameter("b_no")));
		
		if(a>0) {
			if(b>0) {
				model.addAttribute("msg","수정성공  !");
				model.addAttribute("url","studycommunity.do?s_no="+request.getParameter("s_no"));
				return "commond/alert";
			}else {
				model.addAttribute("msg","수정실패  !");
				model.addAttribute("url","studycommunity.do?s_no="+request.getParameter("s_no"));
				return "commond/alert";
			}
			
		}else {
			if(b>0) {
				model.addAttribute("msg","수정성공  !");
				model.addAttribute("url","studycommunity.do?s_no="+request.getParameter("s_no"));
				return "commond/alert";
			}else {
				model.addAttribute("msg","수정실패  !");
				model.addAttribute("url","studycommunity.do?s_no="+request.getParameter("s_no"));
				return "commond/alert";
			}
		}
	
	
	}
	
	// 스터디 디테일 페이지(스터디 홈에서 리스트 클릭 시 넘어옴)
	@RequestMapping("/studdypeDetailForm.do")
	public String studdypeDetailForm(Model model, HttpServletRequest request) {
		logger.info("studdypeDetailForm");
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int brCnt = 40;
		StudyDto studyDto = studyBiz.selectOneBySno(s_no);	// 스터디 정보
		studyDto.setPhoto(fileHandler.getFileName(studyDto.getPhoto(), "Studdype_Final"));
		
		MemberDto memberDto = memberBiz.selectOne(studyDto.getLeader_no());	// 스터디 팀장 정보
		
		Map<Integer, String> cateDto = studyBiz.selectCategoryOfStudy(studyDto.getCate_no());	// 스터디 카테고리
		Map<Integer, String> siDto = studyBiz.selectLocationSiOfStudy(studyDto.getSi_no()); // 스터디 지역시
		Map<Integer, String> guDto = studyBiz.selectLocationGuOfStudy(studyDto.getGu_no()); // 스터디 지역구
		
		BookDto bookDto = bookBiz.selectMainBookOfStudy(s_no);	// 스터디 대표도서 정보
		
		model.addAttribute("studyCate", cateDto);
		model.addAttribute("studySi", siDto);
		model.addAttribute("studyGu", guDto);
		model.addAttribute("study", studyDto);
		model.addAttribute("leader", memberDto);
		model.addAttribute("mainBook", bookDto);
		
		return "studdype/StuddypeDetailForm";
	}
	
	// 스터디 가입 신청
	@RequestMapping("/apply.do")
	public String studyApplyForm(Model model, HttpSession session, HttpServletRequest request) {
		int s_no = Integer.parseInt(request.getParameter("s_no")); // 스터디 디테일에서 스터디 번호 가져오기
		
		StudyDto studyDto = studyBiz.selectOneBySno(s_no); // 스터디번호로 스터디 하나 선택
		MemberDto login = (MemberDto)session.getAttribute("login"); // 로그인 세션 
		String category = studyBiz.categoryNameForStudyHome(studyDto.getCate_no()); // 선택 된 스터디의 카테고리 번호로 카테고리 이름 가져오기
		
		// 신청 버튼 누를 때 예외처리
		if ( session.getAttribute("login") == null ) { // 로그인이 안 되어있을 때
			model.addAttribute("msg", "로그인 후 이용바랍니다.");
			model.addAttribute("url", "loginform.do");
			return "commond/alert";
		} else{ // 로그인이 되어있다면 스터디번호&멤버번호로 study_applying테이블의 agree 컬럼 값 가져오기
			StudyApplyingDto applyDto = new StudyApplyingDto();
			applyDto.setS_no(s_no);
			applyDto.setMem_no(login.getMem_no());
			
			String agree = studyApplyingBiz.selectAgree(applyDto);
			String Default = new String("D");
			String Yes = new String("Y");
			
			if (agree == null) {
				
				if ( studyDto.getLeader_no() == login.getMem_no() ) { // 회원이 스터디의 팀장일 때
					model.addAttribute("msg", "내가 만든 스터디입니다. 마이페이지에서 스터디 리스트를 확인 해주세요.");
					model.addAttribute("url", "myPage.do");
					return "commond/alert";
				} else { 
					model.addAttribute("study", studyDto); 
					session.setAttribute("login", login);
					model.addAttribute("category", category);
					return "studdype/studyApplyForm";
				}
				
			} else { // 회원이 스터디의 팀장이 아닐 때
				
				if ( agree.equals(Default) ) { // 가입 심사중일 때
					model.addAttribute("msg", "가입 심사 대기 중인 스터디 입니다. 마이페이지에서 신청내역을 확인 해주세요.");
					model.addAttribute("url", "myPage.do");
					return "commond/alert";
				} else if ( agree.equals(Yes) ) { // 이미 가입한 스터디일 때
					model.addAttribute("msg", "이미 가입한 스터디 입니다. 마이페이지에서 내가 가입한 스터디를 확인 해주세요.");
					model.addAttribute("url", "myPage.do");
					return "commond/alert";
				} else {
					model.addAttribute("study", studyDto); 
					session.setAttribute("login", login);
					model.addAttribute("category", category);
					return "studdype/studyApplyForm";
				}
			}
		}
	}
	
	@RequestMapping(value="/studygetout.do",method = RequestMethod.GET)
	public String studygetout(HttpSession session,HttpServletRequest request,Model model) {
	
		MemberDto login = (MemberDto)session.getAttribute("login");
		StudyMemberDto dto = new StudyMemberDto(Integer.parseInt(request.getParameter("s_no")),login.getMem_no());
		int res = StudyMemberBiz.deletemember(dto);
		if(res>0) {
			model.addAttribute("msg","탈퇴 성공  !");
			model.addAttribute("url","studyList.do");
			return "commond/alert";
		}else {
			model.addAttribute("msg","탈퇴실패  !");
			model.addAttribute("url","studyList.do");
			return "commond/alert";
		}

	}
	
	
	@RequestMapping("/studyMemberInsert.do")
	public String StudyMemberInsert(Model model, HttpServletRequest request, StudyApplyingDto dto) {
		int mem_no = (Integer.parseInt(request.getParameter("mem_no")));
		int s_no = (Integer.parseInt(request.getParameter("s_no")));
		String info = request.getParameter("info");
		
		dto.setS_no(s_no);
		dto.setMem_no(mem_no);
		dto.setInfo(info);
		
		int res = studyApplyingBiz.insertStudyMember(dto);
		
		if( res > 0 ) {
			return "redirect:myPage.do";
		} else {
			model.addAttribute("msg", "스터디 가입 신청에 실패하였습니다. 다시 가입 해주세요.");
			model.addAttribute("url", "studdype/StuddypeDetailForm?s_no="+dto.getS_no());
			return "commond/alert";
		}
		
	}
	
	@RequestMapping(value = "/studycategoryList.do" , method = RequestMethod.GET)
	public String studyCategoryList(Model model, @ModelAttribute("searchPagination") SearchPagination searchPagination, HttpSession session, StudyDto studyDto) {
		session.setAttribute("headerMenu", "category");
		Map<Integer, String> studyMainLeaderNameMap = null; // 리더이름을 담을 MAP 설정
		List<StudyDto> studyList = null; // 스터디 리스트 담을 곳
		Map<Integer, String> selectSiForMainMap = null; // 시 리스트 담을 곳
		Map<Integer, String> selectGuForMainMap = null; // 구 리스트 담을 곳
		Map<Integer, String> selectCateForMainMap = null; // 카테고리 리스트 담을 곳
		// 로그
		logger.info("STUDY - CATESELECTLIST");
		
		studyList = studyBiz.studyListCategory(searchPagination); // 스터디 리스트
		

		PageMaker pageMaker = new PageMaker();
		pageMaker.setPagination(searchPagination);
		pageMaker.setTotalCount(studyBiz.selectTotalStudyListNum(searchPagination));
		selectSiForMainMap = studyBiz.selectSiForMainPage(studyList); // 구 리스트
		selectGuForMainMap = studyBiz.selectGuForMainPage(studyList); // 시 리스트
		studyMainLeaderNameMap = studyBiz.selectLeaderNameByMainPage(studyList); // 리더이름 리스트
		selectCateForMainMap = studyBiz.categoryListForHome(studyList); // 카테고리 리스트
			
		for(int i=0; i<studyList.size(); i++) {
				studyList.get(i).setPhoto(fileHandler.getFileName(studyList.get(i).getPhoto(), "Studdype_Final"));
		}
			
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("studyList",studyList);
		model.addAttribute("leaderName", studyMainLeaderNameMap);
		model.addAttribute("siList", selectSiForMainMap);
		model.addAttribute("guList", selectGuForMainMap);
		model.addAttribute("cateList", selectCateForMainMap);
		
		
		return "studdype/searchByCategory";
	}

	
		//지역별 검색 
		@RequestMapping(value = "/studyListLocation.do", method = RequestMethod.GET)
		public String SearchLocation(Model model,StudyDto studyDto,  @ModelAttribute("searchPagination") SearchPagination searchPagination,HttpSession session) {

			Map<Integer, String> studyMainLeaderNameMap = null; // 리더이름을 담을 MAP 설정
			List<StudyDto> studyList = null; // 스터디 리스트 담을 곳
			Map<Integer, String> selectSiForMainMap = null; // 시 리스트 담을 곳
			Map<Integer, String> selectGuForMainMap = null; // 구 리스트 담을 곳
			Map<Integer, String> selectCateForMainMap = null; // 카테고리 리스트 담을 곳
			List<LocationSiDto> sidtos = studyBiz.locationSiList();
			List<LocationGuDto> gudtos = studyBiz.locationGuList();
			// 로그
			logger.info("STUDY - SearchLocationLIST");

			studyList = studyBiz.studyListLocation(searchPagination);
			// 스터디 리스트
			PageMaker pageMaker = new PageMaker();
			pageMaker.setPagination(searchPagination);
			pageMaker.setTotalCount(studyBiz.selectTotalStudyListNum(searchPagination));
			selectSiForMainMap = studyBiz.selectSiForMainPage(studyList); // 구 리스트
			selectGuForMainMap = studyBiz.selectGuForMainPage(studyList); // 시 리스트
			studyMainLeaderNameMap = studyBiz.selectLeaderNameByMainPage(studyList); // 리더이름 리스트
			selectCateForMainMap = studyBiz.categoryListForHome(studyList); // 카테고리 리스트
			
			for (int i=0;i<studyList.size();i++) {
				studyList.get(i).setPhoto(fileHandler.getFileName(studyList.get(i).getPhoto(), "Studdype_Final"));
				System.out.println(studyList.get(i).getS_name());
				System.out.println(studyList.get(i).getSi_no());
				System.out.println(studyList.get(i).getGu_no());
			}
			model.addAttribute("sidtos", sidtos);
			model.addAttribute("gudtos", gudtos);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("studyList", studyList);
			model.addAttribute("leaderName", studyMainLeaderNameMap);
			model.addAttribute("siList", selectSiForMainMap);
			model.addAttribute("guList", selectGuForMainMap);
			model.addAttribute("cateList", selectCateForMainMap);
			session.setAttribute("headerMenu", "home");

			return "studdype/searchByLocation";
		}
		
	
}
















