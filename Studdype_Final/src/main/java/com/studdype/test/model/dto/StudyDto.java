package com.studdype.test.model.dto;

public class StudyDto {
	private int s_no; 			// 스터디 번호
	private int leader_no; 		// 팀장 번호
	private String s_name; 		// 스터디 이름
	private String s_info; 		// 스터디 한줄 소개
	private String s_content; 	// 스터디 자세한 소개
	private String photo; 		// 스터디 대표사진 파일이름
	private int cate_no; 		// 스터디 카테고리
	private int si_no; 			// 스터디 지역(시)
	private int gu_no; 			// 스터디 지역(구)
	private int s_maxcnt; 		// 스터디 최대 인원
	private int s_currentcnt;	// 스터디 현재 인원

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
}
