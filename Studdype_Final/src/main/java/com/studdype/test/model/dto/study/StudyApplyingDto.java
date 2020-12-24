package com.studdype.test.model.dto.study;

public class StudyApplyingDto {
	private int s_no; 		// ���͵� ��ȣ
	private int mem_no; 	// ȸ����ȣ
	private String agree;	// ������Ȳ
	private String info;	// �ڱ�Ұ�

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
