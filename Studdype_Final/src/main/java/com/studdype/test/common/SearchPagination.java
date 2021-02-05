package com.studdype.test.common;

public class SearchPagination extends Pagination{
	
	private String searchType = "";
	private String keyword = "";
	private int s_no = 0;
	private int cate_no = 0;
	private int si_no=0;
	private int gu_no=0;
	private String si_name="";
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
		this.si_no=si_no;
	}
	
	public int getGU_no() {
		return gu_no;
	}
	public void setGU_no(int gu_no) {
		this.gu_no=gu_no;
	}
	public String getsi_name() {
		return si_name;
	}
	public void setsi_name(String si_name) {
		this.si_name=si_name;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	@Override
	public String toString() {
		return "SearchPagination [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
	
	
	
}
