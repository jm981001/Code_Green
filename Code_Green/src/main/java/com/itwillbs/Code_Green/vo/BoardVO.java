package com.itwillbs.Code_Green.vo;

public class BoardVO {

	private int board_idx;
	private int board_item_idx; // 상품번호 (없으면 N)
	private String board_type; // 게시판 타입 (커뮤, 후기)
	private String board_id; // 아이디
	private String board_category; // 말머리
	private String board_subject; // 제목
	private String board_content; // 내용
	private String board_readcount; // 조회수
	private String board_date; // 날짜
	private int best_cnt;	   // 게시물별 추천(좋아요) 수 집계컬럼
	private int reply_cnt;     // 게시물별 댓글 수 집계컬럼 
	private String item_idx; //상품번호
	private String member_id; 
	private String file1;
	private String file2;
	private String file3;
	private String board_star_score;
	private String item_category;
	private String best_count;
	private String reply_count;
	private String manager_brandname;
	private String item_name; 
	
	
	public BoardVO() {}
	
	
	public String getReply_count() {
		return reply_count;
	}
	public void setReply_count(String reply_count) {
		this.reply_count = reply_count;
	}
	public String getBest_count() {
		return best_count;
	}
	public void setBest_count(String best_count) {
		this.best_count = best_count;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public int getBoard_item_idx() {
		return board_item_idx;
	}
	public void setBoard_item_idx(int board_item_idx) {
		this.board_item_idx = board_item_idx;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(String board_readcount) {
		this.board_readcount = board_readcount;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	
	public int getBest_cnt() {
		return best_cnt;
	}
	public void setBest_cnt(int best_cnt) {
		this.best_cnt = best_cnt;
	}
	public int getReply_cnt() {
		return reply_cnt;
	}
	public void setReply_cnt(int reply_cnt) {
		this.reply_cnt = reply_cnt;
	}
	
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getFile2() {
		return file2;
	}
	public void setFile2(String file2) {
		this.file2 = file2;
	}
	
	public String getFile3() {
		return file3;
	}
	public void setFile3(String file3) {
		this.file3 = file3;
	}
	
	public String getBoard_star_score() {
		return board_star_score;
	}
	public void setBoard_star_score(String board_star_score) {
		this.board_star_score = board_star_score;
	}
	
	
	public String getItem_category() {
		return item_category;
	}
	public void setItem_category(String item_category) {
		this.item_category = item_category;
	}
	
	public String getManager_brandname() {
		return manager_brandname;
	}
	public void setManager_brandname(String manager_brandname) {
		this.manager_brandname = manager_brandname;
	}
	
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	
	
	
	@Override
	public String toString() {
		return "BoardVO [board_idx=" + board_idx + ", board_item_idx=" + board_item_idx + ", board_type=" + board_type
				+ ", board_id=" + board_id + ", board_category=" + board_category + ", board_subject=" + board_subject
				+ ", board_content=" + board_content + ", board_readcount=" + board_readcount + ", board_date="
				+ board_date + ", best_cnt=" + best_cnt + ", reply_cnt=" + reply_cnt + ", item_idx=" + item_idx
				+ ", member_id=" + member_id + ", file1=" + file1 + ", file2=" + file2 + ", file3=" + file3
				+ ", board_star_score=" + board_star_score + ", item_category=" + item_category + ", best_count="
				+ best_count + ", reply_count=" + reply_count + ", manager_brandname=" + manager_brandname
				+ ", item_name=" + item_name + "]";
	}
	
	
	
	
	
	
	
	
}
