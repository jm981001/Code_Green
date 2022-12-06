package com.itwillbs.Code_Green.vo;

// 페이징 처리를 위한 정보를 저장할 PageInfo 클래스 정의(= DTO = Bean = VO 역할)
public class Qna_PageInfo {
	private int Qna_pageNum; // 현재 페이지 번호
	private int Qna_listLimit; // 페이지 당 게시물 목록 갯수
	private int Qna_listCount; // 총 게시물 수
	private int Qna_pageListLimit; // 페이지 당 표시할 페이지 번호 수
	private int Qna_maxPage; // 전체 페이지 수
	private int Qna_startPage; // 시작 페이지 번호
	private int Qna_endPage; // 끝 페이지 번호
	
	public Qna_PageInfo() {}

	public int getQna_pageNum() {
		return Qna_pageNum;
	}

	public void setQna_pageNum(int qna_pageNum) {
		Qna_pageNum = qna_pageNum;
	}

	public int getQna_listLimit() {
		return Qna_listLimit;
	}

	public void setQna_listLimit(int qna_listLimit) {
		Qna_listLimit = qna_listLimit;
	}

	public int getQna_listCount() {
		return Qna_listCount;
	}

	public void setQna_listCount(int qna_listCount) {
		Qna_listCount = qna_listCount;
	}

	public int getQna_pageListLimit() {
		return Qna_pageListLimit;
	}

	public void setQna_pageListLimit(int qna_pageListLimit) {
		Qna_pageListLimit = qna_pageListLimit;
	}

	public int getQna_maxPage() {
		return Qna_maxPage;
	}

	public void setQna_maxPage(int qna_maxPage) {
		Qna_maxPage = qna_maxPage;
	}

	public int getQna_startPage() {
		return Qna_startPage;
	}

	public void setQna_startPage(int qna_startPage) {
		Qna_startPage = qna_startPage;
	}

	public int getQna_endPage() {
		return Qna_endPage;
	}

	public void setQna_endPage(int qna_endPage) {
		Qna_endPage = qna_endPage;
	}

	public Qna_PageInfo(int qna_pageNum, int qna_listLimit, int qna_listCount, int qna_pageListLimit, int qna_maxPage,
			int qna_startPage, int qna_endPage) {
		super();
		Qna_pageNum = qna_pageNum;
		Qna_listLimit = qna_listLimit;
		Qna_listCount = qna_listCount;
		Qna_pageListLimit = qna_pageListLimit;
		Qna_maxPage = qna_maxPage;
		Qna_startPage = qna_startPage;
		Qna_endPage = qna_endPage;
	}

	
	
}















