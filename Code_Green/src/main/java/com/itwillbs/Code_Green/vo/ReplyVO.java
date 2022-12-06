package com.itwillbs.Code_Green.vo;

public class ReplyVO {
	
	private int reply_idx;				// 댓글테이블 인덱스번호
	private String reply_type;			// 댓글들어가는 게시판타입(커뮤,후기,리뷰등)
	private String reply_id;			// 댓글작성자
	private String reply_content;		// 댓글내용

	private int reply_bo_ref;			// 원본 참조게시글 인덱스번호 
	private int reply_re_ref;			// 댓글 원본참조댓글 인덱스 번호	
	private int reply_re_lev;			// 댓글 레벨
	private int reply_re_seq;			// 댓글시퀀스번호		
	private String reply_date;			// 댓글작성일
	
	
	public int getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}
	public String getReply_type() {
		return reply_type;
	}
	public void setReply_type(String reply_type) {
		this.reply_type = reply_type;
	}
	public String getReply_id() {
		return reply_id;
	}
	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	
	public int getReply_bo_ref() {
		return reply_bo_ref;
	}
	
	public void setReply_bo_ref(int reply_bo_ref) {
		this.reply_bo_ref = reply_bo_ref;
	}
	
	public int getReply_re_ref() {
		return reply_re_ref;
	}
	
	public void setReply_re_ref(int reply_re_ref) {
		this.reply_re_ref = reply_re_ref;
	}
	public int getReply_re_lev() {
		return reply_re_lev;
	}
	public void setReply_re_lev(int reply_re_lev) {
		this.reply_re_lev = reply_re_lev;
	}
	public int getReply_re_seq() {
		return reply_re_seq;
	}
	public void setReply_re_seq(int reply_re_seq) {
		this.reply_re_seq = reply_re_seq;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	
	
	@Override
	public String toString() {
		return "ReplyVO [reply_idx=" + reply_idx + ", reply_type=" + reply_type + ", reply_id=" + reply_id
				+ ", reply_content=" + reply_content + ", reply_bo_ref=" + reply_bo_ref + ", reply_re_ref="
				+ reply_re_ref + ", reply_re_lev=" + reply_re_lev + ", reply_re_seq=" + reply_re_seq + ", reply_date="
				+ reply_date + "]";
	}
	
	
	
	
	
	
	
}
