package com.itwillbs.Code_Green.vo;

import org.springframework.web.multipart.MultipartFile;

public class ManagerVO {
	private int         manager_idx; 
	private String  	manager_id;
	private String  	manager_pass;
	private String  	manager_name; 
	private String  	manager_brandname; 
	private String 		manager_info;
	private String  	manager_storecode; 
	private String  	manager_phone; 
	private String  	manager_email; 
	private String  	manager_email_auth; 
	private String  	manager_postcode; 
	private String  	manager_address; 
	private String      manager_adminauth;
	private String      manager_realfile; // 원본 파일명
	private String     	manager_original_file; // 실제 업로드 된 파일명(중복처리 된 파일명)
	private String     	manager_del_yn; 
	private String		manager_date;
	private MultipartFile file;// 파일 처리(input type="file")를 위한 MultipartFile 타입 선언 
	private String 		brand_itemCnt; // 브랜드별 아이템수 집계
	private int 		sellCount;	//판매수량
	private int 		orderCount;	//주문건수
	private int 		brandtotal;	//브랜드매출
	private int 		ranking;	//순위
	private String		brand_follower;//브랜드 팔로워 수
	private String      star_score;
	private String 		salesMonth;	//한달매출
	private String 		salesWeek;	//일주일매출
	private String 		salesday;	//하루매출
	private String 		salesTotal;	//총매출
	private String 		MONTH;
	private String         WEEK;
	private String         DAY;
	private String         start;
	private String         end;
	private String         sum;
	
	
	public ManagerVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ManagerVO [manager_idx=" + manager_idx + ", manager_id=" + manager_id + ", manager_pass=" + manager_pass
				+ ", manager_name=" + manager_name + ", manager_brandname=" + manager_brandname + ", manager_info="
				+ manager_info + ", manager_storecode=" + manager_storecode + ", manager_phone=" + manager_phone
				+ ", manager_email=" + manager_email + ", manager_email_auth=" + manager_email_auth
				+ ", manager_postcode=" + manager_postcode + ", manager_address=" + manager_address
				+ ", manager_adminauth=" + manager_adminauth + ", manager_realfile=" + manager_realfile
				+ ", manager_original_file=" + manager_original_file + ", manager_del_yn=" + manager_del_yn
				+ ", manager_date=" + manager_date + ", file=" + file + ", brand_itemCnt=" + brand_itemCnt
				+ ", sellCount=" + sellCount + ", orderCount=" + orderCount + ", brandtotal=" + brandtotal
				+ ", ranking=" + ranking + ", brand_follower=" + brand_follower + ", star_score=" + star_score
				+ ", salesMonth=" + salesMonth + ", salesWeek=" + salesWeek + ", salesday=" + salesday + ", salesTotal="
				+ salesTotal + ", MONTH=" + MONTH + ", WEEK=" + WEEK + ", DAY=" + DAY + ", start=" + start + ", end="
				+ end + ", sum=" + sum + "]";
	}
	public ManagerVO(int manager_idx, String manager_id, String manager_pass, String manager_name,
			String manager_brandname, String manager_info, String manager_storecode, String manager_phone,
			String manager_email, String manager_email_auth, String manager_postcode, String manager_address,
			String manager_adminauth, String manager_realfile, String manager_original_file, String manager_del_yn,
			String manager_date, MultipartFile file, String brand_itemCnt, int sellCount, int orderCount,
			int brandtotal, int ranking, String brand_follower, String star_score, String salesMonth, String salesWeek,
			String salesday, String salesTotal, String mONTH, String wEEK, String dAY, String start, String end,
			String sum) {
		super();
		this.manager_idx = manager_idx;
		this.manager_id = manager_id;
		this.manager_pass = manager_pass;
		this.manager_name = manager_name;
		this.manager_brandname = manager_brandname;
		this.manager_info = manager_info;
		this.manager_storecode = manager_storecode;
		this.manager_phone = manager_phone;
		this.manager_email = manager_email;
		this.manager_email_auth = manager_email_auth;
		this.manager_postcode = manager_postcode;
		this.manager_address = manager_address;
		this.manager_adminauth = manager_adminauth;
		this.manager_realfile = manager_realfile;
		this.manager_original_file = manager_original_file;
		this.manager_del_yn = manager_del_yn;
		this.manager_date = manager_date;
		this.file = file;
		this.brand_itemCnt = brand_itemCnt;
		this.sellCount = sellCount;
		this.orderCount = orderCount;
		this.brandtotal = brandtotal;
		this.ranking = ranking;
		this.brand_follower = brand_follower;
		this.star_score = star_score;
		this.salesMonth = salesMonth;
		this.salesWeek = salesWeek;
		this.salesday = salesday;
		this.salesTotal = salesTotal;
		MONTH = mONTH;
		WEEK = wEEK;
		DAY = dAY;
		this.start = start;
		this.end = end;
		this.sum = sum;
	}
	public int getManager_idx() {
		return manager_idx;
	}
	public void setManager_idx(int manager_idx) {
		this.manager_idx = manager_idx;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getManager_pass() {
		return manager_pass;
	}
	public void setManager_pass(String manager_pass) {
		this.manager_pass = manager_pass;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public String getManager_brandname() {
		return manager_brandname;
	}
	public void setManager_brandname(String manager_brandname) {
		this.manager_brandname = manager_brandname;
	}
	public String getManager_info() {
		return manager_info;
	}
	public void setManager_info(String manager_info) {
		this.manager_info = manager_info;
	}
	public String getManager_storecode() {
		return manager_storecode;
	}
	public void setManager_storecode(String manager_storecode) {
		this.manager_storecode = manager_storecode;
	}
	public String getManager_phone() {
		return manager_phone;
	}
	public void setManager_phone(String manager_phone) {
		this.manager_phone = manager_phone;
	}
	public String getManager_email() {
		return manager_email;
	}
	public void setManager_email(String manager_email) {
		this.manager_email = manager_email;
	}
	public String getManager_email_auth() {
		return manager_email_auth;
	}
	public void setManager_email_auth(String manager_email_auth) {
		this.manager_email_auth = manager_email_auth;
	}
	public String getManager_postcode() {
		return manager_postcode;
	}
	public void setManager_postcode(String manager_postcode) {
		this.manager_postcode = manager_postcode;
	}
	public String getManager_address() {
		return manager_address;
	}
	public void setManager_address(String manager_address) {
		this.manager_address = manager_address;
	}
	public String getManager_adminauth() {
		return manager_adminauth;
	}
	public void setManager_adminauth(String manager_adminauth) {
		this.manager_adminauth = manager_adminauth;
	}
	public String getManager_realfile() {
		return manager_realfile;
	}
	public void setManager_realfile(String manager_realfile) {
		this.manager_realfile = manager_realfile;
	}
	public String getManager_original_file() {
		return manager_original_file;
	}
	public void setManager_original_file(String manager_original_file) {
		this.manager_original_file = manager_original_file;
	}
	public String getManager_del_yn() {
		return manager_del_yn;
	}
	public void setManager_del_yn(String manager_del_yn) {
		this.manager_del_yn = manager_del_yn;
	}
	public String getManager_date() {
		return manager_date;
	}
	public void setManager_date(String manager_date) {
		this.manager_date = manager_date;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getBrand_itemCnt() {
		return brand_itemCnt;
	}
	public void setBrand_itemCnt(String brand_itemCnt) {
		this.brand_itemCnt = brand_itemCnt;
	}
	public int getSellCount() {
		return sellCount;
	}
	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public int getBrandtotal() {
		return brandtotal;
	}
	public void setBrandtotal(int brandtotal) {
		this.brandtotal = brandtotal;
	}
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
	public String getBrand_follower() {
		return brand_follower;
	}
	public void setBrand_follower(String brand_follower) {
		this.brand_follower = brand_follower;
	}
	public String getStar_score() {
		return star_score;
	}
	public void setStar_score(String star_score) {
		this.star_score = star_score;
	}
	public String getSalesMonth() {
		return salesMonth;
	}
	public void setSalesMonth(String salesMonth) {
		this.salesMonth = salesMonth;
	}
	public String getSalesWeek() {
		return salesWeek;
	}
	public void setSalesWeek(String salesWeek) {
		this.salesWeek = salesWeek;
	}
	public String getSalesday() {
		return salesday;
	}
	public void setSalesday(String salesday) {
		this.salesday = salesday;
	}
	public String getSalesTotal() {
		return salesTotal;
	}
	public void setSalesTotal(String salesTotal) {
		this.salesTotal = salesTotal;
	}
	public String getMONTH() {
		return MONTH;
	}
	public void setMONTH(String mONTH) {
		MONTH = mONTH;
	}
	public String getWEEK() {
		return WEEK;
	}
	public void setWEEK(String wEEK) {
		WEEK = wEEK;
	}
	public String getDAY() {
		return DAY;
	}
	public void setDAY(String dAY) {
		DAY = dAY;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	
	
	


}