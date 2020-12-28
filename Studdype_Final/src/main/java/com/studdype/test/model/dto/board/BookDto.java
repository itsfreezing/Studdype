package com.studdype.test.model.dto.board;

public class BookDto {
	private int b_no; 				// �Խñ� ��ȣ
	private int s_no; 				// ���͵� ��ȣ
	private String book_title; 		// å �̸�
	private String book_author; 	// å ����
	private String book_publish;	// å ���ǻ�
	private String book_img; 		// ���� �̹��� URL
	private String book_url; 		// ���� �� URL
	private String book_ismain; 	// ��ǥ��������

	public BookDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookDto(int b_no, int s_no, String book_title, String book_author, String book_publish, String book_img,
			String book_url, String book_ismain) {
		super();
		this.b_no = b_no;
		this.s_no = s_no;
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
}
