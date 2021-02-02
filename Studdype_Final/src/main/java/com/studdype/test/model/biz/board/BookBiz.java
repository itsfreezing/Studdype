package com.studdype.test.model.biz.board;

import java.util.List;
import java.util.Map;


import com.studdype.test.model.dto.board.BookDto;
import com.studdype.test.model.dto.member.MemberDto;
import com.studdype.test.model.dto.study.StudyCategoryDto;
import com.studdype.test.model.dto.study.StudyDto;

public interface BookBiz {

	public List<BookDto> bookList(int s_no);
	public int selectTotalRegisterBookNum(int s_no); // 등록된 도서 총 개수
	public List<BookDto> selectSearchBookList(int s_no);	// 화면에 보여줄 해당 페이지 도서 리스트
	public Map<Integer, MemberDto> getWriterNameByList(List<BookDto> bookList); // 회원 번호로 회원 아이디, 이름 찾아오기
	public BookDto selectOneBook(BookDto dto);	// 해당 도서 선택
	public Map<Integer, MemberDto> getBookWriterName(int mem_no); // 해당 도서 아이디, 이름 찾아오기

	public int deletebookmain(); //대표도서 없애기
	public int bookmain(int b_no); // 대표도서 설정

	public int insertRegisterBook(BookDto dto);	// 작성한 도서 정보 insert
	public BookDto deleteBook(BookDto dto); // 도서 게시글 삭제
	public int bookBoardUpdateBook(BookDto dto);	// 도서 게시글 수정
	public BookDto selectMainBookOfStudy(int s_no);	// 스터디 메인도서 가져오기
	public List<StudyCategoryDto> selectCateGoryListOfBook();	// 카테고리 리스트 가져오기
	public List<StudyDto> selectStudyByCategory(int cate_no);	// 카테고리 번호로 스터디 정보 가져오기
	public List<BookDto> selectMainBookByStudy(List<StudyDto> study);	// 스터디 번호 리스트로 대표 도서 정보 가져오기

}
