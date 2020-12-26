package com.studdype.test.model.dto.study;

public class StudyMemberDto {
	private int s_no; 	// ���͵� ��ȣ
	private int mem_no; // ȸ�� ��ȣ

	public StudyMemberDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StudyMemberDto(int s_no, int mem_no) {
		super();
		this.s_no = s_no;
		this.mem_no = mem_no;
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

}
