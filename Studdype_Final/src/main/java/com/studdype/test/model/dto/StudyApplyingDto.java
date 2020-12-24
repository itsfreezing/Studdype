package com.studdype.test.model.dto;

public class StudyApplyingDto {
	private int s_no; 		// 스터디 번호
	private int mem_no; 	// 회원번호
	private String agree;	// 수락현황
	private String info;	// 자기소개

	public StudyApplyingDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StudyApplyingDto(int s_no, int mem_no, String agree, String info) {
		super();
		this.s_no = s_no;
		this.mem_no = mem_no;
		this.agree = agree;
		this.info = info;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getAgree() {
		return agree;
	}

	public void setAgree(String agree) {
		this.agree = agree;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
}
