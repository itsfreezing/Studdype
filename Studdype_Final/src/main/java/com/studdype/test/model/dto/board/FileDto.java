package com.studdype.test.model.dto.board;

import org.springframework.web.multipart.MultipartFile;

public class FileDto {
	private int f_no; // ���� ��ȣ
	private int b_no; // �Խñ� ��ȣ
	private String f_name; // ���� ���� �̸�
	private double f_size; //파일 사이즈
	private String f_url; //파일 실제경로
	private String photo_ismain; // ��ǥ����

	public FileDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FileDto(int f_no, int b_no, String f_name, double f_size, String f_url) {
		super();
		this.f_no = f_no;
		this.b_no = b_no;
		this.f_name = f_name;
		this.f_size = f_size;
		this.f_url = f_url;
	}

	public FileDto(int f_no, int b_no, String f_name, double f_size, String f_url, String photo_ismain) {
		super();
		this.f_no = f_no;
		this.b_no = b_no;
		this.f_name = f_name;
		this.f_size = f_size;
		this.f_url = f_url;
		this.photo_ismain = photo_ismain;
	}

	
	
	public FileDto(String f_name, double f_size, String f_url) {
		super();
		this.f_name = f_name;
		this.f_size = f_size;
		this.f_url = f_url;
	}

	public double getF_size() {
		return f_size;
	}

	public void setF_size(double f_size) {
		this.f_size = f_size;
	}

	public String getF_url() {
		return f_url;
	}

	public void setF_url(String f_url) {
		this.f_url = f_url;
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
