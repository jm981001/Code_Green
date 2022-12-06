package com.itwillbs.Code_Green.vo;

public class TotalVO {
	private int brandtotal;//브랜드매출
	private String  manager_brandname;//브랜드명
	private String days; //날짜
	private String dayTotal;//일매출
	 
	
	
	
	public TotalVO() {}




	public int getBrandtotal() {
		return brandtotal;
	}

	public void setBrandtotal(int brandtotal) {
		this.brandtotal = brandtotal;
	}

	public String getManager_brandname() {
		return manager_brandname;
	}

	public void setManager_brandname(String manager_brandname) {
		this.manager_brandname = manager_brandname;
	}

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	public String getDayTotal() {
		return dayTotal;
	}

	public void setDayTotal(String dayTotal) {
		this.dayTotal = dayTotal;
	}




	public TotalVO(int brandtotal, String manager_brandname, String days, String dayTotal) {
		super();
		this.brandtotal = brandtotal;
		this.manager_brandname = manager_brandname;
		this.days = days;
		this.dayTotal = dayTotal;
	}




	@Override
	public String toString() {
		return "TotalVO [brandtotal=" + brandtotal + ", manager_brandname=" + manager_brandname + ", days=" + days
				+ ", dayTotal=" + dayTotal + "]";
	}
	
	
	

	
	
	
	
	
	
	
}
