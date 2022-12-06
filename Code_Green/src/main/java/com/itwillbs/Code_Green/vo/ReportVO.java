package com.itwillbs.Code_Green.vo;

public class ReportVO {
	
	
	private int report_idx;				// 신고테이블 인덱스번호
	private int board_idx;				// 커뮤니티보드게시글 인덱스번호
	private String report_subject;		// 신고당한글제목
	private String report_content;		// 신고사유
	private String reporter;			// 신고 한 사람
	private String report_status;		// 신고처리상태
	private String report_date;			// 신고한 날짜 
	
	
	public int getReport_idx() {
		return report_idx;
	}
	public void setReport_idx(int report_idx) {
		this.report_idx = report_idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getReport_subject() {
		return report_subject;
	}
	public void setReport_subject(String report_subject) {
		this.report_subject = report_subject;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getReport_status() {
		return report_status;
	}
	public void setReport_status(String report_status) {
		this.report_status = report_status;
	}
	public String getReport_date() {
		return report_date;
	}
	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}
	
	
	@Override
	public String toString() {
		return "ReportVO [report_idx=" + report_idx + ", board_idx=" + board_idx + ", report_subject=" + report_subject
				+ ", report_content=" + report_content + ", reporter=" + reporter + ", report_status=" + report_status
				+ ", report_date=" + report_date + "]";
	}

	
	
	
}
