package com.studdype.test.model.dto.board;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MeetDto {
	private int meet_no; 				// 모임 게시글 번호
	private int s_no; 					// 스터디 번호
	private String meet_title; 			// 모임 게시글 제목
	private int meet_writer; 			// 모임 작성자
	private String meet_content; 		// 모임 상세내용
	private String meet_addr; 			// 모임 도로명 주소
	private String meet_addr_detail;	// 모임 상세주소

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date meet_date; 			// 모임 날짜
	
	@DateTimeFormat(pattern = "HH:mi")
	private Date meet_time; 			// 모임 시간
	
	private Date meet_regdate; 			// 모임 작성일자
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date vote_startdate; 		// 투표 시작일
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date vote_enddate; 			// 투표 마감일
	
	private int meet_cnt;				// 모임 게시판 조회수

	public MeetDto() {
		super();
	}

	public MeetDto(int meet_no, int s_no, String meet_title, int meet_writer, String meet_content, String meet_addr,
			String meet_addr_detail, Date meet_date, Date meet_time, Date meet_regdate, Date vote_startdate,
			Date vote_enddate, int meet_cnt) {
		super();
		this.meet_no = meet_no;
		this.s_no = s_no;
		this.meet_title = meet_title;
		this.meet_writer = meet_writer;
		this.meet_content = meet_content;
		this.meet_addr = meet_addr;
		this.meet_addr_detail = meet_addr_detail;
		this.meet_date = meet_date;
		this.meet_time = meet_time;
		this.meet_regdate = meet_regdate;
		this.vote_startdate = vote_startdate;
		this.vote_enddate = vote_enddate;
		this.meet_cnt = meet_cnt;
	}

	public int getMeet_no() {
		return meet_no;
	}

	public void setMeet_no(int meet_no) {
		this.meet_no = meet_no;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public String getMeet_title() {
		return meet_title;
	}

	public void setMeet_title(String meet_title) {
		this.meet_title = meet_title;
	}

	public int getMeet_writer() {
		return meet_writer;
	}

	public void setMeet_writer(int meet_writer) {
		this.meet_writer = meet_writer;
	}

	public String getMeet_content() {
		return meet_content;
	}

	public void setMeet_content(String meet_content) {
		this.meet_content = meet_content;
	}

	public String getMeet_addr() {
		return meet_addr;
	}

	public void setMeet_addr(String meet_addr) {
		this.meet_addr = meet_addr;
	}

	public String getMeet_addr_detail() {
		return meet_addr_detail;
	}

	public void setMeet_addr_detail(String meet_addr_detail) {
		this.meet_addr_detail = meet_addr_detail;
	}

	public Date getMeet_date() {
		return meet_date;
	}

	public void setMeet_date(Date meet_date) {
		this.meet_date = meet_date;
	}

	public Date getMeet_time() {
		return meet_time;
	}

	public void setMeet_time(Date meet_time) {
		this.meet_time = meet_time;
	}

	public Date getMeet_regdate() {
		return meet_regdate;
	}

	public void setMeet_regdate(Date meet_regdate) {
		this.meet_regdate = meet_regdate;
	}

	public Date getVote_startdate() {
		return vote_startdate;
	}

	public void setVote_startdate(Date vote_startdate) {
		this.vote_startdate = vote_startdate;
	}

	public Date getVote_enddate() {
		return vote_enddate;
	}

	public void setVote_enddate(Date vote_enddate) {
		this.vote_enddate = vote_enddate;
	}

	public int getMeet_cnt() {
		return meet_cnt;
	}

	public void setMeet_cnt(int meet_cnt) {
		this.meet_cnt = meet_cnt;
	}

	
}
