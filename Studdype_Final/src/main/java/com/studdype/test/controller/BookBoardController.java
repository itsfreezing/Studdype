package com.studdype.test.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.studdype.test.model.biz.board.BookBiz;
import com.studdype.test.model.biz.member.MemberBiz;
import com.studdype.test.model.dto.board.BookDto;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.study.StudyCategoryDto;
import com.studdype.test.model.dto.study.StudyDto;

@Controller
public class BookBoardController {
	@Autowired
	private MemberBiz memberBiz;

	@Autowired
	private BookBiz bookBiz;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	// [도서 게시판] Controller

	// 도서 검색 페이지 전환
	@RequestMapping(value = "/bookboardform.do")
	public String bookBoardForm(HttpSession session) {
		logger.info("[bookBoardForm]");
		session.setAttribute("leftnavi", "book");
		return "community/book/bookboardform";
	}

	// 도서 검색 페이지
	@RequestMapping(value = "/searchBook.do")
	public String searchBook(HttpSession session, Model model) {
		logger.info("[searchBook]");
		StudyDto study = (StudyDto) session.getAttribute("study");
		List<BookDto> list = null;
		Map<Integer, MemberDto> writerNameMap = null;// 게시글 작성자 이름 담을 MAP

		list = bookBiz.selectSearchBookList(study.getS_no());
		// 멤버번호로 작성자 이름/아이디 받아오기
		writerNameMap = bookBiz.getWriterNameByList(list);

		model.addAttribute("list", list);
		model.addAttribute("writerMap", writerNameMap);

		return "community/book/searchBook";
	}

	// 도서 디테일 페이지
	@RequestMapping(value = "/bookDetailform.do", method = RequestMethod.GET)
	public String bookDetailForm(HttpSession session, Model model, HttpServletRequest request) {
		logger.info("[bookDetailForm]");
		StudyDto study = (StudyDto) session.getAttribute("study");
		Map<Integer, MemberDto> writerNameMap = null;// 게시글 작성자 이름 담을 MAP
		int b_no = Integer.parseInt(request.getParameter("b_no"));

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

	// 도서 검색 및 등록 페이지
	@RequestMapping("/registerBook.do")
	public String registerBook(Model model) {
		logger.info("[registerBook]");
		
		List<StudyCategoryDto> cateList = bookBiz.selectCateGoryListOfBook();
		
		model.addAttribute("cateList", cateList);
		
		return "community/book/registerBook";
	}

	// 도서글 등록 
	@RequestMapping("/insertRegisterBook.do")
	public String insertRegisterBook(Model model, BookDto dto) {
		logger.info("[insertRegisterBook]");
		int res = 0;
		System.out.println(dto);
		res = bookBiz.insertRegisterBook(dto);

		if (res > 0) {
			return "redirect:bookDetailform.do?b_no=" + dto.getB_no();
		} else {
			model.addAttribute("msg", "도서 등록에 실패하셨습니다.");
			model.addAttribute("url", "registerBook.do");
			return "commond/alert";
		}
	}

	// 도서글 삭제
	@RequestMapping("/deleteBook.do")
	public String deleteBook(HttpSession session, Model model, HttpServletRequest request) {
		logger.info("[deleteBook]");
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		StudyDto studyDto = (StudyDto) session.getAttribute("study");
		BookDto dto = new BookDto();
		dto.setB_no(b_no);
		dto.setS_no(studyDto.getS_no());

		System.out.println("delete 실행 전 : "+dto);
		BookDto res = bookBiz.deleteBook(dto);

		System.out.println("delete 실행 후 : "+res);
		// null -> 삭제 성공
		if (res == null) {
			model.addAttribute("msg", "해당 도서 게시글이 삭제되었습니다.");
			model.addAttribute("url", "searchBook.do");
			return "commond/alert";
		} else {
			model.addAttribute("msg", "해당 도서 게시글 삭제에 실패했습니다.");
			model.addAttribute("url", "bookDetailform.do?b_no=" + dto.getB_no());
			return "commond/alert";
		}
	}

	// 도서글 수정 페이지 전환
	@RequestMapping("/updateBookForm.do")
	public String updateBookForm(Model model, HttpServletRequest request, HttpSession session) {
		logger.info("[updateBookForm]");
		StudyDto studyDto = (StudyDto) session.getAttribute("study");
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		Map<Integer, MemberDto> writerNameMap = null;// 게시글 작성자 이름 담을 MAP

		BookDto tmp = new BookDto();
		tmp.setS_no(studyDto.getS_no());
		tmp.setB_no(b_no);

		BookDto dto = bookBiz.selectOneBook(tmp);
		
		 
		// 멤버번호로 작성자 이름/아이디 받아오기
		writerNameMap = bookBiz.getBookWriterName(dto.getB_writer());

		model.addAttribute("bookDto", dto);
		model.addAttribute("writerNameMap", writerNameMap);
		return "community/book/updateBookForm";
	}
	
	// 도서글 수정 처리
	@RequestMapping("/bookBoardUpdateBook.do")
	public String bookBoardUpdateBook(Model model, BookDto dto) {
		logger.info("[bookBoardUpdateBook]");
		int res = 0;
		
		res = bookBiz.bookBoardUpdateBook(dto);
		
		if(res > 0) {
			model.addAttribute("msg", "해당 도서 게시글이 수정되었습니다.");
			model.addAttribute("url", "bookDetailform.do?b_no="+dto.getB_no());
			return "commond/alert";
		}else {	
			model.addAttribute("msg", "해당 도서 게시글 수정에 실패했습니다.");
			model.addAttribute("url", "updateBookForm.do?b_no="+dto.getB_no());
			return "commond/alert";
		}
	}
	
	@RequestMapping(value="/bookCategorySearch.do", method=RequestMethod.POST)
	public @ResponseBody Map bookCategorySearch(@RequestBody StudyCategoryDto cate) {
		Map bookMap = new HashMap();
		List<BookDto> bookList = new ArrayList<BookDto>();
		List<StudyDto> studyList = new ArrayList<StudyDto>();
		
		studyList = bookBiz.selectStudyByCategory(cate.getCate_no());
		
		if(studyList == null) {
			bookMap.put("bookList", bookList);
			return bookMap;
		}
		
		bookList = bookBiz.selectMainBookByStudy(studyList);
		
		bookMap.put("bookList", bookList);
		
		return bookMap;
	}

// [도서 게시판]
/////////////////////////////////////////////////////////////////////////////

}
