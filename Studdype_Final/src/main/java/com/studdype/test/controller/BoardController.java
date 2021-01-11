package com.studdype.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.studdype.test.model.biz.board.BookBiz;
import com.studdype.test.model.biz.board.FreeBiz;
import com.studdype.test.model.biz.member.MemberBiz;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.BookDto;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.study.StudyDto;

@Controller
public class BoardController {
	@Autowired
	private FreeBiz freeBiz;

	@Autowired
	private MemberBiz memberBiz;
	
	@Autowired
	private BookBiz bookBiz;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private final static int pageSize = 15; // 한페이지에 보여줄 개수
	private final static int pageGroupSize = 5; // 페이지 그룹 사이즈
	
	private final static int bookPageSize = 8; // 도서 한 페이지에서 보여줄 도서 개수

	// 자유게시판 리스트 이동
	@RequestMapping("/freeboard.do")
	public String freeBoard(HttpSession session, String pagenum, Model model) {
		StudyDto study = (StudyDto) session.getAttribute("study"); // 현재 클릭된 스터디
		List<BoardDto> list = null; // 15개 페이징 담을 리스트 
		Map<String, Integer> pageMap = new HashMap<String, Integer>(); // 시작페이지, 끝페이지 정보 담을 MAP
		Map<Integer, MemberDto> memberMap = null; //게시글 멤버정보 담을 MAP
	
		int totalBoardNum = freeBiz.selectTotalBoardNum( study.getS_no() ); //총 자유게시판 글 갯수

		paging(pageMap, pagenum, totalBoardNum); //페이징 함수
	
		pageMap.put("studyno", study.getS_no()); //스터디 번호 put

		// 15개 게시물만 가져오기
		list = freeBiz.selectPagingBoardList(pageMap);
		// 멤버번호로 작성자 이름 받아오기
		memberMap = freeBiz.getMemberMap(list);

		model.addAttribute("startPage", pageMap.get("startPage"));
		model.addAttribute("endPage", pageMap.get("endPage"));
		model.addAttribute("currentPage", pageMap.get("currentPage"));
		model.addAttribute("totalPageNum", pageMap.get("totalPageNum"));
		model.addAttribute("list", list);
		model.addAttribute("memberMap", memberMap);
		session.setAttribute("leftnavi", "freeboard");
		return "community/freeboard/freeboard";
	}

	// 자유게시판 글 작성 form 이동
	@RequestMapping("/freewriteform.do")
	public String freewriteform() {
		return "community/freeboard/freewriteform";
	}

	// 자유게시판 글 작성
	@RequestMapping("/freewrite.do")
	public String freewrite(BoardDto board, HttpSession session) {
		int writer = ((MemberDto) session.getAttribute("login")).getMem_no(); // 작성자 번호
		int s_no = ((StudyDto) session.getAttribute("study")).getS_no(); /// 스터디 번호

		board.setB_writer(writer);
		board.setS_no(s_no);
		int res = freeBiz.writeBoard(board);

		if (res > 0) {
			return "redirect:freeboard.do";
		} else {
			return "redirect:freewriteform.do";
		}

	}
	
	//자유게시판 글 삭제
	@RequestMapping(value="/freeBoardDelete.do", method = RequestMethod.GET)
	public String freeBoardDelete(HttpServletRequest request, Model model) {
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		int res = freeBiz.deleteBoard(b_no);
		
		
		if( res > 0) {
			return "redirect:freeboard.do";
		}else {			
			model.addAttribute("msg", "글 삭제 실패!!");
			model.addAttribute("url", "freedetail.do?b_no="+b_no);
			return "commond/alert";
		}
		
	}

	// 자유게시판 보드디테일
	@RequestMapping(value = "/freedetail.do", method = RequestMethod.GET)
	public String freeDetail(HttpServletRequest request, HttpServletResponse response, Model model) {
		int b_no = Integer.parseInt(request.getParameter("b_no"));

		//조회수 함수  isVisitPage = 1 -> 방문한 적있음  0 -> 없음
		int isVisitPage = chkVisited(request, response, "freeboardvisit", request.getParameter("b_no"));
		
		
		BoardDto board = freeBiz.selectOne(b_no, isVisitPage); //게시글 가져오기 / 조회수 증가
		MemberDto member = memberBiz.selectOne( board.getB_writer() ); //작성자 이름 가져오기

		model.addAttribute("dto", board);
		model.addAttribute("member", member);
		return "community/freeboard/freeDetail";
	}


	//페이징 함수 
	public void paging(Map<String, Integer> pagingMap, String pageNum, int totalBoardNum) {

		int currentPage = (pageNum == null || pageNum.trim() == "") ? 1 : Integer.parseInt(pageNum); // 현재 페이지
		int startRow = (currentPage - 1) * pageSize + 1; // 페이지 첫번째 글
		int endRow = currentPage * pageSize; // 페이지 마지막 글
		int numPageGroup = (int) Math.ceil((double) currentPage / pageGroupSize); // 페이지 그룹
		/*
		 * [1][2][3][4][5] -> 1 ( numPageGroup ) [6][7][8][9][10] -> 2
		 */
		int startPage = (numPageGroup - 1) * pageGroupSize + 1; // 시작페이지
		int endPage = numPageGroup * pageGroupSize; // 끝 페이지
		int totalPageNum = totalBoardNum / pageSize + 1; // 총페이지 개수

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
	
	
	//한게시글에 하루에 1번만 조회수 함수
	private int chkVisited(HttpServletRequest request, HttpServletResponse response, String cookieName, String b_no) {
		int isVisit = 0; // 온 게시판?
		int isVisitPage = 0; // 온 게시글?
		Cookie[] cookies = request.getCookies(); // 모든 쿠키

		for (Cookie cookie : cookies) { // 모든 쿠키 조회

			if (cookie.getName().equals(cookieName)) { // 자유게시판에 온적이 있으면
				isVisit = 1;

				// freeboardvisit 쿠키에 글번호가 있으면
				if (cookie.getValue().contains(b_no)) {
					isVisitPage = 1; // 온적있음 -> 1
				} else { // 없으면
					cookie.setValue(cookie.getValue() + "_" + b_no); // 쿠키값 + '_게시글번호' 업데이트해줌
					response.addCookie(cookie); // 쿠키 추가
				}
			}
		}

		if (isVisit == 0) { // 자유게시판 첫 접근이면 쿠키 생성
			Cookie cookie = new Cookie(cookieName, b_no);
			cookie.setMaxAge(60 * 60 * 24); // 쿠키 하루생존
			response.addCookie(cookie); //쿠키 추가
		}
		
		return isVisitPage;
	}
	
	// 도서 검색 페이지 전환
	@RequestMapping("/bookboardform.do")
	public String bookBoardForm(HttpSession session) {
		session.setAttribute("leftnavi", "book");
		return "community/book/bookboardform";
	}
	
	// 도서 검색 페이지
	@RequestMapping("/searchBook.do")
	public String searchBook(HttpSession session, Model model, String pagenum) {
		StudyDto study = (StudyDto) session.getAttribute("study");
		List<BookDto> list = null; // 4개 페이징 담을 리스트 
		Map<String, Integer> pageMap = new HashMap<String, Integer>(); // 시작페이지, 끝페이지 정보 담을 MAP
		Map<Integer, MemberDto> writerNameMap = null;// 게시글 작성자 이름 담을 MAP
		
		
		int totalBookNum = bookBiz.selectTotalRegisterBookNum(study.getS_no()); // 해당 스터디에 등록된 총 도수 개수
		System.out.println(totalBookNum);

		System.out.println(bookPageSize);
		paging(pageMap, pagenum, totalBookNum, bookPageSize); //페이징 함수
	
		pageMap.put("studyno", study.getS_no()); //스터디 번호 put

		// 4개 게시물만 가져오기
		list = bookBiz.selectPageBookList(pageMap);
		// 멤버번호로 작성자 이름/아이디 받아오기
		writerNameMap = bookBiz.getWriterNameByList(list);
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		
//		model.addAttribute("startPage", pageMap.get("startPage"));
//		model.addAttribute("endPage", pageMap.get("endPage"));
//		model.addAttribute("currentPage", pageMap.get("currentPage"));
//		model.addAttribute("totalPageNum", pageMap.get("totalPageNum"));
		model.addAttribute("list", list);
		model.addAttribute("writerMap", writerNameMap);
		session.setAttribute("leftnavi", "book");
		
		return "community/book/searchBook";
	}
	
	@RequestMapping("/searchBookList.do")
	public String searchBookList(HttpSession session, Model model, String book_title) {
		return "community/book/searchBook";
	}
	
	//페이징 함수 
	public void paging(Map<String, Integer> pagingMap, String pageNum, int totalBoardNum, int bookPageSize) {

		int currentPage = (pageNum == null || pageNum.trim() == "") ? 1 : Integer.parseInt(pageNum); // 현재 페이지
		int startRow = (currentPage - 1) * bookPageSize + 1; // 페이지 첫번째 글
		int endRow = currentPage * bookPageSize; // 페이지 마지막 글
		int numPageGroup = (int) Math.ceil((double) currentPage / pageGroupSize); // 페이지 그룹
		/*
		 * [1][2][3][4][5] -> 1 ( numPageGroup ) [6][7][8][9][10] -> 2
		 */
		int startPage = (numPageGroup - 1) * pageGroupSize + 1; // 시작페이지
		int endPage = numPageGroup * pageGroupSize; // 끝 페이지
		int totalPageNum = totalBoardNum / bookPageSize + 1; // 총페이지 개수
		
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
	
	@RequestMapping("/test.do")
	public String test() {
		return "community/book/example";
	}
}
