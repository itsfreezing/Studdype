package com.studdype.test.common;

public class Pagination {
	private int pageSize = 9;				//한페이지에 보여줄 개수 listSize
	private int pageGroupSize = 5;	// 페이지 그룹 사이즈 rangeSize
	private int currentPage;				// 현재 페이지 page
	private int startRow;						// 페이지 첫번째 글 range
	private int totalPageNum;			// 총페이지 개수 listCnt
	private int numPageGroup;			// 페이지 그룹 pageCnt
	/*
	 * [1][2][3][4][5] -> 1 ( numPageGroup ) [6][7][8][9][10] -> 2
	 */
	private int startPage;					// 시작페이지
	private int endPage;						// 끝 페이지
	private int startList;						//게시판 시작번호
	private int endRow;						// 페이지 마지막 글
	private boolean next;					//다음
	private boolean prev;					//이전
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageGroupSize() {
		return pageGroupSize;
	}
	public void setPageGroupSize(int pageGroupSize) {
		this.pageGroupSize = pageGroupSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getTotalPageNum() {
		return totalPageNum;
	}
	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}
	public int getNumPageGroup() {
		return numPageGroup;
	}
	public void setNumPageGroup(int numPageGroup) {
		this.numPageGroup = numPageGroup;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	
	public void pageInfo(int currentPage, int startRow, int totalPageNum) {
		this.currentPage = currentPage;
		this.startRow = startRow;
		this.totalPageNum = totalPageNum;
		
		//전체 페이지수
		this.numPageGroup =  (int) Math.ceil(totalPageNum / pageSize);
		
		//시작 페이지
		this.startPage = (numPageGroup - 1) * pageGroupSize + 1;
		
		// 끝 페이지
		this.endPage = numPageGroup * pageGroupSize;
		
		// 페이지 첫번째 글
		this.startList = (currentPage - 1) * pageSize; 
		
		//이전 버튼 상태
		this.prev = startRow == 1 ? false : true;

		//다음 버튼 상태
		this.next = endPage > numPageGroup ? false : true;
		if (this.endPage > this.numPageGroup) {
			this.endPage = this.numPageGroup;
			this.next = false;

		}



	}
	
}
