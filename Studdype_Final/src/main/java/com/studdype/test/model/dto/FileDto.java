package com.studdype.test.model.dto;

public class FileDto {
	private int f_no; // 파일 번호
	private int b_no; // 게시글 번호
	private String f_name; // 파일 실제 이름
	private String photo_ismain; // 대표사진

	public FileDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	// 사진 게시판 파일 생성자
	public FileDto(int f_no, int b_no, String f_name, String photo_ismain) {
		super();
		this.f_no = f_no;
		this.b_no = b_no;
		this.f_name = f_name;
		this.photo_ismain = photo_ismain;
	}

	// 일반 파일 생성자
	public FileDto(int f_no, int b_no, String f_name) {
		super();
		this.f_no = f_no;
		this.b_no = b_no;
		this.f_name = f_name;
	}

	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getPhoto_ismain() {
		return photo_ismain;
	}

	public void setPhoto_ismain(String photo_ismain) {
		this.photo_ismain = photo_ismain;
	}

}
