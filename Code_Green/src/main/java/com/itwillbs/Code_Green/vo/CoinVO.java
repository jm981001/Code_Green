package com.itwillbs.Code_Green.vo;

public class CoinVO {

	private int coin_idx ;
	private int rf_member_idx;
	private String coin_content;
	private String coin_add;
	private String coin_use;
	private String coin_charge;
	private String coin_total;
	private String coin_date;
	private String member_idx;
	private String total;
	private String board_id;
	private String member_id;
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public int getCoin_idx() {
		return coin_idx;
	}
	public void setCoin_idx(int coin_idx) {
		this.coin_idx = coin_idx;
	}
	public int getRf_member_idx() {
		return rf_member_idx;
	}
	public void setRf_member_idx(int rf_member_idx) {
		this.rf_member_idx = rf_member_idx;
	}
	
	public String getCoin_content() {
		return coin_content;
	}
	public void setCoin_content(String coin_content) {
		this.coin_content = coin_content;
	}
	public String getCoin_add() {
		return coin_add;
	}
	public void setCoin_add(String coin_add) {
		this.coin_add = coin_add;
	}
	public String getCoin_use() {
		return coin_use;
	}
	public void setCoin_use(String coin_use) {
		this.coin_use = coin_use;
	}
	public String getCoin_charge() {
		return coin_charge;
	}
	public void setCoin_charge(String coin_charge) {
		this.coin_charge = coin_charge;
	}
	public String getCoin_total() {
		return coin_total;
	}
	public void setCoin_total(String coin_total) {
		this.coin_total = coin_total;
	}
	public String getCoin_date() {
		return coin_date;
	}
	public void setCoin_date(String coin_date) {
		this.coin_date = coin_date;
	}
	
	public String getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}
	
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "CoinVO [coin_idx=" + coin_idx + ", rf_member_idx=" + rf_member_idx + ", coin_add=" + coin_add
				+ ", coin_use=" + coin_use + ", coin_charge=" + coin_charge + ", coin_total=" + coin_total
				+ ", coin_date=" + coin_date + "]";
	}
	public CoinVO(int coin_idx, int rf_member_idx, String coin_add, String coin_use, String coin_charge,
			String coin_total, String coin_date) {
		super();
		this.coin_idx = coin_idx;
		this.rf_member_idx = rf_member_idx;
		this.coin_add = coin_add;
		this.coin_use = coin_use;
		this.coin_charge = coin_charge;
		this.coin_total = coin_total;
		this.coin_date = coin_date;
	}
	
	
	public CoinVO() {
		// TODO Auto-generated constructor stub
	}
}
