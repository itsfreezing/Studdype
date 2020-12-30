package com.studdype.test.model.dto.board;

import java.util.Date;

public class MeetDto {
	private int meet_no; 			// ���� ��ȣ
	private int s_no; 				// ���͵� ��ȣ
	private String meet_title; 		// ���� ����
	private int meet_writer; 		// ���� �ۼ���
	private String meet_content; 	// ���� ����
	private String meet_addr; 		// ���� ���θ� �ּ�
	private Date meet_date; 		// ���� ��¥
	private Date meet_time; 		// ���� �ð�
	private Date meet_regdate; 		// ���� �ۼ� �ð�
	private Date vote_startdate; 	// ��ǥ ������
	private Date vote_enddate; 		// ��ǥ ������

	public MeetDto() {
		super();
	}

	public MeetDto(int meet_no, int s_no, String meet_title, int meet_writer, String meet_content,
			String meet_addr, Date meet_date, Date meet_time, Date meet_regdate, Date vote_startdate,
			Date vote_enddate) {
		super();
		this.meet_no = meet_no;
		this.s_no = s_no;
		this.meet_title = meet_title;
		this.meet_writer = meet_writer;
		this.meet_content = meet_content;
		this.meet_addr = meet_addr;
		this.meet_date = meet_date;
		this.meet_time = meet_time;
		this.meet_regdate = meet_regdate;
		this.vote_startdate = vote_startdate;
		this.vote_enddate = vote_enddate;
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
}
