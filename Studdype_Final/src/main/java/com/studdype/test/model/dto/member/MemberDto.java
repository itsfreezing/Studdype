package com.studdype.test.model.dto.member;

public class MemberDto {
	private int mem_no; 		// ȸ�� ��ȣ
	private String mem_id; 		// ���̵�
	private String mem_pw; 		// ��й�ȣ
	private String mem_name; 	// �̸�
	private String mem_rno; 	// �ֹι�ȣ
	private String mem_gender; 	// ����
	private String mem_phone; 	// �ڵ��� ��ȣ
	private String mem_email; 	// �̸���

	public MemberDto() {
		super();
	}

	public MemberDto(int mem_no, String mem_id, String mem_pw, String mem_name, String mem_rno, String mem_gender,
			String mem_phone, String mem_email) {
		super();
		this.mem_no = mem_no;
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_rno = mem_rno;
		this.mem_gender = mem_gender;
		this.mem_phone = mem_phone;
		this.mem_email = mem_email;
	}
	
	public MemberDto(int mem_no, String mem_id, String mem_pw, String mem_phone, String mem_email) {
		super();
		this.mem_no = mem_no;
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_phone = mem_phone;
		this.mem_email = mem_email;
	}

	

	public MemberDto(int mem_no, String mem_phone, String mem_email) {
		super();
		this.mem_no = mem_no;
		this.mem_phone = mem_phone;
		this.mem_email = mem_email;
	}

	public MemberDto(int mem_no, String mem_pw) {
		super();
		this.mem_no = mem_no;
		this.mem_pw = mem_pw;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_rno() {
		return mem_rno;
	}

	public void setMem_rno(String mem_rno) {
		this.mem_rno = mem_rno;
	}

	public String getMem_gender() {
		return mem_gender;
	}

	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	@Override
	public String toString() {
		return "MemberDto [mem_no=" + mem_no + ", mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name
				+ ", mem_rno=" + mem_rno + ", mem_gender=" + mem_gender + ", mem_phone=" + mem_phone + ", mem_email="
				+ mem_email + "]";
	}
	
	
}
