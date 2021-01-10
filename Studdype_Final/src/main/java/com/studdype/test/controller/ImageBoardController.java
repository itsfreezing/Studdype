package com.studdype.test.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ImageBoardController {
private static final Logger logger = LoggerFactory.getLogger(ImageBoardController.class);
	
	
	@RequestMapping(value = "/ImageBoard.do",method = RequestMethod.GET)
	public String Image(Locale locale,Model model) {
		logger.info("Welcome Member! The client locale is{}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,DateFormat.LONG,locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime",formattedDate);
		return "ImageBoard";
		

		
	}
		@RequestMapping("/gallery.do")
		public String list(Model model) {
			
			
			
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
