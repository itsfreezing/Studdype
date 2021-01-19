package com.studdype.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.common.FileHandler;
import com.studdype.test.common.PageChecker;
import com.studdype.test.common.UploadFile;
import com.studdype.test.model.biz.board.NoticeBiz;
import com.studdype.test.model.biz.file.NoticeFileBiz;
import com.studdype.test.model.biz.member.MemberBiz;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.study.StudyDto;

@Controller
public class NoticeBoardController {
	
	@Autowired
	private NoticeBiz noticeBiz;
	@Autowired
	private MemberBiz memberBiz;
	@Autowired
	private NoticeFileBiz noticeFileBiz;
	
	private FileHandler fileHandler = new FileHandler();
	private PageChecker pageChecker = new PageChecker();
	
	//공지사항 게시판 이동
	@RequestMapping("/notice.do")
	public String notice(HttpSession session, Model model) {
		StudyDto study = (StudyDto) session.getAttribute("study"); // 현재 클릭된 스터디
		List<BoardDto> list = null;// 공지사항 담을 리스트
		Map<Integer, Integer> replyCntMap = null;// 댓글 갯수 담을 MAP
		Map<Integer, MemberDto> memberMap = null; // 게시글 멤버정보 담을 MAP
		
		list=noticeBiz.selectNoticeBoardList(study.getS_no()); //공지사항 게시글
		replyCntMap = noticeBiz.getReplyCnt(list);
		memberMap = noticeBiz.getMemberMap(list);
		
		model.addAttribute("list", list);
		model.addAttribute("memberMap", memberMap);
		model.addAttribute("replyCntMap", replyCntMap);
		session.setAttribute("leftnavi", "notice");
		return "community/notice/noticeboard";
	}
	
	// 공지사항 글 작성 form 이동
	@RequestMapping("/noticewriteform.do")
	public String freewriteform(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		StudyDto study = (StudyDto) session.getAttribute("study"); // 현재 클릭된 스터디
		int noticeNum = noticeBiz.getNoticeNum(study.getS_no());
		if(noticeNum > 9) {
			model.addAttribute("msg", "공지사항은 10개까지 작성 할 수 있습니다.");
			model.addAttribute("url", "notice.do");
			return "commond/alert";
		}
		return "community/notice/noticewriteform";
	}

	// 공지사항 글 작성
	@RequestMapping("/noticewrite.do")
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
			res = noticeBiz.writeBoard(board, mfileList, path, fileList);
		}else { //파일이 없으면
			res = noticeBiz.writeBoard(board);
		}

		if (res > 0) {
			return "redirect:notice.do";
		} else {
			return "redirect:noticewriteform.do";
		}

	}
	
	// 공지사항 게시판 보드디테일
		@RequestMapping(value = "/noticedetail.do", method = RequestMethod.GET)
		public String freeDetail(HttpServletRequest request, HttpServletResponse response, Model model,
				HttpSession session) {
			
			int b_no = Integer.parseInt(request.getParameter("b_no"));
			int s_no = ((StudyDto) session.getAttribute("study")).getS_no(); // 스터디 번호
			Map<Integer, MemberDto> memberMap = null; // 최근게시글 멤버정보 담을 MAP
			Map<Integer, Integer> replyCntMap = null;// 댓글 갯수 담을 MAP

			// 조회수 함수 isVisitPage = 1 -> 방문한 적있음 0 -> 없음
			int isVisitPage = pageChecker.chkVisited(request, response, "noticeboardvisit", request.getParameter("b_no"));
			
			BoardDto board = noticeBiz.selectDetail(b_no, isVisitPage); // 게시글 가져오기 / 조회수 증가
			MemberDto member = memberBiz.selectOne(board.getB_writer()); // 작성자 이름 가져오기

			//List<BoardDto> recentList = noticeBiz.getRecentList(s_no, b_no);
			//memberMap = noticeBiz.getMemberMap(recentList); // 최근게시글 memberMap

			// 댓글 갯수 가져오기
			//replyCntMap = noticeBiz.getReplyCnt(recentList);
			
			//첨부파일 가져오기
			List<FileDto> fileList = noticeFileBiz.getAttachFileList(b_no);
			
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
			//model.addAttribute("replyCntMap", replyCntMap);
			//model.addAttribute("memberMap", memberMap);
			//model.addAttribute("recentList", recentList);
			model.addAttribute("dto", board);
			model.addAttribute("member", member);
			return "community/notice/noticeDetail";
		}
		
		//공지게시판 파일 다운로드
		@RequestMapping(value="/noticeFileDown.do", method = RequestMethod.GET)
		public void freeFileDownload(HttpServletResponse response, HttpServletRequest request) {
			int f_no = Integer.parseInt( request.getParameter("f_no") );
			
			FileDto dto = noticeFileBiz.getFileByFno(f_no);
			
			if(dto != null) {
				fileHandler.downloadFile(dto,response);
			}
		}
		
	
}
