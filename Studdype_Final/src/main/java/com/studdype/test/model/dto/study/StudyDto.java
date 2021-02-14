package com.studdype.test.model.dto.study;

public class StudyDto {
	private int s_no; // ���͵� ��ȣ
	private int leader_no; // ���� ��ȣ
	private String s_name; // ���͵� �̸�
	private String s_info; // ���͵� ���� �Ұ�
	private String s_content; // ���͵� �ڼ��� �Ұ�
	private String photo; // 스터디 대표사진 경로
	private int cate_no; // ���͵� ī�װ�
	private int si_no; // ���͵� ����(��)
	private int gu_no; // ���͵� ����(��)
	private int s_maxcnt; // ���͵� �ִ� �ο�
	private int s_currentcnt; // ���͵� ���� �ο�

	public StudyDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StudyDto(int s_no, int leader_no, String s_name, String s_info, String s_content, String photo, int cate_no,
			int si_no, int gu_no, int s_maxcnt, int s_currentcnt) {
		super();
		this.s_no = s_no;
		this.leader_no = leader_no;
		this.s_name = s_name;
		this.s_info = s_info;
		this.s_content = s_content;
		this.photo = photo;
		this.cate_no = cate_no;
		this.si_no = si_no;
		this.gu_no = gu_no;
		this.s_maxcnt = s_maxcnt;
		this.s_currentcnt = s_currentcnt;
	}

	public StudyDto(int s_no, String s_info, int cate_no, int si_no, int gu_no, int s_maxcnt, String s_name , String photo) {
		super();
		this.s_no = s_no;
		this.s_info = s_info;
		this.cate_no = cate_no;
		this.si_no = si_no;
		this.gu_no = gu_no;
		this.s_maxcnt = s_maxcnt;
		this.s_name = s_name;
		this.photo = photo;
	}

	

	public StudyDto(int s_no) {
		super();
		this.s_no = s_no;
	}

	public StudyDto(int s_no, String photo) {
		super();
		this.s_no = s_no;
		this.photo = photo;
	}

	public StudyDto(int leader_no, int s_no) {
		super();
		this.s_no = s_no;
		this.leader_no = leader_no;
	}
	
	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public int getLeader_no() {
		return leader_no;
	}

	public void setLeader_no(int leader_no) {
		this.leader_no = leader_no;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_info() {
		return s_info;
	}

	public void setS_info(String s_info) {
		this.s_info = s_info;
	}

	public String getS_content() {
		return s_content;
	}

	public void setS_content(String s_content) {
		this.s_content = s_content;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getCate_no() {
		return cate_no;
	}

	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}

	public int getSi_no() {
		return si_no;
	}

	public void setSi_no(int si_no) {
		this.si_no = si_no;
	}

	public int getGu_no() {
		return gu_no;
	}

	public void setGu_no(int gu_no) {
		this.gu_no = gu_no;
	}

	public int getS_maxcnt() {
		return s_maxcnt;
	}

	public void setS_maxcnt(int s_maxcnt) {
		this.s_maxcnt = s_maxcnt;
	}

	public int getS_currentcnt() {
		return s_currentcnt;
	}

	public void setS_currentcnt(int s_currentcnt) {
		this.s_currentcnt = s_currentcnt;
	}

	@Override
	public String toString() {
		return "StudyDto [s_no=" + s_no + ", leader_no=" + leader_no + ", s_name=" + s_name + ", s_info=" + s_info
				+ ", s_content=" + s_content + ", photo=" + photo + ", cate_no=" + cate_no + ", si_no=" + si_no
				+ ", gu_no=" + gu_no + ", s_maxcnt=" + s_maxcnt + ", s_currentcnt=" + s_currentcnt + "]";
	}

}
