package com.studdype.test.model.dto.board;

import java.util.Date;

public class BoardDto {
	private int b_no; // �Խñ� ��ȣ
	private int s_no; // ���͵� ��ȣ
	private String b_title; // �Խñ� ����
	private int b_writer; // �ۼ���
	private String b_content; // �Խñ� ����
	private Date b_regdate; // �Խñ� �ۼ� �ð�
	private int b_important;
	private int b_cnt; // ��ȸ��

	public BoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardDto(int b_no, int s_no, String b_title, int b_writer, String b_content, Date b_regdate, int b_cnt) {
		super();
		this.b_no = b_no;
		this.s_no = s_no;
		this.b_title = b_title;
		this.b_writer = b_writer;
		this.b_content = b_content;
		this.b_regdate = b_regdate;
		this.b_cnt = b_cnt;
	}

	public BoardDto(int b_no, int s_no, String b_title, int b_writer, String b_content, Date b_regdate, int b_important,
			int b_cnt) {
		super();
		this.b_no = b_no;
		this.s_no = s_no;
		this.b_title = b_title;
		this.b_writer = b_writer;
		this.b_content = b_content;
		this.b_regdate = b_regdate;
		this.b_important = b_important;
		this.b_cnt = b_cnt;
	}

	public BoardDto(int b_no, int s_no, String b_title, int b_writer, String b_content, Date b_regdate) {
		super();
		this.b_no = b_no;
		this.s_no = s_no;
		this.b_title = b_title;
		this.b_writer = b_writer;
		this.b_content = b_content;
		this.b_regdate = b_regdate;
	}

	public int getB_important() {
		return b_important;
	}

	public void setB_important(int b_important) {
		this.b_important = b_important;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public int getB_writer() {
		return b_writer;
	}

	public void setB_writer(int b_writer) {
		this.b_writer = b_writer;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public Date getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}

	public int getB_cnt() {
		return b_cnt;
	}

	public void setB_cnt(int b_cnt) {
		this.b_cnt = b_cnt;
	}

	@Override
	public String toString() {
		return "BoardDto [b_no=" + b_no + ", s_no=" + s_no + ", b_title=" + b_title + ", b_writer=" + b_writer
				+ ", b_content=" + b_content + ", b_regdate=" + b_regdate + ", b_important=" + b_important + ", b_cnt="
				+ b_cnt + "]";
	}
	
	

}
