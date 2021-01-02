package com.studdype.test;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.studdype.test.model.biz.member.MemberBiz;
import com.studdype.test.model.biz.study.StudyBiz;

import com.studdype.test.model.dto.study.StudyDto;
import com.studdype.test.model.dto.board.FileDto;
import com.studdype.test.model.dto.location.LocationGuDto;
import com.studdype.test.model.dto.location.LocationSiDto;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.study.StudyCategoryDto;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private MemberBiz memberBiz;
	@Autowired
	private StudyBiz studyBiz;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
		
	@RequestMapping("/studdypehome.do")
	public String studdypeHeader() {
		return "studdype/studdypeHome";
	}
	
	@RequestMapping("/studdypeexample.do")
	public String studdypeExample() {
		return "studdype/studdypeExample";
	}
	
	@RequestMapping("/searchbycategory.do")
	public String searchByCategory() {
		return "studdype/searchByCategory";
	}
	

	//커뮤니티 홈으로

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
		
		// 파일을 객체에 담기
		MultipartFile file = filedto.getMyfile();
		String name = file.getOriginalFilename()+"(Representative)"; // 대표사진 파일명 확인
		
		// Map으로 로그인 세션 받아서 팀장번호 받아오기
		///////////////////////////////////////////
		
		///////////////////////////////////////////
		
		// 생성할 스터디 정보 담기
		StudyDto studydto = new StudyDto();
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
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/studdype");
			
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
			return "studdype/studdypeHome";
		}else {
			model.addAttribute("msg", "스터디 생성 실패");
			return "redirect:createStuddypeform.do";
		}
		
	}
	

	@RequestMapping("/communityhome.do")
	public String communityHome(HttpSession session) {
		
		/////////////////////// 테스트용 세션
		MemberDto login = memberBiz.selectOne(1);
		StudyDto study = studyBiz.selectOneBySno(1);
		
		
		session.setAttribute("study", study); //스터디 세션
		session.setAttribute("login", login); //로그인 세션
		//////////////////// 화상회의 테스트를 위한 session login, study커뮤니티접근 세션 구현후 삭제
		session.setAttribute("leftnavi", "studyhome");
		return "community/communityHome";
	}
	
	@RequestMapping("/notice.do")
	public String notice(HttpSession session) {
		session.setAttribute("leftnavi", "notice");
		return "community/notice";
	}
	
	@RequestMapping("/loginform.do")
	public String Login(HttpSession session) {
		return "loginpage/login";
	}
	
	@RequestMapping("/signupform.do")
	public String Signup(HttpSession session) {
		return "loginpage/signup";
	}
}
