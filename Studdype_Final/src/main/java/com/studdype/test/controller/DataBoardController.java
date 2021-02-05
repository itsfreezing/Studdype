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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.common.FileHandler;
import com.studdype.test.common.PageChecker;
import com.studdype.test.common.SearchPagination;
import com.studdype.test.common.UploadFile;
import com.studdype.test.model.biz.board.DataBiz;
import com.studdype.test.model.biz.board.NoticeBiz;
import com.studdype.test.model.biz.file.DataFileBiz;
import com.studdype.test.model.biz.file.NoticeFileBiz;
import com.studdype.test.model.biz.member.MemberBiz;
import com.studdype.test.model.biz.reply.DataReplyBiz;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.study.StudyDto;

@Controller
public class DataBoardController {
	private static final Logger logger = LoggerFactory.getLogger(DataBoardController.class);
	
	@Autowired
	private DataBiz dataBiz;
	@Autowired
	private NoticeBiz noticeBiz;
	@Autowired
	private DataFileBiz dataFileBiz;
	@Autowired
	private DataReplyBiz dataReplyBiz;
	@Autowired
	private NoticeFileBiz noticeFileBiz;
	@Autowired
	private MemberBiz memberBiz;
	
	private final static int pageSize = 15;	
	private final static int pageGroupSize = 5;
	
	private FileHandler fileHandler = new FileHandler();
	private PageChecker pageChecker = new PageChecker();
	
	// 학습 자료실 리스트 
	@RequestMapping("/dataBoard.do")
	public String dataBoard(HttpSession session, Model model, String pagenum) {
		StudyDto study = (StudyDto)session.getAttribute("study"); 
		List<BoardDto> dataList = null;	// 한페이지 리스트
		List<BoardDto> noticeList = null; // 공지사항 리스트
		Map<String, Integer> pageMap = new HashMap<String, Integer>();	// 시작, 끝 페이지 Map
		Map<Integer, MemberDto> memberMap = null;	// 게시글 작성자 Map
		Map<Integer, MemberDto> noticeMemberMap = null;	// 공시자항 작성자 Map
		Map<Integer, Integer> replyCntMap = null;	// 댓글 갯수 Map
		Map<Integer, Integer> noticeReplyCntMap = null;	//공지사항 댓글 갯수 Map
		Map<Integer, List<FileDto>> dataFileMap = null; // 학습 자료실 파일 리스트
		
		int totalBoardNum = dataBiz.selectTotalBoardNum(study.getS_no()); // 자료실 총 글 갯수
		
		paging(pageMap, pagenum, totalBoardNum); // 페이징 함수
		
		pageMap.put("studyno", study.getS_no()); // 스터디 번호
		
		// 게시물 15개 가져오기
		dataList = dataBiz.selectPagingBoardList(pageMap);	
		// 멤버번호로 작성자 이름 받아오기
		memberMap = dataBiz.getMemberMap(dataList);
		// 댓글 갯수 가져오기
		replyCntMap = dataBiz.getReplyCnt(dataList);
		
		// 공지사항 게시글 가져오기
		if(pagenum == null || Integer.parseInt(pagenum) == 1) {
			noticeList = noticeBiz.selectNoticeBoard(study.getS_no());
			noticeReplyCntMap = noticeBiz.getReplyCnt(noticeList); // 공지사항 댓글 갯수 가져오기
			noticeMemberMap = noticeBiz.getMemberMap(noticeList); // 공지사항 게시글 작성자 가져오기
			// 공지사항 파일 받아오기
			Map<Integer, List<FileDto>> noticeFileMap = noticeFileBiz.getBoardFileList(noticeList);
			
			Map<Integer, List> noticeFileFormatMap = new HashMap<Integer, List>();
			for(int j = 0; j < noticeList.size(); j++) {
				List list = new ArrayList();
				for(int i = 0; i < noticeFileMap.get(noticeList.get(j).getB_no()).size(); i++) {
					String[] noticeFileNameList = noticeFileMap.get(noticeList.get(j).getB_no()).get(i).getF_name().split("\\.");
					String fileFormat = noticeFileNameList[noticeFileNameList.length-1];
					
					fileFormat = fileFormat.toLowerCase();
					
					list.add(fileFormat);
				}
				noticeFileFormatMap.put(noticeList.get(j).getB_no(), list);
			}
			
			model.addAttribute("noticeFileMap", noticeFileMap);
			model.addAttribute("noticeFileFormatMap", noticeFileFormatMap);
			
		}
		
		// 학습자료실 파일 받아오기
		if(dataList != null) {
			dataFileMap = dataFileBiz.getBoardFileList(dataList);
		}
		
		// 학습 자료실 파일 포멧팅 정보
		Map<Integer, List> dataFileFormatMap = new HashMap<Integer, List>();
		
		if(dataFileMap != null) {
			for(int i = 0; i < dataList.size(); i++) {
				List list = new ArrayList();
				for(int j = 0; j < dataFileMap.get(dataList.get(i).getB_no()).size(); j++) {
					String[] dataFileNameList = dataFileMap.get(dataList.get(i).getB_no()).get(j).getF_name().split("\\.");
					String fileFormat = dataFileNameList[dataFileNameList.length-1];
					
					fileFormat = fileFormat.toLowerCase();
					
					list.add(fileFormat);
				}
				dataFileFormatMap.put(dataList.get(i).getB_no(), list);
			}
		}
		
		// 공지사항 첫페이지 처리
		if(pagenum == null || Integer.parseInt(pagenum) == 1) {
			model.addAttribute("noticeList", noticeList);
			model.addAttribute("noticeReplyCntMap", noticeReplyCntMap);
			model.addAttribute("noticeMemberMap", noticeMemberMap);
		}
		
		model.addAttribute("dataFileMap", dataFileMap);
		model.addAttribute("dataFileFormatMap", dataFileFormatMap);
		model.addAttribute("startPage", pageMap.get("startPage"));
		model.addAttribute("endPage", pageMap.get("endPage"));
		model.addAttribute("currentPage", pageMap.get("currentPage"));
		model.addAttribute("totalPageNum", pageMap.get("totalPageNum"));
		model.addAttribute("dataList", dataList);
		model.addAttribute("memberMap", memberMap);
		session.setAttribute("leftnavi", "dataBoard");
		model.addAttribute("replyCntMap", replyCntMap);
		
		return "community/data/dataBoard";
	}
	
	// 학습자료실 파일 다운로드
	@RequestMapping("dataFileDownload.do")
	public void dataFileDownLoad(HttpServletResponse response, HttpServletRequest request) {
		int f_no = Integer.parseInt( request.getParameter("f_no") );
		
		FileDto dto = dataFileBiz.getFileByFno(f_no);
		
		System.out.println(dto.getF_name());
		
		if(dto != null) {
			fileHandler.downloadFile(dto,response);
		}
	}
	
	// 학습자료실 디테일 페이지
	@RequestMapping("/dataDetail.do")
	public String dataDetail(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {
		
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		// 조회수 함수 isVisitPage = 1 -> 방문한 적있음 0 -> 없음
		int isVisitPage = pageChecker.chkVisited(request, response, "dataBoardvisit", request.getParameter("b_no"));
		BoardDto dataDto = dataBiz.selectDetail(b_no, isVisitPage); // 조회수 / 해당 게시물 가져오기
		MemberDto member = memberBiz.selectOne(dataDto.getB_writer()); // 작성자 정보가져오기
		
		// 첨부파일 가져오기
		List<FileDto> fileList = dataFileBiz.getAttachFileList(b_no);
		
		// 첨부파일 파일 확장자 구하기
		Map<Integer, String> fileFormatMap = new HashMap<Integer, String>();
		for(int i = 0 ; i < fileList.size(); i++) {
			String[] fileNameList = fileList.get(i).getF_name().split("\\.");
			String fileFormat = fileNameList[fileNameList.length-1];
			
			fileFormat = fileFormat.toLowerCase();
			
			fileFormatMap.put(fileList.get(i).getF_no(), fileFormat);
		}
		
		model.addAttribute("dataDto", dataDto);
		model.addAttribute("member", member);
		model.addAttribute("fileList", fileList);
		model.addAttribute("fileFormatMap", fileFormatMap);
		
		return "community/data/dataDetail";
	}
	
	// 학습자료실 게시글 삭제
	@RequestMapping(value="/dataBoardDelete.do", method=RequestMethod.GET)
	public String dataBoardDelete(HttpServletRequest request, Model model) {
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		int res = dataBiz.deleteBoard(b_no); 
		
		if(res > 0) {
			return "redirect:dataBoard.do";
		}else {
			model.addAttribute("msg", "글 삭제 실패");
			model.addAttribute("url", "dataDetail.do?b_no=" + b_no);
			return "commond/alert";
		}
				
	}
	
	// 학습자료실 게시글 작성 form
	@RequestMapping("/dataBoardWriteForm")
	public String dataBoardWriteForm() {
		return "community/data/dataWriteForm";
	}
	
	// 학습자료실 게시글 작성
	@RequestMapping(value="/dataWrite.do", method=RequestMethod.POST)
	public String dataWrite(BoardDto board, HttpSession session, HttpServletRequest request, UploadFile uploadFile) {
		int writer = ((MemberDto)session.getAttribute("login")).getMem_no(); // 작성자 번호
		int s_no = ((StudyDto)session.getAttribute("study")).getS_no();
		int res = 0;
		
		board.setB_writer(writer);
		board.setS_no(s_no);
		
		//파일 업로드
		MultipartFile[] mfileList =   uploadFile.getFile();  //multipartFile 리스트 반환해서 생성
		
		if(mfileList != null) {
			// 파일요소들 뽑아서 fileList에 저장
			List<FileDto> fileList = fileHandler.getFileList(mfileList, request);//파일리스트 생성		
			String path = fileHandler.getPath(request); //파일이 저장될 가장 기본 폴더
			
			// 글 작성
			res = dataBiz.writeBoard(board, mfileList, path, fileList);
		}else {
			res = dataBiz.writeBoard(board);
		}
		
		if(res > 0) {
			return "redirect:dataBoard.do";
		}else {
			return "redirect:dataBoardWriteForm.do";
		}
	}
	
	// 학급자료실 게시글 수정
	@RequestMapping(value="/dataBoardUpdateForm.do", method=RequestMethod.GET)
	public String dataBoardUpdateForm(HttpServletRequest request, Model model) {
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		BoardDto dataDto = dataBiz.selectOne(b_no);
		
		//첨부파일 가져오기
		List<FileDto> fileList = dataFileBiz.getAttachFileList(b_no);
		
		// 첨부파일 파일 확장자 구하기
		Map<Integer, String> fileFormatMap = new HashMap<Integer, String>();
		for(int i = 0 ; i < fileList.size(); i++) {
			String[] fileNameList = fileList.get(i).getF_name().split("\\.");
			String fileFormat = fileNameList[fileNameList.length-1];
					
			fileFormat = fileFormat.toLowerCase();
					
			fileFormatMap.put(fileList.get(i).getF_no(), fileFormat);
		}
		
		model.addAttribute("fileFormatMap", fileFormatMap);
		model.addAttribute("fileList",fileList);
		model.addAttribute("dataDto", dataDto);	
		
		return "community/data/dataUpdateForm";
	}
	
	// 학습자료실 글 수정 파일 삭제 AJAX
	@RequestMapping(value="/dataFileDelete.do", method=RequestMethod.POST)
	public @ResponseBody int dataFileDelete(@RequestBody FileDto dto) {
		logger.info("[dataFileDelete]");
		
		int res = dataFileBiz.deleteFile(dto.getF_no());
		
		return res;
	}
	
	// 학습자료실 글 수정
	@RequestMapping("/dataBoardUpdate.do")
	public String dataBoardUpdte(BoardDto dto, Model model, UploadFile uploadFile, HttpServletRequest request) {
		int res = 0;
		
		MultipartFile[] mfileList = uploadFile.getFile(); // 파일리스트 반환해서 생성 
		
		// 파일이 있을 시
		if(mfileList != null) {
			String path = fileHandler.getPath(request);
			// 파일 리스트 생성 파일 요소를 뽑아서 fileList에 저장
			List<FileDto> fileList = fileHandler.getFileList(mfileList, request);
			
			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setB_no(dto.getB_no());
			}
			
			res = dataBiz.updateBoard(dto, mfileList, path, fileList);
		}else {
			res = dataBiz.updateBoard(dto);
		}
		
		if(res > 0) {
			return "redirect:dataDetail.do?b_no"+dto.getB_no();
		}else {
			model.addAttribute("msg", "글 수정 실패");
			model.addAttribute("url", "dataBoardUpdateForm.do?b_no=" + dto.getB_no());
			return "commond/alert";
		}
		
	}
	
	// 학습자료실 검색
	@RequestMapping(value="/data_search.do", method=RequestMethod.POST)
	public String dataSearch(SearchPagination search, String pagenum , Model model
								, HttpServletRequest request, HttpSession session ) {
		/*
		 	(검색창 select option 값 가져옴)
			title_content:제목+내용
			title:제목
			content:내용
			writer:작성자
		 */
		
		StudyDto study = (StudyDto)session.getAttribute("study");
		List<BoardDto> dataList = null; // 페이징 시 15개 게시글 리스트
		Map<String, Object> pageMap = new HashMap<String, Object>(); // 시작, 끝 페이지 정보 Map
		Map<Integer, MemberDto> memberMap = null; // 게시글 작성자 정보 Map
		Map<Integer, Integer> replyCntMap = null; // 댓글 갯수 Map
		Map searchMap = new HashMap(); // 검색 정보 Map
		Map<Integer, List<FileDto>> dataFileMap = null; // 학습 자료실 파일 리스트
		
		searchMap.put("s_no", study.getS_no());
		searchMap.put("searchType", search.getSearchType());
		searchMap.put("keyword", search.getKeyword());
		
		int totalBoardNum = dataBiz.selectTotalBoardNumOfSearch(searchMap); // 검색 내용 총 게시글 갯수
		
		paging(pageMap, pagenum, totalBoardNum); // 페이징 함수
		
		pageMap.put("s_no", study.getS_no());
		pageMap.put("searchType", search.getSearchType());
		pageMap.put("keyword", search.getKeyword());
		
		// 게시글 정보
		dataList = dataBiz.selectPagingSearchBoardList(pageMap);
		
		// 작성자 정보
		memberMap = dataBiz.getMemberMap(dataList);
		// 댓글 갯수 
		replyCntMap = dataBiz.getReplyCnt(dataList);
		
		// 학습자료실 파일 받아오기
		if(dataList != null) {
			dataFileMap = dataFileBiz.getBoardFileList(dataList);
		}
				
		// 학습 자료실 파일 포멧팅 정보
		Map<Integer, List> dataFileFormatMap = new HashMap<Integer, List>();
				
		if(dataFileMap != null) {
			for(int i = 0; i < dataList.size(); i++) {
				List list = new ArrayList();
				for(int j = 0; j < dataFileMap.get(dataList.get(i).getB_no()).size(); j++) {
					String[] dataFileNameList = dataFileMap.get(dataList.get(i).getB_no()).get(j).getF_name().split("\\.");
					String fileFormat = dataFileNameList[dataFileNameList.length-1];
					
					fileFormat = fileFormat.toLowerCase();
						
					list.add(fileFormat);
				}
				dataFileFormatMap.put(dataList.get(i).getB_no(), list);
			}
		}
		
		model.addAttribute("startPage", pageMap.get("startPage"));
		model.addAttribute("endPage", pageMap.get("endPage"));
		model.addAttribute("currentPage", pageMap.get("currentPage"));
		model.addAttribute("totalPageNum", pageMap.get("totalPageNum"));
		model.addAttribute("dataList", dataList);
		model.addAttribute("memberMap", memberMap);
		session.setAttribute("leftnavi", "freeboard");
		model.addAttribute("replyCntMap", replyCntMap);
		model.addAttribute("dataFileMap", dataFileMap);
		model.addAttribute("dataFileFormatMap", dataFileFormatMap);
		
		model.addAttribute("search", search);
		
		return "community/data/dataBoardSearch";
		
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
			int totalPageNum = (int) Math.ceil((double)totalBoardNum / pageSize); // 총페이지 개수

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
