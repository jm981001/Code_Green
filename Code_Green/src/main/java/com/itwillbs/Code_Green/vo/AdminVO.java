package com.itwillbs.Code_Green.vo;

public class AdminVO {
	private int admin_idx;
	private String admin_id;
	private String admin_pass;
	
	
	public AdminVO() {}


	public int getAdmin_idx() {
		return admin_idx;
	}


	public void setAdmin_idx(int admin_idx) {
		this.admin_idx = admin_idx;
	}


	public String getAdmin_id() {
		return admin_id;
	}


	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}


	public String getAdmin_pass() {
		return admin_pass;
	}


	public void setAdmin_pass(String admin_pass) {
		this.admin_pass = admin_pass;
	}


	public AdminVO(int admin_idx, String admin_id, String admin_pass) {
		super();
		this.admin_idx = admin_idx;
		this.admin_id = admin_id;
		this.admin_pass = admin_pass;
	}

	
	
}
