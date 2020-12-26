package com.studdype.test.model.dto.board;

import java.util.Date;

public class BoardDto {
	private int b_no; 			// �Խñ� ��ȣ
	private int s_no; 			// ���͵� ��ȣ
	private String title; 		// �Խñ� ����
	private int b_writer; 		// �ۼ���
	private String b_content; 	// �Խñ� ����
	private Date b_regdate; 	// �Խñ� �ۼ� �ð�
	private int b_important; 	// �ʼ��������׿���
	private int b_cnt; 			// ��ȸ��

	public BoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	// �������� �Խ��� ������
	public BoardDto(int b_no, int s_no, String title, int b_writer, String b_content, Date b_regdate,
			int b_important, int b_cnt) {
		super();
		this.b_no = b_no;
		this.s_no = s_no;
		this.title = title;
		this.b_writer = b_writer;
		this.b_content = b_content;
		this.b_regdate = b_regdate;
		this.b_important = b_important;
		this.b_cnt = b_cnt;
	}
	
	// �Ϲ� �Խ��� ������
	public BoardDto(int b_no, int s_no, String title, int b_writer, String b_content, Date b_regdate, int b_cnt) {
		super();
		this.b_no = b_no;
		this.s_no = s_no;
		this.title = title;
		this.b_writer = b_writer;
		this.b_content = b_content;
		this.b_regdate = b_regdate;
		this.b_cnt = b_cnt;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getB_important() {
		return b_important;
	}

	public void setB_important(int b_important) {
		this.b_important = b_important;
	}

	public int getB_cnt() {
		return b_cnt;
	}

	public void setB_cnt(int b_cnt) {
		this.b_cnt = b_cnt;
	}
}
