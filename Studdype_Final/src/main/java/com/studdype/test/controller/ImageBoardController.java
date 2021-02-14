package com.studdype.test.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.common.FileHandler;
import com.studdype.test.common.PageMaker;
import com.studdype.test.common.SearchPagination;
import com.studdype.test.common.UploadFile;
import com.studdype.test.model.biz.board.photoBoardBiz;
import com.studdype.test.model.biz.file.photoFileBiz;
import com.studdype.test.model.biz.member.MemberBiz;
import com.studdype.test.model.dto.board.BoardDto;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.study.StudyDto;

@Controller
public class ImageBoardController {
	@Autowired
	private photoBoardBiz photoBiz;

	@Autowired
	private photoFileBiz photoFileBiz;
	
	@Autowired
	private MemberBiz memberBiz;

	private FileHandler fileHandler = new FileHandler();
	private static final Logger logger = LoggerFactory.getLogger(ImageBoardController.class);


	@RequestMapping(value = "/gallery.do", method = RequestMethod.GET)
	public String list(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, @ModelAttribute("searchPagination") SearchPagination searchPagination) {
		StudyDto study = (StudyDto) session.getAttribute("study"); // 현재 클릭된 스터디
		searchPagination.setS_no(study.getS_no());
		logger.info("photo - photoList");
		List<BoardDto> photoList = null; //갤러리리스트 담을곳
		List<FileDto> attachImage = null;
		Map<String, Integer> pageMap = new HashMap<String, Integer>();
		photoList = photoBiz.galleryList(searchPagination);
		attachImage = photoBiz.attachImageList();
		for(int i=0; i<photoList.size(); i++) {
			attachImage.get(i).setF_url(fileHandler.getFileName(attachImage.get(i).getF_url(), "Studdype_Final"));
			
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPagination(searchPagination);
		pageMaker.setTotalCount(photoBiz.totalGalleryListNum(searchPagination));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("galleryList", photoList);
		model.addAttribute("attachImage", attachImage);
		session.setAttribute("leftnavi", "gallery");
		
		return "community/gallery/gallery";
	}
	
	//갤러리 디테일페이지
	@RequestMapping(value= "/galleryDetail.do", method = RequestMethod.GET)
	public String detail(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		int s_no = ((StudyDto) session.getAttribute("study")).getS_no();
		Map<Integer, Integer> replyCntMap = null;
		Map<Integer, MemberDto> memberMap = null;
		
		
		BoardDto detail = null; 
		List<FileDto> fileDetail = null;
		String galleryWriter = "";
		
		List<BoardDto> recentList = photoBiz.getRecentList(s_no, b_no);
		memberMap = photoBiz.getMemberMap(recentList);
		replyCntMap = photoBiz.getReplyCnt(recentList);
		
		detail = photoBiz.galleryDetailOne(b_no);
		fileDetail = photoFileBiz.galleryDetailFile(b_no);
		galleryWriter = memberBiz.getNameByNo(detail.getB_writer());
		for(int i=0; i<fileDetail.size(); i++) {
			 fileDetail.get(i).setF_url(fileHandler.getFileName(fileDetail.get(i).getF_url(), "Studdype_Final"));
		}
		System.out.println("글쓴이 번호: " +detail.getB_writer());
		
		model.addAttribute("memberMap", memberMap);
		model.addAttribute("replyCntMap",replyCntMap);
		model.addAttribute("recentList", recentList);
		model.addAttribute("galleryWriter", galleryWriter);
		model.addAttribute("detail", detail);
		model.addAttribute("fileDetail", fileDetail);
		if(fileDetail.size() > 6) {
			return "community/gallery/galleryDetail";
		} else {
			return "community/gallery/galleryDetailFew";
		}
	}
	
	//갤러리 글작성페이지
	@RequestMapping("/gallerywriteform.do")
	public String galleryWriteForm(HttpSession session) {
		return "community/gallery/galleryWriteForm";
	}

	@RequestMapping("/gallerywrite.do")
	public String gallerywrite(Model model, BoardDto boardDto, HttpSession session, HttpServletRequest request,
			UploadFile uploadFile) {
		int writer_no = ((MemberDto) session.getAttribute("login")).getMem_no();
		int s_no = ((StudyDto) session.getAttribute("study")).getS_no();
		int res = 0;

		boardDto.setB_writer(writer_no);
		boardDto.setS_no(s_no);
		
		MultipartFile[] mfileList = uploadFile.getFile(); // multipartFile 리스트 생성
		
		if (mfileList != null) {
			List<FileDto> fileList = fileHandler.getGalleryList(mfileList, request);
			fileList.get(0).setPhoto_ismain("Y");
			String path = fileHandler.getPath(request);
			
			res = photoBiz.writeGallery(boardDto, mfileList, path, fileList);
			
		} else {
			return "commond/alert";
		}
		if (res > 0) {
			model.addAttribute("msg","글 작성을 완료했습니다.");
			model.addAttribute("url","gallery.do");
			return "commond/alert";
		} else {
			return "redirect:gallerywriteform.do";
		}
	}
	
	@RequestMapping(value = "/gallerydelete.do", method = RequestMethod.GET)
	public String galleryDelete(HttpServletRequest request, Model model) {
		int b_no = Integer.parseInt(request.getParameter("b_no"));

		int res = photoBiz.deleteGallery(b_no);

		if (res > 0) {
			return "redirect:gallery.do";
		} else {
			model.addAttribute("msg", "글 삭제 실패!!");
			model.addAttribute("url", "galleryDetail.do?b_no=" + b_no);
			return "commond/alert";
		}
	}
	
	//자유게시판 글 수정 파일삭제 AJAX
	@RequestMapping(value="/galleryFileDelete.do", method=RequestMethod.POST)
	public @ResponseBody int freeFileDelete(@RequestBody FileDto dto) {
		logger.info("[galleryFileDelete]");
		
		int res = photoFileBiz.deleteGalleryFile(dto.getF_no());
		
		return res;
		
	}
	
	@RequestMapping(value = "/galleryupdateform.do", method = RequestMethod.GET)
	public String galleryUpdateForm(Model model, HttpServletRequest request) {
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		BoardDto galleryDto = photoBiz.galleryDetailOne(b_no);
		List<FileDto> fileList = photoFileBiz.galleryDetailFile(b_no);
		
		//첨부파일 확장자 이미지
		Map<Integer, String> fileFormatMap = new HashMap<Integer, String>();
		for(int i = 0 ; i < fileList.size(); i++) {
			String[] fileNameList = fileList.get(i).getF_name().split("\\.");
			String fileFormat = fileNameList[fileNameList.length-1];
					
			fileFormat = fileFormat.toLowerCase();
					
			fileFormatMap.put(fileList.get(i).getF_no(), fileFormat);
		}
		
		model.addAttribute("fileFormatMap", fileFormatMap);
		model.addAttribute("fileList",fileList);
		model.addAttribute("dto", galleryDto);	
		
		return "community/gallery/galleryUpdateForm";
	}
	
	@RequestMapping(value="/galleryupdate.do")
	public String galleryUpdate(BoardDto dto, Model model, UploadFile uploadFile, HttpServletRequest request) {

		int res = 0;
		//파일 업로드
		MultipartFile[] mfileList = uploadFile.getFile();  //multipartFile 리스트 반환해서 생성
		//사진이 있으면
		if(mfileList != null) {
			String path = fileHandler.getPath(request);
			List<FileDto> fileList = fileHandler.getFileList(mfileList, request);//파일리스트 생성 파일요소들 뽑아서 fileList에 저장		
			//사진이 담겨잇는 게시글 번호 넣어주기
			for(int i = 0 ; i < fileList.size(); i++) {
				fileList.get(i).setB_no(dto.getB_no());
			}
			res = photoBiz.updateGallery(dto, mfileList, path, fileList);
		}
		
		if (res > 0) {
			return "redirect:galleryDetail.do?b_no=" + dto.getB_no();
		} else {
			model.addAttribute("msg", "글 수정 실패!!");
			model.addAttribute("url", "galleryupdateform.do?b_no=" + dto.getB_no());
			return "commond/alert";
		}
	}
}
