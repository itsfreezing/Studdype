package com.studdype.test.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.studdype.test.common.FileHandler;
import com.studdype.test.common.UploadFile;
import com.studdype.test.model.biz.board.BookBiz;
import com.studdype.test.model.biz.board.FreeBiz;
import com.studdype.test.model.biz.board.MeetBiz;
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
	ServletContext context;
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private final static int pageSize = 15; // 한페이지에 보여줄 개수
	private final static int pageGroupSize = 5; // 페이지 그룹 사이즈

	private final static int bookPageSize = 4; // 도서 한 페이지에서 보여줄 도서 개수
	private FileHandler fileHandler = new FileHandler();

	// 자유게시판 리스트 이동
	@RequestMapping("/freeboard.do")
	public String freeBoard(HttpSession session, String pagenum, Model model) {
		StudyDto study = (StudyDto) session.getAttribute("study"); // 현재 클릭된 스터디
		List<BoardDto> list = null; // 15개 페이징 담을 리스트
		Map<String, Integer> pageMap = new HashMap<String, Integer>(); // 시작페이지, 끝페이지 정보 담을 MAP
		Map<Integer, MemberDto> memberMap = null; // 게시글 멤버정보 담을 MAP
		Map<Integer, Integer> replyCntMap = null;// 댓글 갯수 담을 MAP

		int totalBoardNum = freeBiz.selectTotalBoardNum(study.getS_no()); // 총 자유게시판 글 갯수

		paging(pageMap, pagenum, totalBoardNum); // 페이징 함수

		pageMap.put("studyno", study.getS_no()); // 스터디 번호 put

		// 15개 게시물만 가져오기
		list = freeBiz.selectPagingBoardList(pageMap);
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
		int isVisitPage = chkVisited(request, response, "freeboardvisit", request.getParameter("b_no"));

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
	
	//자유게시판 파일 다운로드
	@RequestMapping(value="/freeFileDown.do", method = RequestMethod.GET)
	public void freeFileDownload(HttpServletResponse response, HttpServletRequest request) {
		int f_no = Integer.parseInt( request.getParameter("f_no") );
		
		FileDto dto = freeFileBiz.getFileByFno(f_no);
		
		if(dto != null) {
			fileHandler.downloadFile(dto,response);
		}
	}
	//켈린더
	@RequestMapping(value="/calendar.do", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody Map calendar(@RequestBody MeetDto dto) {
		logger.info("calendar");
		Map calendarMap = new HashMap();
		List<MeetDto> meetList = null;
		
		meetList = meetBiz.selectMeetDBForCalendar(dto.getS_no());
		
		calendarMap.put("meetList", meetList);
		
		
		
		return calendarMap;
	}
	/*
	 * public String calendar(Model model, HttpSession session, HttpServletResponse
	 * response) { StudyDto study = (StudyDto)session.getAttribute("study"); // 현재
	 * 클릭 된 스터디 Map<String, MeetDto> calendarMap = new HashMap<String, MeetDto>();
	 * calendarMap.put("evt1", new
	 * MeetDto(1,1,"test","2021-01-22","2021-01-11","2021-01-20"));
	 * System.out.println(calendarMap); model.addAttribute("meetList",calendarMap);
	 * 
	 * return "community/schedule/calendar"; }
	 */

	/////////////////////////////////////////////////////////////////////////////
	// [도서 게시판] Controller
	
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
		Map<Integer, MemberDto> writerNameMap = null;// 게시글 작성자 이름 담을 MAP

		// 4개 게시물만 가져오기
		list = bookBiz.selectSearchBookList(study.getS_no());
		// 멤버번호로 작성자 이름/아이디 받아오기
		writerNameMap = bookBiz.getWriterNameByList(list);

		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}

		model.addAttribute("list", list);
		model.addAttribute("writerMap", writerNameMap);

		return "community/book/searchBook";
	}

	@RequestMapping(value = "/bookDetailform.do", method = RequestMethod.GET)
	public String bookDetailForm(HttpSession session, Model model, int b_no) {
		StudyDto study = (StudyDto) session.getAttribute("study");
		Map<Integer, MemberDto> writerNameMap = null;// 게시글 작성자 이름 담을 MAP

		BookDto dto = new BookDto();
		dto.setS_no(study.getS_no());
		dto.setB_no(b_no);

		BookDto detailBookDto = bookBiz.selectOneBook(dto);

		// 멤버번호로 작성자 이름/아이디 받아오기
		writerNameMap = bookBiz.getBookWriterName(detailBookDto.getB_writer());
		
		model.addAttribute("detailBookDto", detailBookDto);
		model.addAttribute("writerNameMap", writerNameMap);
		
		return "community/book/bookDetailform";
	}
	
	@RequestMapping("/registerBook.do")
	public String registerBook() {
		return "community/book/registerBook";
	}
	
	@RequestMapping(value="/regitsterSearchBookList.do", method=RequestMethod.POST)
	public String registerSearchBookList() {
		
		return "community/book/registerBook";
	}
	
	@RequestMapping(value="/bookList.do", method=RequestMethod.POST)
	public String bookList(@RequestParam(value="bookList[]") List<List<String>> bookList) {
		
		return "community/book/registerBook";
	}

	// 페이징 함수
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

	// 한게시글에 하루에 1번만 조회수 함수
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
			response.addCookie(cookie); // 쿠키 추가
		}

		return isVisitPage;
	}

	// 페이징 함수
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

}
