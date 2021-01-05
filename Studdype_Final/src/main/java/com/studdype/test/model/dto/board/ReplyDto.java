package com.studdype.test.model.dto.board;

import java.util.Date;

public class ReplyDto {
	private int r_no; 			// ��� ��ȣ
	private int b_no; 			// �Խñ� ��ȣ
	private int r_groupno; 		// ��� �׷� ��ȣ
	private int r_class; 		// ��� ����
	private int r_order; 			// ��,��� ����
	private int r_writer; 		// �ۼ���
	private String r_comment; 	// ��� ����
	private Date r_regdate; 	// ��� �ۼ� �ð�

	public ReplyDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReplyDto(int r_no, int b_no, int r_groupno, int r_class, int r_order, int r_writer, String r_comment,
			Date r_regdate) {
		super();
		this.r_no = r_no;
		this.b_no = b_no;
		this.r_groupno = r_groupno;
		this.r_class = r_class;
		this.r_order = r_order;
		this.r_writer = r_writer;
		this.r_comment = r_comment;
		this.r_regdate = r_regdate;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public int getR_groupno() {
		return r_groupno;
	}

	public void setR_groupno(int r_groupno) {
		this.r_groupno = r_groupno;
	}

	public int getR_class() {
		return r_class;
	}

	public void setR_class(int r_class) {
		this.r_class = r_class;
	}

	public int getR_order() {
		return r_order;
	}

	public void setR_order(int r_order) {
		this.r_order = r_order;
	}

	public int getR_writer() {
		return r_writer;
	}

	public void setR_writer(int r_writer) {
		this.r_writer = r_writer;
	}

	public String getR_comment() {
		return r_comment;
	}

	public void setR_comment(String r_comment) {
		this.r_comment = r_comment;
	}

	public Date getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}

	
}
