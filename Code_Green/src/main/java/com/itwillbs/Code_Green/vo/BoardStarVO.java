package com.itwillbs.Code_Green.vo;

public class BoardStarVO {

	private int board_star_idx;
	private int rf_board_idx;
	private int board_star_score;
	
	public int getBoard_star_idx() {
		return board_star_idx;
	}
	public void setBoard_star_idx(int board_star_idx) {
		this.board_star_idx = board_star_idx;
	}
	public int getRf_board_idx() {
		return rf_board_idx;
	}
	public void setRf_board_idx(int rf_board_idx) {
		this.rf_board_idx = rf_board_idx;
	}
	public int getBoard_star_score() {
		return board_star_score;
	}
	public void setBoard_star_score(int board_star_score) {
		this.board_star_score = board_star_score;
	}
	
	public BoardStarVO() {
		// TODO Auto-generated constructor stub
	}
	public BoardStarVO(int board_star_idx, int rf_board_idx, int board_star_score) {
		super();
		this.board_star_idx = board_star_idx;
		this.rf_board_idx = rf_board_idx;
		this.board_star_score = board_star_score;
	}
	@Override
	public String toString() {
		return "BoardStarVO [board_star_idx=" + board_star_idx + ", rf_board_idx=" + rf_board_idx
				+ ", board_star_score=" + board_star_score + "]";
	}
	
	
}
