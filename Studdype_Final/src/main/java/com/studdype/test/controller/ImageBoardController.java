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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.common.FileHandler;
import com.studdype.test.common.PageMaker;
import com.studdype.test.common.SearchPagination;
import com.studdype.test.common.UploadFile;
import com.studdype.test.model.biz.board.photoBoardBiz;
import com.studdype.test.model.biz.file.photoFileBiz;
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
		attachImage = photoBiz.attachImageList(photoList.get(0).getB_no());
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPagination(searchPagination);
		pageMaker.setTotalCount(photoBiz.totalGalleryListNum(searchPagination));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("galleryList", photoList);
		model.addAttribute("attachImage", attachImage.get(0).getF_name());
		
		return "community/gallery/gallery";
	}
	
	//갤러리 디테일페이지
	@RequestMapping(value= "/galleryDetail.do", method = RequestMethod.GET)
	public String detail(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		int s_no = ((StudyDto) session.getAttribute("study")).getS_no();
		System.out.println("detail: "+b_no);
		Map<Integer, MemberDto> memberMap = null; 
		Map<Integer, Integer> replyCntMap = null;
		BoardDto detail = null; 
		List<FileDto> fileDetail = null;
		detail = photoBiz.galleryDetailOne(b_no);
		fileDetail = photoFileBiz.galleryDetailFile(b_no);
		
		System.out.println(fileDetail.get(0).getF_url());
		
		
		
		model.addAttribute("detail", detail);
		model.addAttribute("fileDetail", fileDetail);
		
		return "community/gallery/galleryDetail";
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
		Date date = new Date();
		System.out.println((MemberDto) session.getAttribute("login"));
		System.out.println((StudyDto) session.getAttribute("study"));

		boardDto.setB_writer(writer_no);
		boardDto.setS_no(s_no);
		
		MultipartFile[] mfileList = uploadFile.getFile(); // multipartFile 리스트 생성
		
		if (mfileList != null) {
			List<FileDto> fileList = fileHandler.getGalleryList(mfileList, request);
			fileList.get(0).setPhoto_ismain("Y");
			String path = fileHandler.getPath(request);
			
			res = photoBiz.writeGallery(boardDto, mfileList, path, fileList);
			
		} else {
			res = photoBiz.writeGallery(boardDto);
		}
		if (res > 0) {
			return "redirect:gallery.do";
		} else {
			return "redirect:gallerywriteform.do";
		}
	}
}
