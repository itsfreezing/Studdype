package com.studdype.test.model.dto;

import java.util.Date;

public class ReplyDto {
	private int r_no; 			// ´ñ±Û ¹øÈ£
	private int b_no; 			// °Ô½Ã±Û ¹øÈ£
	private int r_groupno; 		// ´ñ±Û ±×·ì ¹øÈ£
	private int r_class; 		// ´ñ±Û °èÃþ
	private int order; 			// ´ñ,´ä±Û ¼ø¼­
	private int r_writer; 		// ÀÛ¼ºÀÚ
	private String r_comment; 	// ´ñ±Û ³»¿ë
	private Date r_regdate; 	// ´ñ±Û ÀÛ¼º ½Ã°£

	public ReplyDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	// ÀÏ¹Ý °Ô½ÃÆÇ ´ñ±Û »ý¼ºÀÚ
	public ReplyDto(int r_no, int b_no, int r_groupno, int r_class, int order, int r_writer, String r_comment,
			Date r_regdate) {
		super();
		this.r_no = r_no;
		this.b_no = b_no;
		this.r_groupno = r_groupno;
		this.r_class = r_class;
		this.order = order;
		this.r_writer = r_writer;
		this.r_comment = r_comment;
		this.r_regdate = r_regdate;
	}

	// ¸ðÀÓ ´ñ±Û »ý¼ºÀÚ
	public ReplyDto(int r_no, int b_no, int r_writer, String r_comment, Date r_regdate) {
		super();
		this.r_no = r_no;
		this.b_no = b_no;
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

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
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
