package com.studdype.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.studdype.test.model.biz.board.MeetBiz;
import com.studdype.test.model.dto.board.MeetDto;
import com.studdype.test.model.dto.study.StudyDto;

@Controller
public class MeetController {
	
	@Autowired
	private MeetBiz meetBiz;
	
	private static final Logger logger = LoggerFactory.getLogger(MeetController.class);
	private final static int pageSize = 5; // 한 페이지에 보여줄 개수
	private final static int pageGroupSize = 5; // 페이지 그룹 사이즈
	
	// 모임게시판 리스트 이동
	@RequestMapping("/meetlist.do")
	public String meetList(HttpSession session, String pagenum, Model model) {
		StudyDto study = (StudyDto)session.getAttribute("study"); 	   // 현재 클릭 된 스터디
		List<MeetDto> list = null; 									   // 5개 페이징 담을 리스트
		Map<String,Integer> pageMap = new HashMap<String, Integer>();  // 시작페이지, 끝페이지 정보 담을 MAP
		Map<Integer, String> writerNameMap = null; 					   // 게시글 작성자 이름 담을 MAP
		logger.info("[MEET BOARD SELECT LIST]");
		
		int totalMeetBoardNum = meetBiz.selectTotalMeetBoardNum(study.getS_no()); // 모임 게시판 게시글 총 개수
		
		paging(pageMap, pagenum, totalMeetBoardNum); 	   // 페이징 함수
		pageMap.put("studyno", study.getS_no()); 	 	   // 스터디 번호 put
		
		list = meetBiz.selectPagingMeetBoardList(pageMap); // 5개 게시물만 가져오기
		writerNameMap = meetBiz.getWriterNameByList(list); // 멤버번호로 작성자 이름 받아오기

		model.addAttribute("startPage", pageMap.get("startPage"));
		model.addAttribute("endPage", pageMap.get("endPage"));
		model.addAttribute("currentPage", pageMap.get("currentPage"));
		model.addAttribute("totalPageNum", pageMap.get("totalPageNum"));
		model.addAttribute("list", list);
		model.addAttribute("writerMap", writerNameMap);
		session.setAttribute("leftnavi", "meet");
		return "community/meet/meetList";
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
	
	@RequestMapping("/meetinsertform.do")
	public String meetInsert(HttpSession session) {
		session.setAttribute("leftnavi", "meet");
		return "community/meet/meetInsert";
	}
	
	@RequestMapping("/meetdetail.do")
	public String meetDetail(HttpSession session) {
		session.setAttribute("leftnavi", "meet");
		return "community/meet/meetDetail";
	}
	
	@RequestMapping("/meetupdateform.do")
	public String meetUpdate(HttpSession session) {
		session.setAttribute("leftnavi", "meet");
		return "community/meet/meetUpdate";
	}
}
