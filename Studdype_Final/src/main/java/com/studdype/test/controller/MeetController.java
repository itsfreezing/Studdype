package com.studdype.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
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

import com.studdype.test.model.biz.board.MeetBiz;
import com.studdype.test.model.biz.member.MemberBiz;
import com.studdype.test.model.dto.board.MeetDto;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.study.StudyDto;

@Controller
public class MeetController {
	
	@Autowired
	private MeetBiz meetBiz;
	
	@Autowired
	private MemberBiz memberBiz;
	
	private static final Logger logger = LoggerFactory.getLogger(MeetController.class);
	private final static int pageSize = 5; // 한 페이지에 보여줄 개수
	private final static int pageGroupSize = 5; // 페이지 그룹 사이즈
	
	// 모임게시판 [리스트] 이동
	@RequestMapping("/meetlist.do")
	public String meetList(HttpSession session, String pagenum, Model model) {
		logger.info("[MEET BOARD SELECT LIST]");
		
		StudyDto study = (StudyDto)session.getAttribute("study"); 	 // 현재 클릭 된 스터디
		List<MeetDto> list = null; 									 // 5개 페이징 담을 리스트
		Map<String,Object> pageMap = new HashMap<String, Object>();  // 시작페이지, 끝페이지 정보 담을 MAP
		Map<Integer, MemberDto> memberMap = null; 					 // 게시글 작성자 이름 담을 MAP
		
		int totalMeetBoardNum = meetBiz.selectTotalMeetBoardNum( study.getS_no() ); // 모임 게시판 게시글 총 개수
		
		paging(pageMap, pagenum, totalMeetBoardNum); // 페이징 함수
		
		pageMap.put("studyno", study.getS_no());  // 스터디 번호 put
		
		System.out.println("-----------------------------------------------------------------------\n"
						  +"<<모임 게시판>> ["+study.getS_no()+"]번 스터디의 모임은 총 ["+totalMeetBoardNum+"]개 입니다.\n"
						  +"-----------------------------------------------------------------------");

	
		logger.info("[MEET BOARD SELECT LIST]");
		

		list = meetBiz.selectPagingMeetBoardList(pageMap); // 5개 게시물만 가져오기
		memberMap = meetBiz.getMemberMap(list); // 멤버번호로 작성자 이름 받아오기 

		model.addAttribute("startPage", pageMap.get("startPage"));
		model.addAttribute("endPage", pageMap.get("endPage"));
		model.addAttribute("currentPage", pageMap.get("currentPage"));
		model.addAttribute("totalPageNum", pageMap.get("totalPageNum"));
		model.addAttribute("list", list);
		model.addAttribute("memberMap", memberMap);
		session.setAttribute("leftnavi", "meet");
		
		return "community/meet/meetList";
	}
	
	// 모임게시판 '검색' [리스트] 이동
	@RequestMapping("/meetsearchlist.do")
	public String meetSearchList(HttpSession session, String pagenum, Model model, HttpServletRequest request) {
		logger.info("[MEET BOARD SELECT SEARCH LIST]");

		StudyDto study = (StudyDto)session.getAttribute("study"); 	 // 현재 클릭 된 스터디
		List<MeetDto> list = null; 									 // 5개 페이징 담을 리스트
		Map<String,Object> searchPageMap = new HashMap<String, Object>();  // 시작페이지, 끝페이지 정보 담을 MAP
		Map<String,Object> searchNumMap = new HashMap<String, Object>();  // 시작페이지, 끝페이지 정보 담을 MAP
		Map<Integer, MemberDto> memberMap = null; 					 // 게시글 작성자 이름 담을 MAP
		String keyword = request.getParameter("keyword");

		searchNumMap.put("s_no", study.getS_no()); // 스터디 번호 put
		searchNumMap.put("keyword", keyword);	   // 검색 키워드 put
		System.out.println("searchNumMap: "+searchNumMap);
		
		int totalMeetBoardNum = meetBiz.selectSearchMeetBoardNum( searchNumMap ); // 모임 게시판 게시글 총 개수
		System.out.println("-----------------------------------------------------------------------\n"
						  +"<<모임 게시판>> ["+study.getS_no()+"]번 스터디에서 "
						  +"["+keyword+"] 검색어에 대한 "
						  +"모임 개수는 총 ["+totalMeetBoardNum+"]개 입니다.\n"
						  +"-----------------------------------------------------------------------"); 
		
		paging(searchPageMap, pagenum, totalMeetBoardNum); // 페이징 함수
		
		searchPageMap.put("studyno", study.getS_no()); // 스터디 번호 put
		searchPageMap.put("keyword", keyword); // 검색 키워드 put
		 
		list = meetBiz.selectPagingSearchMeetList(searchPageMap); // 5개 게시물만 가져오기
		memberMap = meetBiz.getMemberMap(list); // 멤버번호로 작성자 이름 받아오기 
		
		model.addAttribute("s_no", searchNumMap.get("s_no"));
		model.addAttribute("keyword", searchNumMap.get("keyword"));
		model.addAttribute("studyno", searchPageMap.get("studyno"));
		model.addAttribute("keyword", searchPageMap.get("keyword"));
		model.addAttribute("startPage", searchPageMap.get("startPage"));
		model.addAttribute("endPage", searchPageMap.get("endPage"));
		model.addAttribute("currentPage", searchPageMap.get("currentPage"));
		model.addAttribute("totalPageNum", searchPageMap.get("totalPageNum"));
		model.addAttribute("list", list);
		model.addAttribute("memberMap", memberMap);
		session.setAttribute("leftnavi", "meet");
		
		return "community/meet/meetSearchList";
	}
	
	// ------------- 페이징 함수 -------------
	public void paging(Map<String, Object> pagingMap, String pageNum, int totalBoardNum) {
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
	
	//	모임게시판 모임 [상세보기] 이동
	@RequestMapping("/meetdetail.do")
	public String meetDetail(HttpSession session,HttpServletRequest request, HttpServletResponse response, Model model) {
		logger.info("[MEET BOARD DETAIL]");
		
		int meet_no = Integer.parseInt(request.getParameter("meetno"));
		
		// 조회수 함수 isVisitPage = [1: 방문] / [0: 미방문]
		int isVisitPage = chkVisited(request, response, "meetboardvisit", request.getParameter("meetno"));
		
		MeetDto dto = meetBiz.selectMeetBoardDetail(meet_no, isVisitPage);			// 모임게시판 디테일 & 모임게시판 조회수 증가
		MemberDto member = memberBiz.selectOne(dto.getMeet_writer());	// 작성자 이름 회원번호로 가져오기
		System.out.println("-----------------------------------------------------------------------\n"
						  +"<<모임 게시판>> ["+dto.getMeet_no()+"]번 째 모임의 "
						  +"제목은 ["+dto.getMeet_title()+"], "
						  +"작성자의 회원번호는 ["+dto.getMeet_writer()+"]번 입니다.\n"
						  +"-----------------------------------------------------------------------"); 
		
		model.addAttribute("dto", dto);
		model.addAttribute("member", member);
		session.setAttribute("leftnavi", "meet");
		return "community/meet/meetDetail";
	}
	
	// ------------- 한게시글에 하루에 1번만 조회수 함수 -------------
	private int chkVisited(HttpServletRequest request, HttpServletResponse response, String cookieName, String meet_no) {
		int isVisit = 0; 	 // 온 게시판?
		int isVisitPage = 0; // 온 게시글?
		Cookie[] cookies = request.getCookies(); // 모든 쿠키

		for (Cookie cookie : cookies) { 		 // 모든 쿠키 조회

			if (cookie.getName().equals(cookieName)) { 				 // 모임게시판에 온적이 있으면
				isVisit = 1;

				// meetBoardVisit 쿠키에 글번호가 있으면
				if (cookie.getValue().contains(meet_no)) {
					isVisitPage = 1; // 온적있음 -> 1
				} else { // 없으면
					cookie.setValue(cookie.getValue() + "_" + meet_no); // 쿠키값 + '_게시글번호' 업데이트해줌
					response.addCookie(cookie); // 쿠키 추가
				}
			}
		}

		if (isVisit == 0) { 								// 모임게시판 첫 접근이면 쿠키 생성
			Cookie cookie = new Cookie(cookieName, meet_no);
			cookie.setMaxAge(60 * 60 * 24); 				// 쿠키 하루생존
			response.addCookie(cookie); 					//쿠키 추가
		}
		
		return isVisitPage;
	}
	
	// 모임게시판 모임 [생성 폼] 이동
	@RequestMapping("/meetinsertform.do")
	public String meetInsertFrom(HttpSession session) {
		logger.info("[MEET BOARD INSERT FORM]");
		
		session.setAttribute("leftnavi", "meet");
		return "community/meet/meetInsert";
	}
	
	// 모임게시판 모임 [생성]
	@RequestMapping("/meetinsert.do")
	public String meetInsert(MeetDto dto,HttpSession session) {
		logger.info("[MEET BOARD INSERT]");
		
		int writer = ( (MemberDto)session.getAttribute("login") ).getMem_no(); // 작성자 번호
		int s_no = ( (StudyDto)session.getAttribute("study") ).getS_no();	   // 스터디 번호
		
		dto.setMeet_writer(writer);
		dto.setS_no(s_no);
		int res = meetBiz.insert(dto);
		
		if (res > 0) {
			System.out.println("-----------------------------------------------------------------------\n"
							  +"<<모임 게시판>> ["+dto.getS_no()+"]번 스터디에 모임이 추가되었습니다. "
							  +"작성자의 회원번호는 ["+dto.getMeet_writer()+"]번 입니다.\n"
							  +"-----------------------------------------------------------------------"); 
			return "redirect:meetlist.do";
		} else {
			return "redirect:meetinsertform.do";
		}
	}
	
	// 모임게시판 모임 [수정 폼] 이동
	@RequestMapping("/meetupdateform.do")
	public String meetUpdateFrom(Model model, HttpServletRequest request) {
		logger.info("[MEET BOARD UPDATE FORM]");
		
		int meet_no = Integer.parseInt( request.getParameter("meet_no") );
		
		MeetDto dto = meetBiz.selectOneMeetBoard(meet_no);
		System.out.println("-----------------------------------------------------------------------\n"
				  +"<<모임 게시판>> ["+meet_no+"]번 모임 수정 폼으로 이동합니다.\n"
				  +"-----------------------------------------------------------------------"); 
		
		model.addAttribute("dto", dto);
		return "community/meet/meetUpdate";
	} 
	
	// 모임게시판 모임 [수정]
	@RequestMapping("/meetupdate.do")
	public String meetUpdate(MeetDto dto, Model model) {
		logger.info("[MEET BOARD UPDATE]");
		
		int res = meetBiz.updateMeetBoard(dto);
		
		if(res>0) {
			System.out.println("-----------------------------------------------------------------------\n"
							  +"<<모임 게시판>> ["+dto.getMeet_no()+"]번 째 모임이 수정 되었습니다.\n"
							  +"-----------------------------------------------------------------------"); 
			return "redirect:meetdetail.do?meetno="+dto.getMeet_no();
		} else {
			model.addAttribute("msg", "모임 수정을 실패하였습니다.");
			model.addAttribute("url", "meetupdateform.do?meet_no="+dto.getMeet_no());
			return "commond/alert";
		}
	}
	
	// 모임게시판 모임 [삭제]
	@RequestMapping("/meetdelete.do")
	public String meetDelete(HttpServletRequest request, Model model) {
		logger.info("[MEET BOARD DELETE]");
		
		int meet_no = Integer.parseInt(request.getParameter("meet_no"));
		
		int res = meetBiz.delete(meet_no);
		
		if(res > 0) {
			System.out.println("-----------------------------------------------------------------------\n"
							  +"<<모임 게시판>> ["+meet_no+"]번 째 모임이 삭제되었습니다.\n"
							  +"-----------------------------------------------------------------------"); 
			return "redirect:meetlist.do";
		} else {
			model.addAttribute("msg", "모임 삭제를 실패하였습니다.");
			model.addAttribute("url", "meetdetail.do?meet_no"+meet_no);
			return "commond/alert";
		}
	}
}
