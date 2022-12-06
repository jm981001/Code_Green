package com.itwillbs.Code_Green.vo;

public class MemberVO {


	private int  	member_idx;
	private String  member_id ;
	private String  member_pass;
	private String  member_name;
	private String  member_phone;
	private String  member_email;
	private String  member_email_auth;
	private String  member_postcode;
	private String  member_address;
	private String  member_del_yn;
	private String  member_date;
	
	// 마이페이지때문에 추가한 항목들
	private String coin_total;		// 적립금 잔액
	private String heart_count;		// 좋아요 수
	private String board_count;		// 나의 글 수 
	private String follow_count;	// 팔로우 수
	private String qna_count;		// 1:1문의 수
	private String order_count;		// 주문내역 수
	
	
	
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pass() {
		return member_pass;
	}
	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_email_auth() {
		return member_email_auth;
	}
	public void setMember_email_auth(String member_email_auth) {
		this.member_email_auth = member_email_auth;
	}
	public String getMember_postcode() {
		return member_postcode;
	}
	public void setMember_postcode(String member_postcode) {
		this.member_postcode = member_postcode;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public String getMember_del_yn() {
		return member_del_yn;
	}
	public void setMember_del_yn(String member_del_yn) {
		this.member_del_yn = member_del_yn;
	}
	public String getMember_date() {
		return member_date;
	}
	public void setMember_date(String member_date) {
		this.member_date = member_date;
	}
	public String getCoin_total() {
		return coin_total;
	}
	public void setCoin_total(String coin_total) {
		this.coin_total = coin_total;
	}
	public String getHeart_count() {
		return heart_count;
	}
	public void setHeart_count(String heart_count) {
		this.heart_count = heart_count;
	}
	public String getBoard_count() {
		return board_count;
	}
	public void setBoard_count(String board_count) {
		this.board_count = board_count;
	}
	public String getFollow_count() {
		return follow_count;
	}
	public void setFollow_count(String follow_count) {
		this.follow_count = follow_count;
	}
	public String getQna_count() {
		return qna_count;
	}
	public void setQna_count(String qna_count) {
		this.qna_count = qna_count;
	}
	public String getOrder_count() {
		return order_count;
	}
	public void setOrder_count(String order_count) {
		this.order_count = order_count;
	}
	
	
	
	@Override
	public String toString() {
		return "MemberVO [member_idx=" + member_idx + ", member_id=" + member_id + ", member_pass=" + member_pass
				+ ", member_name=" + member_name + ", member_phone=" + member_phone + ", member_email=" + member_email
				+ ", member_email_auth=" + member_email_auth + ", member_postcode=" + member_postcode
				+ ", member_address=" + member_address + ", member_del_yn=" + member_del_yn + ", member_date="
				+ member_date + ", coin_total=" + coin_total + ", heart_count=" + heart_count + ", board_count="
				+ board_count + ", follow_count=" + follow_count + ", qna_count=" + qna_count + ", order_count="
				+ order_count + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
