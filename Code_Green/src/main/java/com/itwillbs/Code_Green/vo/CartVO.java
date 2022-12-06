package com.itwillbs.Code_Green.vo;

public class CartVO {
	private int cart_idx;
	private int rf_item_idx;
	private int rf_member_idx;
	private int cart_amount;
	private String cart_total; // 개별 상품당 총 금액(가격 * 갯수)
	private String item_name;
	private String item_price;
	private String manager_brandname;
	private String file1;
	private String item_category;
	
	public int getCart_idx() {
		return cart_idx;
	}
	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
	}
	public int getRf_item_idx() {
		return rf_item_idx;
	}
	public void setRf_item_idx(int rf_item_idx) {
		this.rf_item_idx = rf_item_idx;
	}
	public int getRf_member_idx() {
		return rf_member_idx;
	}
	public void setRf_member_idx(int rf_member_idx) {
		this.rf_member_idx = rf_member_idx;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	public String getCart_total() {
		return cart_total;
	}
	public void setCart_total(String cart_total) {
		this.cart_total = cart_total;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_price() {
		return item_price;
	}
	public void setItem_price(String item_price) {
		this.item_price = item_price;
	}
	public String getManager_brandname() {
		return manager_brandname;
	}
	public void setManager_brandname(String manager_brandname) {
		this.manager_brandname = manager_brandname;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getItem_category() {
		return item_category;
	}
	public void setItem_category(String item_category) {
		this.item_category = item_category;
	}
	@Override
	public String toString() {
		return "CartVO [cart_idx=" + cart_idx + ", rf_item_idx=" + rf_item_idx + ", rf_member_idx=" + rf_member_idx
				+ ", cart_amount=" + cart_amount + ", cart_total=" + cart_total + ", item_name=" + item_name
				+ ", item_price=" + item_price + ", manager_brandname=" + manager_brandname + ", file1=" + file1
				+ ", item_category=" + item_category + "]";
	}
	

}
