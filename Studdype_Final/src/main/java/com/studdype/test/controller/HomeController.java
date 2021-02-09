package com.studdype.test.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.studdype.test.common.FileHandler;
import com.studdype.test.model.biz.board.BookBiz;
import com.studdype.test.model.biz.board.MeetBiz;
import com.studdype.test.model.biz.member.MemberBiz;
import com.studdype.test.model.biz.study.StudyApplyingBiz;
import com.studdype.test.model.biz.study.StudyBiz;
import com.studdype.test.model.biz.study.StudyMemberBiz;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.BookDto;
import com.studdype.test.model.dto.board.MeetDto;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.study.StudyApplyingDto;
import com.studdype.test.model.dto.study.StudyDto;
import com.studdype.test.model.dto.study.StudyMemberDto;


/**
 * Handles requests for the application home page.
 */
@Controller 
public class HomeController {
	
	@Autowired
	private MemberBiz memberBiz;
	@Autowired
	private StudyBiz studyBiz;
	@Autowired
	private StudyMemberBiz studymemberBiz;
	@Autowired
	private StudyApplyingBiz studyapplyingBiz;
	@Autowired
	private BookBiz bookBiz;
	@Autowired
	private MeetBiz meetBiz;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private final static int pageSize = 5; // 한 페이지에 보여줄 개수
	private final static int pageGroupSize = 5; // 페이지 그룹 사이즈
	
	@RequestMapping("/studdypehome.do")
	public String studdypeHeader() {
		return "studdype/studdypeHome";
	}
	
	@RequestMapping("/studdypeexample.do")
	public String studdypeExample() {
	
		return "studdype/studdypeExample";
	}
	
	@RequestMapping("/searchbycategory.do")
	public String searchByCategory() {
	
		return "studdype/searchByCategory";
	}
	
	//마이페이지로 이동
	@RequestMapping("/myPage.do")
	public String myPage(HttpSession session,String pagenum, Model model) {
		MemberDto login = (MemberDto)session.getAttribute("login");


		
		 //해당 회원번호로 가입되있는 스터디 번호 가져오기
		
		List<StudyMemberDto> joinedstudy = studymemberBiz.StudyList(login.getMem_no()); //해당 회원번호로 가입되있는 스터디 번호 가져오기

		List<StudyDto> studylist = new ArrayList<StudyDto>();
		List<StudyDto> applylist = new ArrayList<StudyDto>();
		List<StudyDto> LeaderList = studyBiz.studyLeader(login.getMem_no());    //본인이 리더인 스터디 리스트
	
		List<StudyApplyingDto> Receiveapply = new ArrayList<StudyApplyingDto>(); //내가 받은 가입 신청
		List<StudyApplyingDto> studyApplylist = studyapplyingBiz.studyApplyingList(login.getMem_no()); //멤버 번호로 studyapply 리스트 가져오기
		List<StudyDto> receiveapplyname = new ArrayList<StudyDto>();
		List<StudyMemberDto> pageList = null;
		List<MemberDto> allMember = memberBiz.allMember();
		int totalStudyListNum = studymemberBiz.StudyTotalNum(login.getMem_no()); //5개씩 스터디 번호 가져오기

		
		List<MemberDto> applymember = new ArrayList<MemberDto>();
		Map<String,Integer> pageMap = new HashMap<String,Integer>();
		
		paging(pageMap, pagenum, totalStudyListNum);
		pageMap.put("mem_no", login.getMem_no());
		
		
		int[] joinSnoList = new int[joinedstudy.size()];
		
		
		for(int i=0;i<joinedstudy.size();i++) {
			StudyDto dto = studyBiz.selectOneBySno(joinedstudy.get(i).getS_no());
			joinSnoList[i] = joinedstudy.get(i).getS_no();
		
				studylist.add(dto);
		}
		
		
		
		Map<Integer,String> nameMap = studyBiz.selectStudyName(joinSnoList);
		
		List<MeetDto> meetlist = meetBiz.selectMeetByS_no(joinSnoList);
		
		
		model.addAttribute("meetlist",meetlist);
		model.addAttribute("nameMap",nameMap);
		
		
		
		
		
		
		model.addAttribute("joinSnoList",joinSnoList);
		
	
		
		
		
		
		
		for(int i=0;i<studyApplylist.size();i++) {
			StudyDto dto2 = studyBiz.selectOneBySno(studyApplylist.get(i).getS_no());
			System.out.println("여기가수상해"+dto2);
			applylist.add(dto2);
		}
		
		for(int i=0;i<LeaderList.size();i++) {
			List<StudyApplyingDto> dto3 = studyapplyingBiz.snoList(LeaderList.get(i).getS_no());
			Receiveapply.addAll(dto3);
		}
		for(int i=0;i<Receiveapply.size();i++) {
			StudyDto dto4 = studyBiz.selectOneBySno(Receiveapply.get(i).getS_no());
			receiveapplyname.add(dto4);
		}
		for(int i=0;i<Receiveapply.size();i++) {
			MemberDto dto5 = memberBiz.selectOne(Receiveapply.get(i).getMem_no());
			applymember.add(dto5);
		}
		
		
		
		

		model.addAttribute("allMember",allMember);
		model.addAttribute("applymember",applymember);
		model.addAttribute("startPage", pageMap.get("startPage"));
		model.addAttribute("endPage",pageMap.get("endPage"));
		model.addAttribute("currentPage",pageMap.get("currentPage"));
		model.addAttribute("totalPageNum",pageMap.get("totalPageNum"));
		model.addAttribute("pageList",pageList);
		model.addAttribute("LeaderList",LeaderList);
	
		model.addAttribute("Receiveapply",Receiveapply);
		model.addAttribute("receiveapplyname",receiveapplyname);
		model.addAttribute("studyApplylist",studyApplylist);
		model.addAttribute("applylist",applylist);
		session.setAttribute("login",login);
		session.setAttribute("headerMenu", "myPage");
		model.addAttribute("studylist", studylist);
	
	
		return "studdype/myPage2";
	}
	//마이페이지 회원탈퇴 버튼 클릭시
	@RequestMapping(value="/memberDelete.do",method = RequestMethod.GET)
	public String getout(HttpServletRequest request,HttpSession session, Model model) {
		int res = 0;
		
		res = memberBiz.memberDelete(Integer.parseInt(request.getParameter("mem_no")));
		
		if(res > 0) {
			model.addAttribute("msg","탈퇴 성공");
			model.addAttribute("url","studyList.do");
			session.invalidate();
			return "commond/alert";
		}
			model.addAttribute("msg","탈퇴 실패");
			model.addAttribute("url","myPage.do");
			return "commond/alert";
	}
	// 스터디가입 수락버튼 클릭시
	@RequestMapping(value="/receiveagree.do",method = RequestMethod.GET)
	public String receiveagree(HttpServletRequest request, Model model) {
		
		StudyApplyingDto dto = new StudyApplyingDto(Integer.parseInt(request.getParameter("s_no")),Integer.parseInt(request.getParameter("mem_no")));
		
		int res = studyapplyingBiz.receiveagree(dto);
		
		if(res>0) {
			model.addAttribute("msg","수락 되었습니다.");
			model.addAttribute("url","myPage.do");
			return "commond/alert";
		}else {
			model.addAttribute("msg","실패 하였습니다.");
			model.addAttribute("url","myPage.do");
			return "commond/alert";
		}
		
	}
	//마이페이지 receive 거절 버튼 클릭시
	@RequestMapping(value="/receivereject.do",method = RequestMethod.GET)
	public String receivereject(HttpServletRequest request, Model model) {
		
		StudyApplyingDto dto = new StudyApplyingDto(Integer.parseInt(request.getParameter("s_no")),Integer.parseInt(request.getParameter("mem_no")));
		
		int res = studyapplyingBiz.receivereject(dto);
		
		if(res>0) {
			model.addAttribute("msg","거절 되었습니다.");
			model.addAttribute("url","myPage.do");
			return "commond/alert";
		}else {
			model.addAttribute("msg","실패 하였습니다.");
			model.addAttribute("url","myPage.do");
			return "commond/alert";
		}
		
		
	}
	//마이페이지 스터디 신청내역 삭제 
	@RequestMapping(value="/receivedelete.do",method = RequestMethod.GET)
	public String receivedelete(HttpServletRequest request, Model model) {
		StudyApplyingDto dto = new StudyApplyingDto(Integer.parseInt(request.getParameter("s_no")),Integer.parseInt(request.getParameter("mem_no")));
		
		int res = studyapplyingBiz.receivedelete(dto);
		
		if(res>0) {
			model.addAttribute("msg","삭제 되었습니다.");
			model.addAttribute("url","myPage.do");
			return "commond/alert";
		}else {
			model.addAttribute("msg","삭제를 실패하였습니다.");
			model.addAttribute("url","myPage.do");
			return "commond/alert";
			
		}
		
	}


	
	//비밀번호 변경시 
	@RequestMapping(value="/changepw.do",method = RequestMethod.GET)
	public String changepw(HttpServletRequest request,Model model,HttpSession session) {
		MemberDto login = (MemberDto)session.getAttribute("login");
		MemberDto dto = new MemberDto(Integer.parseInt(request.getParameter("mem_no")),request.getParameter("new_pw"));
		int res = memberBiz.updatePw(dto);
		
		if(res>0) {
			model.addAttribute("msg", "비밀번호 변경 성공!");
			model.addAttribute("url", "myPage.do");
			login.setMem_pw(request.getParameter("new_pw"));
			
			return "commond/alert";
		}else {
			model.addAttribute("msg","비밀번호 변경 실패!");
			model.addAttribute("url","myPage.do");
			return "commond/alert";
		}
		
	}
	//마이페이지 이메일 변경
	@RequestMapping(value="/changeemail.do",method = RequestMethod.GET)
	public String changeemail(HttpServletRequest request,Model model,HttpSession session) {
		MemberDto login = (MemberDto)session.getAttribute("login");
	
		MemberDto dto = new MemberDto(login.getMem_no(),login.getMem_phone(),request.getParameter("new_email"));
		int res = memberBiz.newemail(dto);
		
		if(res>0) {
			login.setMem_email(request.getParameter("new_email"));
			
			model.addAttribute("msg", "이메일 변경 성공!");
			model.addAttribute("url", "myPage.do");
			session.setAttribute("login", login);
		    session.setMaxInactiveInterval(-1);
		
			return "redirect:myPage.do";
		}else {
			model.addAttribute("msg","이메일 변경 실패!");
			model.addAttribute("url","myPage.do");
			return "commond/alert";
		}
	}
	@RequestMapping(value="/changephone.do",method = RequestMethod.GET)
	public String changephone(HttpServletRequest request,Model model,HttpSession session) {
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		MemberDto dto = new MemberDto(login.getMem_no(),request.getParameter("new_phone"),login.getMem_email());
		int res = memberBiz.updatephone(dto);
		
		if(res>0) {
			login.setMem_phone(request.getParameter("new_phone"));
			model.addAttribute("msg","전화번호 수정 성공!");
			model.addAttribute("url","myPage.do");
			session.setAttribute("login", login);
			session.setMaxInactiveInterval(-1);
			return "redirect:myPage.do";
		}else {
			model.addAttribute("msg","전화번호 변경 실패!");
			model.addAttribute("url","myPage.do");
			return "commond/alert";
			
		}
		
		
		
		
	}
	
	

	
	
	//페이징 함수
	public void paging(Map<String, Integer> pagingMap, String pageNum, int totalBoardNum) {
		int currentPage = (pageNum == null || pageNum.trim() == "") ? 1 : Integer.parseInt(pageNum); // 현재 페이지
		int startRow = (currentPage - 1) * pageSize + 1; 		// 페이지 첫번째 글
		int endRow = currentPage * pageSize; 					// 페이지 마지막 글
		int numPageGroup = (int) Math.ceil((double) currentPage / pageGroupSize); // 페이지 그룹
		/*
		 * [1][2][3][4][5] -> 1 ( numPageGroup ) [6][7][8][9][10] -> 2
		 */
		int startPage = (numPageGroup - 1) * pageGroupSize + 1; // 시작페이지
		int endPage = numPageGroup * pageGroupSize; 			// 끝 페이지
		int totalPageNum = totalBoardNum / pageSize + 1; 		// 총페이지 개수

		// 마지막 페이지가 총 페이지 갯수보다 많으면
		if (endPage > totalPageNum) {
			endPage = totalPageNum;
		}

		pagingMap.put("currentPage", currentPage);
		pagingMap.put("startRow", startRow);
		pagingMap.put("endRow", endRow);
		pagingMap.put("startPage", startPage);
		pagingMap.put("endPage", endPage);
		pagingMap.put("totalPageNum", totalPageNum);
		
	}

	//커뮤니티 홈으로 테테테테테스트트트ㅡ트ㅡㅡ용
	@RequestMapping("/communityhome1.do")
	public String communityHome1(HttpSession session,Model model) {

		/////////////////////// 테스트용 세션
		MemberDto login = memberBiz.selectOne(1);
		StudyDto study = studyBiz.selectOneBySno(1);
		
		session.setAttribute("study", study); //스터디 세션
		session.setAttribute("login", login); //스터디 세션
		//////////////////화상회의 테스트를 위한 session login, study커뮤니티접근 세션 구현후 삭제
		session.setAttribute("leftnavi", "studyhome");
	
		return "community/communityHome";
	}
	
	//마이페이지에서 studycommunity 접근시
	@RequestMapping("studycommunity.do")
	public String studycommunity(HttpSession session, Model model,int s_no) {
		FileHandler filehandler = new FileHandler();	// FileHandler Class 객체 생성
		StudyDto study = studyBiz.selectOneBySno(s_no);
		String category = studyBiz.categoryNameForStudyHome(study.getCate_no());
		String leaderName = studyBiz.leaderNameForStudyHome(study.getLeader_no());
		String guName = studyBiz.guNameForStudyHome(study.getGu_no());
		String siName = studyBiz.siNameForStudyHome(study.getSi_no());
		List<BoardDto> noticeList = studyBiz.selectNoticeBoard(study.getS_no()); 
		// DB에 저장된 사진이 없을 때 
		// null 값으로 넣으면 nullPointerException 발생
		// File init~ 예외처리가 되지 않아서 임의 문자열을 입력
		// JSP의 onError 속성으로 noImage.jpg 로드
		if(study.getPhoto() == null ) {
			study.setPhoto("no_url_of_photo_from_studyTB"); 
		}
		// FileHandler의 getFilName 메소드 매개변수에 파일경로를 넣어준다.
		String fileName = filehandler.getFileName(study.getPhoto(), "Studdype_Final");
		
		BookDto book = bookBiz.selectMainBookOfStudy(study.getS_no());

		
		model.addAttribute("book", book);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("siName", siName);
		model.addAttribute("guName", guName);
		model.addAttribute("category", category);
		model.addAttribute("fileName", fileName);
		model.addAttribute("leaderName", leaderName);
		session.setAttribute("study", study);
		session.setAttribute("leftnavi", "studyhome");
		
		return "community/communityHome";	
	}
	
	// 커뮤니티 홈
	@RequestMapping("/communityhome.do")
	public String communityHome(HttpSession session,Model model, int s_no) {
		StudyDto study = studyBiz.selectOneBySno(s_no);
		System.out.println("study: "+study.getPhoto());

		session.setAttribute("leftnavi", "studyhome");
		return "community/communityHome";
	}
	


	
	@RequestMapping("/signupform.do")
	public String signup(HttpSession session) {
		return "loginpage/signup";
	}
	
	@RequestMapping("/notetest.do")
	public String notetest() {
		return "notetest";
	}
	
	@RequestMapping("/fileupload.do")
	public String uploadTest() {
		return "community/freeboard/uploadtest";
	}
		
	@RequestMapping("/findpwres.do")
	public String findpwresTest() {
		return "loginpage/findpwres";
	}
	
	
}









