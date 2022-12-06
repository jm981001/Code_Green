package com.itwillbs.Code_Green.vo;


public class SellVO {
	// 전체적인 주문 내역
	// 주문에 대한 상세는 SellDetailVO => 후에 만들 것
	private int sell_idx; // 주문테이블 인덱스 번호
	private int rf_member_idx; // 회원 번호
	private String sell_amount; // 총 구매 수량 // 상품당 구매 수량은 detail
	private String sell_usecoin; // 사용한 적립금
	private String sell_total_price; // 결제할 금액
	private String sell_status; // 주문상태  / default '결제대기중'
	private String sell_postcode; // 받는 사람 우편번호
	private String sell_address;  // 받는 사람 주소
	private String sell_phone; // 받는 사람 연락처
	private String sell_receiver; // 받는 사람 이름
	private String sell_date; // 주문일
	private String sell_pay_type; // 결제수단
	private String sell_pay_status; // 결제여부 / default 'N'
	private String sell_pay_date; // 결제일
	private String sell_order_number; // 주문번호
	private String sell_cancel_status; // 취소요청처리

	private String sell_detail_idx; // 주문상세번호
	private String item_name; // 상품명
	private String item_price; // 상품가격
	private String item_idx; // 상품가격
	private String item_category; // 상품 카테고리
	private String manager_brandname; // 상품 브랜드
	private String file1; // 상품사진
	private String member_email; // 카드결제시 필요한 이메일
	
	private int total;//총매출
	private int sell_count;//총주문수
	private int brandtotal;
	private int	net;//순수익
	private int brand_net;//기업순수익
	private int salesTotal;
	private int commission;//수수료
	
	
	private String member_id;//회원아이디

	

	public SellVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	@Override
	public String toString() {
		return "SellVO [sell_idx=" + sell_idx + ", rf_member_idx=" + rf_member_idx + ", sell_amount=" + sell_amount
				+ ", sell_usecoin=" + sell_usecoin + ", sell_total_price=" + sell_total_price + ", sell_status="
				+ sell_status + ", sell_postcode=" + sell_postcode + ", sell_address=" + sell_address + ", sell_phone="
				+ sell_phone + ", sell_receiver=" + sell_receiver + ", sell_date=" + sell_date + ", sell_pay_type="
				+ sell_pay_type + ", sell_pay_status=" + sell_pay_status + ", sell_pay_date=" + sell_pay_date
				+ ", sell_order_number=" + sell_order_number + ", sell_cancel_status=" + sell_cancel_status
				+ ", sell_detail_idx=" + sell_detail_idx + ", item_name=" + item_name + ", item_price=" + item_price
				+ ", item_idx=" + item_idx + ", item_category=" + item_category + ", manager_brandname="
				+ manager_brandname + ", file1=" + file1 + ", member_email=" + member_email + ", total=" + total
				+ ", sell_count=" + sell_count + ", brandtotal=" + brandtotal + ", net=" + net + ", brand_net="
				+ brand_net + ", salesTotal=" + salesTotal + ", commission=" + commission + ", member_id=" + member_id
				+ "]";
	}


	public SellVO(int sell_idx, int rf_member_idx, String sell_amount, String sell_usecoin, String sell_total_price,
			String sell_status, String sell_postcode, String sell_address, String sell_phone, String sell_receiver,
			String sell_date, String sell_pay_type, String sell_pay_status, String sell_pay_date,
			String sell_order_number, String sell_cancel_status, String sell_detail_idx, String item_name,
			String item_price, String item_idx, String item_category, String manager_brandname, String file1,
			String member_email, int total, int sell_count, int brandtotal, int net, int brand_net, int salesTotal,
			int commission, String member_id) {
		super();
		this.sell_idx = sell_idx;
		this.rf_member_idx = rf_member_idx;
		this.sell_amount = sell_amount;
		this.sell_usecoin = sell_usecoin;
		this.sell_total_price = sell_total_price;
		this.sell_status = sell_status;
		this.sell_postcode = sell_postcode;
		this.sell_address = sell_address;
		this.sell_phone = sell_phone;
		this.sell_receiver = sell_receiver;
		this.sell_date = sell_date;
		this.sell_pay_type = sell_pay_type;
		this.sell_pay_status = sell_pay_status;
		this.sell_pay_date = sell_pay_date;
		this.sell_order_number = sell_order_number;
		this.sell_cancel_status = sell_cancel_status;
		this.sell_detail_idx = sell_detail_idx;
		this.item_name = item_name;
		this.item_price = item_price;
		this.item_idx = item_idx;
		this.item_category = item_category;
		this.manager_brandname = manager_brandname;
		this.file1 = file1;
		this.member_email = member_email;
		this.total = total;
		this.sell_count = sell_count;
		this.brandtotal = brandtotal;
		this.net = net;
		this.brand_net = brand_net;
		this.salesTotal = salesTotal;
		this.commission = commission;
		this.member_id = member_id;
	}


	public int getSell_idx() {
		return sell_idx;
	}


	public void setSell_idx(int sell_idx) {
		this.sell_idx = sell_idx;
	}


	public int getRf_member_idx() {
		return rf_member_idx;
	}


	public void setRf_member_idx(int rf_member_idx) {
		this.rf_member_idx = rf_member_idx;
	}


	public String getSell_amount() {
		return sell_amount;
	}


	public void setSell_amount(String sell_amount) {
		this.sell_amount = sell_amount;
	}


	public String getSell_usecoin() {
		return sell_usecoin;
	}


	public void setSell_usecoin(String sell_usecoin) {
		this.sell_usecoin = sell_usecoin;
	}


	public String getSell_total_price() {
		return sell_total_price;
	}


	public void setSell_total_price(String sell_total_price) {
		this.sell_total_price = sell_total_price;
	}


	public String getSell_status() {
		return sell_status;
	}


	public void setSell_status(String sell_status) {
		this.sell_status = sell_status;
	}


	public String getSell_postcode() {
		return sell_postcode;
	}


	public void setSell_postcode(String sell_postcode) {
		this.sell_postcode = sell_postcode;
	}


	public String getSell_address() {
		return sell_address;
	}


	public void setSell_address(String sell_address) {
		this.sell_address = sell_address;
	}


	public String getSell_phone() {
		return sell_phone;
	}


	public void setSell_phone(String sell_phone) {
		this.sell_phone = sell_phone;
	}


	public String getSell_receiver() {
		return sell_receiver;
	}


	public void setSell_receiver(String sell_receiver) {
		this.sell_receiver = sell_receiver;
	}


	public String getSell_date() {
		return sell_date;
	}


	public void setSell_date(String sell_date) {
		this.sell_date = sell_date;
	}


	public String getSell_pay_type() {
		return sell_pay_type;
	}


	public void setSell_pay_type(String sell_pay_type) {
		this.sell_pay_type = sell_pay_type;
	}


	public String getSell_pay_status() {
		return sell_pay_status;
	}


	public void setSell_pay_status(String sell_pay_status) {
		this.sell_pay_status = sell_pay_status;
	}


	public String getSell_pay_date() {
		return sell_pay_date;
	}


	public void setSell_pay_date(String sell_pay_date) {
		this.sell_pay_date = sell_pay_date;
	}


	public String getSell_order_number() {
		return sell_order_number;
	}


	public void setSell_order_number(String sell_order_number) {
		this.sell_order_number = sell_order_number;
	}


	public String getSell_cancel_status() {
		return sell_cancel_status;
	}


	public void setSell_cancel_status(String sell_cancel_status) {
		this.sell_cancel_status = sell_cancel_status;
	}


	public String getSell_detail_idx() {
		return sell_detail_idx;
	}


	public void setSell_detail_idx(String sell_detail_idx) {
		this.sell_detail_idx = sell_detail_idx;
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


	public String getItem_idx() {
		return item_idx;
	}


	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
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


	public String getFile1() {
		return file1;
	}


	public void setFile1(String file1) {
		this.file1 = file1;
	}


	public String getMember_email() {
		return member_email;
	}


	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public int getSell_count() {
		return sell_count;
	}


	public void setSell_count(int sell_count) {
		this.sell_count = sell_count;
	}


	public int getBrandtotal() {
		return brandtotal;
	}


	public void setBrandtotal(int brandtotal) {
		this.brandtotal = brandtotal;
	}


	public int getNet() {
		return net;
	}


	public void setNet(int net) {
		this.net = net;
	}


	public int getBrand_net() {
		return brand_net;
	}


	public void setBrand_net(int brand_net) {
		this.brand_net = brand_net;
	}


	public int getSalesTotal() {
		return salesTotal;
	}


	public void setSalesTotal(int salesTotal) {
		this.salesTotal = salesTotal;
	}


	public int getCommission() {
		return commission;
	}


	public void setCommission(int commission) {
		this.commission = commission;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	

	
	
}
