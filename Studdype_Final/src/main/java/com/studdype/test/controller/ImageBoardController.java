package com.studdype.test.controller;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.studdype.test.model.dto.study.StudyDto;

@Controller
public class ImageBoardController {

	
private static final Logger logger = LoggerFactory.getLogger(ImageBoardController.class);
		
	
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
		public String galleryWriteForm(Model model) {
			
			
			return "community/gallery/galleryWriteForm";
		}
	
}
