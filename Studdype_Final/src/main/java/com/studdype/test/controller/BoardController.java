package com.studdype.test.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.studdype.test.common.FileHandler;
import com.studdype.test.common.PageChecker;
import com.studdype.test.common.SearchPagination;
import com.studdype.test.common.UploadFile;
import com.studdype.test.model.biz.board.BookBiz;
import com.studdype.test.model.biz.board.FreeBiz;
import com.studdype.test.model.biz.board.MeetBiz;
import com.studdype.test.model.biz.board.NoticeBiz;
import com.studdype.test.model.biz.file.FreeFileBiz;
import com.studdype.test.model.biz.member.MemberBiz;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.BookDto;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.board.MeetDto;
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
	@Autowired
	private MeetBiz meetBiz;
	@Autowired
	private FreeFileBiz freeFileBiz;
	@Autowired
	private NoticeBiz noticeBiz;
	
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private final static int pageSize = 15; // 한페이지에 보여줄 개수
	private final static int pageGroupSize = 5; // 페이지 그룹 사이즈

	private FileHandler fileHandler = new FileHandler();
	private PageChecker pageChecker = new PageChecker(); 
	// 자유게시판 리스트 이동
	@RequestMapping("/freeboard.do")
	public String freeBoard(HttpSession session, String pagenum, Model model) {
		StudyDto study = (StudyDto) session.getAttribute("study"); // 현재 클릭된 스터디
		List<BoardDto> list = null; // 15개 페이징 담을 리스트
		List<BoardDto> noticeList = null;// 공지사항 담을 리스트
		Map<String, Integer> pageMap = new HashMap<String, Integer>(); // 시작페이지, 끝페이지 정보 담을 MAP
		Map<Integer, MemberDto> memberMap = null; // 게시글 멤버정보 담을 MAP
		Map<Integer, MemberDto> noticeMemberMap = null; // 게시글 멤버정보 담을 MAP
		Map<Integer, Integer> replyCntMap = null;// 댓글 갯수 담을 MAP
		Map<Integer, Integer> noticeReplyCntMap = null;// 공지사항 댓글 갯수 담을 MAP

		int totalBoardNum = freeBiz.selectTotalBoardNum(study.getS_no()); // 총 자유게시판 글 갯수

		paging(pageMap, pagenum, totalBoardNum); // 페이징 함수

		pageMap.put("studyno", study.getS_no()); // 스터디 번호 put

		// 15개 게시물만 가져오기
		list = freeBiz.selectPagingBoardList(pageMap);
		// 멤버번호로 작성자 이름 받아오기
		memberMap = freeBiz.getMemberMap(list);
		//댓글 갯수 가져오기 
		replyCntMap = freeBiz.getReplyCnt(list);
		
		//공지사항 게시글 가져오기
		if(pagenum == null || Integer.parseInt(pagenum) == 1) {
			noticeList = noticeBiz.selectNoticeBoard();
			noticeReplyCntMap = noticeBiz.getReplyCnt(noticeList); //공지사항 댓글 갯수 가져오기
			noticeMemberMap = noticeBiz.getMemberMap(noticeList); //공지사항 게시글 작성자 가져오기
			
		}
				
		
		if(pagenum == null || Integer.parseInt(pagenum) == 1) {
			model.addAttribute("noticeList", noticeList);
			model.addAttribute("noticeReplyCntMap", noticeReplyCntMap);
			model.addAttribute("noticeMemberMap", noticeMemberMap);
		}
		model.addAttribute("startPage", pageMap.get("startPage"));
		model.addAttribute("endPage", pageMap.get("endPage"));
		model.addAttribute("currentPage", pageMap.get("currentPage"));
		model.addAttribute("totalPageNum", pageMap.get("totalPageNum"));
		model.addAttribute("list", list);
		model.addAttribute("memberMap", memberMap);
		session.setAttribute("leftnavi", "freeboard");
		model.addAttribute("replyCntMap", replyCntMap);
		return "community/freeboard/freeboard";
	}

	// 자유게시판 글 작성 form 이동
	@RequestMapping("/freewriteform.do")
	public String freewriteform() {
		return "community/freeboard/freewriteform";
	}

	// 자유게시판 글 작성
	@RequestMapping("/freewrite.do")
	public String freewrite(BoardDto board, HttpSession session, HttpServletRequest request, UploadFile uploadFile) {
		int writer = ((MemberDto) session.getAttribute("login")).getMem_no(); // 작성자 번호
		int s_no = ((StudyDto) session.getAttribute("study")).getS_no(); /// 스터디 번호
		int res = 0;
		board.setB_writer(writer);
		board.setS_no(s_no);
		
		//파일 업로드
		MultipartFile[] mfileList =   uploadFile.getFile();  //multipartFile 리스트 반환해서 생성
		
		//파일이있으면
		if(mfileList != null) {
			//	파일요소들 뽑아서 fileList에 저장
			List<FileDto> fileList = fileHandler.getFileList(mfileList, request);//파일리스트 생성		
			String path = fileHandler.getPath(request); //파일이 저장될 가장 기본 폴더
			//글 작성
			res = freeBiz.writeBoard(board, mfileList, path, fileList);
		}else { //파일이 없으면
			res = freeBiz.writeBoard(board);
		}

		if (res > 0) {
			return "redirect:freeboard.do";
		} else {
			return "redirect:freewriteform.do";
		}

	}
		
	// 자유게시판 글 삭제
	@RequestMapping(value = "/freeBoardDelete.do", method = RequestMethod.GET)
	public String freeBoardDelete(HttpServletRequest request, Model model) {
		int b_no = Integer.parseInt(request.getParameter("b_no"));

		int res = freeBiz.deleteBoard(b_no);

		if (res > 0) {
			return "redirect:freeboard.do";
		} else {
			model.addAttribute("msg", "글 삭제 실패!!");
			model.addAttribute("url", "freedetail.do?b_no=" + b_no);
			return "commond/alert";
		}

	}

	// 자유게시판 글 수정 폼으로
	@RequestMapping(value = "/freeBoardUpdateForm.do", method = RequestMethod.GET)
	public String freeBoardUpdateForm(Model model, HttpServletRequest request) {
		int b_no = Integer.parseInt(request.getParameter("b_no"));

		BoardDto dto = freeBiz.selectOne(b_no);
		
		//첨부파일 가져오기
		List<FileDto> fileList = freeFileBiz.getAttachFileList(b_no);
				
		//첨부파일 파일 확장자 구하기
		Map<Integer, String> fileFormatMap = new HashMap<Integer, String>();
		for(int i = 0 ; i < fileList.size(); i++) {
			String[] fileNameList = fileList.get(i).getF_name().split("\\.");
			String fileFormat = fileNameList[fileNameList.length-1];
					
			fileFormat = fileFormat.toLowerCase();
					
			fileFormatMap.put(fileList.get(i).getF_no(), fileFormat);
		}

		model.addAttribute("fileFormatMap", fileFormatMap);
		model.addAttribute("fileList",fileList);
		model.addAttribute("dto", dto);	
				
		return "community/freeboard/freeupdateform";

	}

	// 자유게시판 글 수정
	@RequestMapping("/freeBoardUpdate.do")
	public String freeBoardUpdate(BoardDto dto, Model model, UploadFile uploadFile, HttpServletRequest request) {

		int res = 0;

		//파일 업로드
		MultipartFile[] mfileList =   uploadFile.getFile();  //multipartFile 리스트 반환해서 생성
		//사진이 있으면
		if(mfileList != null) {
			String path = fileHandler.getPath(request);
			List<FileDto> fileList = fileHandler.getFileList(mfileList, request);//파일리스트 생성 파일요소들 뽑아서 fileList에 저장		
			
			//사진이 담겨잇는 게시글 번호 넣어주기
			for(int i = 0 ; i < fileList.size(); i++) {
				fileList.get(i).setB_no(dto.getB_no());
			}
			res = freeBiz.updateBoard(dto, mfileList, path, fileList);
		}else { //사진이 없으면
			res = freeBiz.updateBoard(dto);
		}
		
		if (res > 0) {
			return "redirect:freeboard.do?b_no=" + dto.getB_no();
		} else {
			model.addAttribute("msg", "글 수정 실패!!");
			model.addAttribute("url", "freeBoardUpdateForm.do?b_no=" + dto.getB_no());
			return "commond/alert";
		}
	}

	//자유게시판 글 수정 파일삭제 AJAX
	@RequestMapping(value="/freeFileDelete.do", method=RequestMethod.POST)
	public @ResponseBody int freeFileDelete(@RequestBody FileDto dto) {
		logger.info("[freeFileDelete]");
		
		int res = freeFileBiz.deleteFile(dto.getF_no());
		
		return res;
		
	}
	
	//서머노트 이미지 첨부 AJAX
	@RequestMapping(value="/summernoteImgUpload.do", method=RequestMethod.POST)
	public @ResponseBody String summernoteImgUpload(MultipartHttpServletRequest mreq, HttpServletRequest request) {
		FileOutputStream fos = null;
		Map resMap = new HashMap();
		
		MultipartFile file = mreq.getFile("file");
		String fileName = file.getOriginalFilename().replace(" ", ""); //공백제거
		String fakeName = System.currentTimeMillis()+ fileName;
		String url=null;
		try {
			url = WebUtils.getRealPath(request.getSession().getServletContext() ,"resources\\summernoteImg\\"+fakeName);
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
		System.out.println(url);
		try {
			byte fileData[] = file.getBytes();
			
		
			fos = new FileOutputStream(url);
			fos.write(fileData);
			
		} catch (IOException e) {
			System.out.println("[ERROR] [BoardController] summernoteImgUpload method");
			e.printStackTrace();
		}finally {
			if(fos != null) {
				 try {
					fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			 }
		}
		url = "/img/"+fakeName;
		 try { url = URLEncoder.encode(url,"UTF-8"); } catch
		 (UnsupportedEncodingException e) { e.printStackTrace(); }
		 
		return url;
	}
	
	// 자유게시판 보드디테일
	@RequestMapping(value = "/freedetail.do", method = RequestMethod.GET)
	public String freeDetail(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) {
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		int s_no = ((StudyDto) session.getAttribute("study")).getS_no(); // 스터디 번호
		Map<Integer, MemberDto> memberMap = null; // 최근게시글 멤버정보 담을 MAP
		Map<Integer, Integer> replyCntMap = null;// 댓글 갯수 담을 MAP

		// 조회수 함수 isVisitPage = 1 -> 방문한 적있음 0 -> 없음
		int isVisitPage = pageChecker.chkVisited(request, response, "freeboardvisit", request.getParameter("b_no"));
		BoardDto board = freeBiz.selectDetail(b_no, isVisitPage); // 게시글 가져오기 / 조회수 증가
		MemberDto member = memberBiz.selectOne(board.getB_writer()); // 작성자 이름 가져오기

		List<BoardDto> recentList = freeBiz.getRecentList(s_no, b_no);
		memberMap = freeBiz.getMemberMap(recentList); // 최근게시글 memberMap

		// 댓글 갯수 가져오기
		replyCntMap = freeBiz.getReplyCnt(recentList);
		
		//첨부파일 가져오기
		List<FileDto> fileList = freeFileBiz.getAttachFileList(b_no);
		
		//첨부파일 파일 확장자 구하기
		Map<Integer, String> fileFormatMap = new HashMap<Integer, String>();
		for(int i = 0 ; i < fileList.size(); i++) {
			String[] fileNameList = fileList.get(i).getF_name().split("\\.");
			String fileFormat = fileNameList[fileNameList.length-1];
			
			fileFormat = fileFormat.toLowerCase();
			
			fileFormatMap.put(fileList.get(i).getF_no(), fileFormat);
		}

		model.addAttribute("fileFormatMap", fileFormatMap);
		model.addAttribute("fileList",fileList);
		model.addAttribute("replyCntMap", replyCntMap);
		model.addAttribute("memberMap", memberMap);
		model.addAttribute("recentList", recentList);
		model.addAttribute("dto", board);
		model.addAttribute("member", member);
		return "community/freeboard/freeDetail";
	}
	
	@RequestMapping(value="/calendarView.do", method=RequestMethod.GET)
	public String calendarView(HttpSession session, Model model ) {
		
		
		
		return "community/schedule/test";
	}
	
	//캘린더
	//자유게시판 파일 다운로드
	@RequestMapping(value="/freeFileDown.do", method = RequestMethod.GET)
	public void freeFileDownload(HttpServletResponse response, HttpServletRequest request) {
		int f_no = Integer.parseInt( request.getParameter("f_no") );
		
		FileDto dto = freeFileBiz.getFileByFno(f_no);
		
		if(dto != null) {
			fileHandler.downloadFile(dto,response);
		}
	}
	
	//자유 게시판 검색
	@RequestMapping(value="/free_search.do", method= RequestMethod.POST)
	public String freeSearch(SearchPagination search, Model model,HttpServletRequest request, String pagenum) {
		
		/*
		  			title_content:제목+내용
					title:제목
					content:내용
					writer:작성자
		 
		 */
		System.out.println(search.getKeyword());
		System.out.println(search.getSearchType());
		
		HttpSession session = request.getSession();
		StudyDto study = (StudyDto) session.getAttribute("study"); // 현재 클릭된 스터디
		List<BoardDto> list = null; // 15개 페이징 담을 리스트
		Map<String, Object> pageMap = new HashMap<String, Object>(); // 시작페이지, 끝페이지 정보 담을 MAP
		Map<Integer, MemberDto> memberMap = null; // 게시글 멤버정보 담을 MAP
		Map<Integer, Integer> replyCntMap = null;// 댓글 갯수 담을 MAP
		Map searchMap = new HashMap(); //검색 정보 담은 Map
		
		searchMap.put("s_no",study.getS_no());
		searchMap.put("searchType", search.getSearchType());
		searchMap.put("keyword", search.getKeyword());
		
		int totalBoardNum = freeBiz.selectTotalBoardNumOfSearch(searchMap); // 검색내용 총 게시글 갯수
		System.out.println("qwe 글개수: " + totalBoardNum);
		paging(pageMap, pagenum, totalBoardNum); // 페이징 함수

		pageMap.put("s_no", study.getS_no()); // 스터디 번호 put
		pageMap.put("searchType", search.getSearchType()); //검색 타입
		pageMap.put("keyword", search.getKeyword()); //검색 키워드
		
		// 15개 게시물만 가져오기
		list = freeBiz.selectPagingSearchBoardList(pageMap);
		// 멤버번호로 작성자 이름 받아오기
		memberMap = freeBiz.getMemberMap(list);

		// 댓글 갯수 가져오기
		replyCntMap = freeBiz.getReplyCnt(list);

		model.addAttribute("startPage", pageMap.get("startPage"));
		model.addAttribute("endPage", pageMap.get("endPage"));
		model.addAttribute("currentPage", pageMap.get("currentPage"));
		model.addAttribute("totalPageNum", pageMap.get("totalPageNum"));
		model.addAttribute("list", list);
		model.addAttribute("memberMap", memberMap);
		session.setAttribute("leftnavi", "freeboard");
		model.addAttribute("replyCntMap", replyCntMap);
		
		model.addAttribute("search", search);
		return "community/freeboard/freeboardsearch";
	}
	
	//켈린더
	@RequestMapping(value="/calendar.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	Map<String, Object> calendar(HttpServletRequest request, Model model, HttpServletResponse response, HttpSession session, MeetDto dto) {
		int s_no = ((StudyDto)session.getAttribute("study")).getS_no(); //스터디 번호
		logger.info("calendar");

		List<MeetDto> meetList = meetBiz.selectMeetDBForCalendar(s_no);
		Map<String, Object> calendarMap = new HashMap<String, Object>();
		
		
		calendarMap.put("meetList", meetList);
		
		return calendarMap;
	}
		
	// 페이징 함수
	public void paging(Map pagingMap, String pageNum, int totalBoardNum) {

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



}
