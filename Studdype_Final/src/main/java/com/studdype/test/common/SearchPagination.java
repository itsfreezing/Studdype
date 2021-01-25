package com.studdype.test.common;

public class SearchPagination extends Pagination{
	
	private String searchType = "";
	private String keyword = "";
	private int s_no = 0;
	
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
