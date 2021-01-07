package com.studdype.test.model.dto.board;

import java.util.Date;

public class BookDto {
	private int b_no; 				
	private int s_no; 				
	private String b_title; 		
	private int b_writer; 		
	private String b_content; 	
	private Date b_regdate; 	
	private String book_title; 		
	private String book_author; 	
	private String book_publish;	
	private String book_img; 		
	private String book_url; 		
	private String book_ismain; 	

	public BookDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookDto(int b_no, int s_no, String b_title, int b_writer, String b_content, Date b_regdate,
			String book_title, String book_author, String book_publish, String book_img, String book_url,
			String book_ismain) {
		super();
		this.b_no = b_no;
		this.s_no = s_no;
		this.b_title = b_title;
		this.b_writer = b_writer;
		this.b_content = b_content;
		this.b_regdate = b_regdate;
		this.book_title = book_title;
		this.book_author = book_author;
		this.book_publish = book_publish;
		this.book_img = book_img;
		this.book_url = book_url;
		this.book_ismain = book_ismain;
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

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}

	public String getBook_publish() {
		return book_publish;
	}

	public void setBook_publish(String book_publish) {
		this.book_publish = book_publish;
	}

	public String getBook_img() {
		return book_img;
	}

	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}

	public String getBook_url() {
		return book_url;
	}

	public void setBook_url(String book_url) {
		this.book_url = book_url;
	}

	public String getBook_ismain() {
		return book_ismain;
	}

	public void setBook_ismain(String book_ismain) {
		this.book_ismain = book_ismain;
	}

	@Override
	public String toString() {
		return "BookDto [b_no=" + b_no + ", s_no=" + s_no + ", b_title=" + b_title + ", b_writer=" + b_writer
				+ ", b_content=" + b_content + ", b_regdate=" + b_regdate + ", book_title=" + book_title
				+ ", book_author=" + book_author + ", book_publish=" + book_publish + ", book_img=" + book_img
				+ ", book_url=" + book_url + ", book_ismain=" + book_ismain + "]";
	}
	
	
}
