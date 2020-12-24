package com.studdype.test.model.dto;

public class LocationSiDto {
	private int si_no; // 시 번호
	private String si_name; // 시 이름

	public LocationSiDto() {
		super();
	}

	public LocationSiDto(int si_no, String si_name) {
		super();
		this.si_no = si_no;
		this.si_name = si_name;
	}

	public int getSi_no() {
		return si_no;
	}

	public void setSi_no(int si_no) {
		this.si_no = si_no;
	}

	public String getSi_name() {
		return si_name;
	}

	public void setSi_name(String si_name) {
		this.si_name = si_name;
	}

}
