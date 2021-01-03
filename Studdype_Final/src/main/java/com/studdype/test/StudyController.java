package com.studdype.test;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.studdype.test.model.biz.study.StudyBiz;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.location.LocationGuDto;
import com.studdype.test.model.dto.location.LocationSiDto;
import com.studdype.test.model.dto.study.StudyCategoryDto;
import com.studdype.test.model.dto.study.StudyDto;

@Controller
public class StudyController {
	
	private static final Logger logger =  LoggerFactory.getLogger(StudyController.class);
	
	@Autowired
	private StudyBiz studyBiz;
	
	
	@RequestMapping("/studyList.do")
	public String list(Model model) {
		List<StudyDto> studyList = null;
		Map<Integer, String> studyMainLeaderNameMap = null; //리더이름을 담을 MAP 설정
		logger.info("STUDY - SELECTLIST");
		
		studyList = studyBiz.studyList();
		System.out.println(studyList.get(0).getS_name());
		System.out.println(studyList.get(0).getLeader_no());
		studyMainLeaderNameMap = studyBiz.selectLeaderNameByMainPage(studyList);
		System.out.println(studyMainLeaderNameMap);
		System.out.println(studyMainLeaderNameMap.get(1));
		model.addAttribute("studyList", studyList);
		model.addAttribute("leaderName", studyMainLeaderNameMap);

		
		return "studdype/studdypeHome";
	}
	
	// 스터디 생성 폼
	@RequestMapping("/createStuddypeform.do")
	public String createStuddypeForm(Model model) {
		List<LocationSiDto> sidtos = studyBiz.locationSiList();
		List<LocationGuDto> gudtos = studyBiz.locationGuList();
		List<StudyCategoryDto> catedtos = studyBiz.categoryList();
		
		model.addAttribute("sidtos", sidtos);
		model.addAttribute("gudtos", gudtos);
		model.addAttribute("catedtos", catedtos);
		
		return "studdype/createStuddype";
	}
	
	// 스터디 생성 후 Stduddypehome으로
	@RequestMapping("createStuddype.do")
	public String createStuddype(HttpServletRequest request, StudyDto dto, Model model, FileDto filedto) {
		
		// 스터디 마지막 번호 가져오기
		///////////////////////////////////////////
		int studyFinalNumber = studyBiz.selectStudyFinalNumber();
		///////////////////////////////////////////
		
		// 파일을 객체에 담기
		MultipartFile file = filedto.getMyfile();
		String name = "(Representative"+(studyFinalNumber+1)+")"+file.getOriginalFilename(); // 대표사진 파일명 확인
		
		// Map으로 로그인 세션 받아서 팀장번호 받아오기
		///////////////////////////////////////////
		
		///////////////////////////////////////////
		
		// 생성할 스터디 정보 담기
		StudyDto studydto = new StudyDto();
		studydto.setS_no(studyFinalNumber+1);
		//studydto.setLeader_no(); Session 회원번호 담기
		studydto.setS_name(dto.getS_name());
		studydto.setS_info(dto.getS_info());
		studydto.setS_content(dto.getS_content());
		studydto.setPhoto(name); 
		studydto.setCate_no(dto.getCate_no());
		studydto.setSi_no(dto.getSi_no());
		studydto.setGu_no(dto.getGu_no());
		studydto.setS_maxcnt(dto.getS_maxcnt());
		
		//////////////////////////////////////////////
		// 대표사진 FileDto로 담기
		FileDto studyFile = new FileDto();
		studyFile.setF_name(name);
		
		System.out.println(studyFile);
		////////////////////////////////////////////// File 확인 코드 (스터디 생성 구현 완료 후 삭제)
		
		System.out.println(studydto);
		
		
		////////////////////// 로그인 세션 구현 완료 후 Biz에서 기능 처리
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		try {
			inputStream = file.getInputStream();
			
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "resources/studdype");
			
			System.out.println("업로드 실제 경로 : "+path);
			
 			File storage = new File(path); 
 			
 			// studdype 폴더가 없을 경우 폴더 생성 (첫 생성 시) 
 			if(!storage.exists()) {
 				storage.mkdir();
 			}
 			
 			File newFile = new File(path+"/"+name);
 			
 			// 경로에 맞는 파일이 없을 경우 빈 파일 생성	(??)
 			if(!newFile.exists()) {
 				newFile.createNewFile();
 			}
			
 			// 출력 통로 열어주기
 			outputStream = new FileOutputStream(newFile);
 			
 			int read = 0;
 			// 파일 크기와 동일한 사이즈로 byte 저장
 			byte[] b = new byte[(int)file.getSize()];
 			
 			while((read=inputStream.read(b)) != -1) {
 				outputStream.write(b,0,read);
 			}
 			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		int studyRes = studyBiz.insertStudy(studydto);
		
		if(studyRes > 0) {
			model.addAttribute("msg", "스터디가 생성되었습니다.");
			return "studdype/studdypeHome";
		}else {
			model.addAttribute("msg", "스터디 생성에 실패하셨습니다.");
			return "redirect:createStuddypeform.do";
		}
		
	}
	
}

