package com.itwillbs.Code_Green.vo;

public class FollowVO {
	
	private int follow_idx;
	private int rf_member_idx;
	private int rf_manager_idx;
	private String member_id;
	private String follow_date;
	private String store_follower_cnt;
	private String manager_brandname;
	private String manager_original_file;
	
	public int getFollow_idx() {
		return follow_idx;
	}
	public void setFollow_idx(int follow_idx) {
		this.follow_idx = follow_idx;
	}
	public int getRf_member_idx() {
		return rf_member_idx;
	}
	public void setRf_member_idx(int rf_member_idx) {
		this.rf_member_idx = rf_member_idx;
	}
	public int getRf_manager_idx() {
		return rf_manager_idx;
	}
	public void setRf_manager_idx(int rf_manager_idx) {
		this.rf_manager_idx = rf_manager_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getFollow_date() {
		return follow_date;
	}
	public void setFollow_date(String follow_date) {
		this.follow_date = follow_date;
	}
	public String getStore_follower_cnt() {
		return store_follower_cnt;
	}
	public void setStore_follower_cnt(String store_follower_cnt) {
		this.store_follower_cnt = store_follower_cnt;
	}
	public String getManager_brandname() {
		return manager_brandname;
	}
	public void setManager_brandname(String manager_brandname) {
		this.manager_brandname = manager_brandname;
	}
	public String getManager_original_file() {
		return manager_original_file;
	}
	public void setManager_original_file(String manager_original_file) {
		this.manager_original_file = manager_original_file;
	}
	
	@Override
	public String toString() {
		return "FollowVO [follow_idx=" + follow_idx + ", rf_member_idx=" + rf_member_idx + ", rf_manager_idx="
				+ rf_manager_idx + ", member_id=" + member_id + ", follow_date=" + follow_date + ", store_follower_cnt="
				+ store_follower_cnt + ", manager_brandname=" + manager_brandname + ", manager_original_file="
				+ manager_original_file + "]";
	}
	
	
	
	

	
	
	
	
}
	