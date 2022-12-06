package com.itwillbs.Code_Green.vo;

public class BoardBestVO {
	
	private int board_best_idx;	// 추천하기테이블 내 인덱스번호
	private int rf_member_idx;	// 멤버테이블 idx 참조하는 인덱스번호
	private int rf_board_idx;	// 보드테이블 idx 참조하는 인덱스번호
	private int item_idx;
	
	public int getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(int item_idx) {
		this.item_idx = item_idx;
	}
	public int getBoard_best_idx() {
		return board_best_idx;
	}
	public void setBoard_best_idx(int board_best_idx) {
		this.board_best_idx = board_best_idx;
	}
	public int getRf_member_idx() {
		return rf_member_idx;
	}
	public void setRf_member_idx(int rf_member_idx) {
		this.rf_member_idx = rf_member_idx;
	}
	public int getRf_board_idx() {
		return rf_board_idx;
	}
	public void setRf_board_idx(int rf_board_idx) {
		this.rf_board_idx = rf_board_idx;
	}
	
	
	@Override
	public String toString() {
		return "BoardBestVO [board_best_idx=" + board_best_idx + ", rf_member_idx=" + rf_member_idx + ", rf_board_idx="
				+ rf_board_idx + "]";
	}
	
	
	
	
	
}
