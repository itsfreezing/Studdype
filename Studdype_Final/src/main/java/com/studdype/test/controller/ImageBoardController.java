package com.studdype.test.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.common.FileHandler;
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
		
		private FileHandler fileHander = new FileHandler();
		@RequestMapping(value="/gallery.do", method = RequestMethod.GET)
		public String list(Model model, HttpSession session) {
		StudyDto study = (StudyDto) session.getAttribute("study"); // 현재 클릭된 스터디
		
		
			
			
			return "community/gallery/gallery";
		}
		
		@RequestMapping("/galleryDetail.do")
		public String detail(Model model) {
			
			
			
			return "community/gallery/galleryDetail";
		}
		
		@RequestMapping("/gallerywriteform.do")
		public String galleryWriteForm(Model model, BoardDto boardDto, HttpSession session, HttpServletRequest request, UploadFile uploadFile) {
			int writer_no = ((MemberDto)session.getAttribute("login")).getMem_no();
			int s_no =  ((StudyDto) session.getAttribute("study")).getS_no();
			int res = 0;
			
			boardDto.setB_writer(writer_no);
			boardDto.setS_no(s_no);
			
			MultipartFile[] mfileList = uploadFile.getFile(); //multipartFile 리스트 생성
			
			if(mfileList != null) {
				List<FileDto> fileList = fileHandler.getFileList(mfileList, request);
				String path = fileHandler.getPath(request);
				
				
			}
			
			
			return "community/gallery/galleryWriteForm";
		}
	
}
