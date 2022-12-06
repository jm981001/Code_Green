package com.itwillbs.Code_Green.vo;

import org.springframework.web.multipart.MultipartFile;

public class ItemVO {
   
   private int item_idx;
   private int sIdx;
   private String re_manager_idx;
   private String item_name;
   private String item_info;
   private String item_packing;
   private String item_category;
   private String item_price;
   private String item_sale;
   private String item_stock;
   private String item_status;
   private String item_readcount;
   private String item_date;
   private String file1;
   private String file2;
   private String manager_brandname;
   private String manager_info;
   private String board_star_score;
   private String count;
   private String star1;
   private String star2;
   private String star3;
   private String star4;
   private String star5;
   private String heart;
   private String member_id;
   private String member_idx;
   private String heart_idx;
   private String score;
   private String brand_itemCnt;
   private String manager_original_file;
   private String ranking;
   private String review;
   private MultipartFile file_1;
   private MultipartFile file_2;
   private String sell_amount;			// 주문목록상세볼때 아이템별 수량출력
   private String addItemPrice;			// 주문목록상세볼때 아이템별 수량*금액
   
   public String getReview() {
      return review;
   }
   public void setReview(String review) {
      this.review = review;
   }
   public String getRanking() {
      return ranking;
   }
   public void setRanking(String ranking) {
      this.ranking = ranking;
   }
   public int getsIdx() {
      return sIdx;
   }
   public void setsIdx(int sIdx) {
      this.sIdx = sIdx;
   }
   public int getItem_idx() {
      return item_idx;
   }
   public void setItem_idx(int item_idx) {
      this.item_idx = item_idx;
   }
   public String getRe_manager_idx() {
      return re_manager_idx;
   }
   public void setRe_manager_idx(String re_manager_idx) {
      this.re_manager_idx = re_manager_idx;
   }
   public String getItem_name() {
      return item_name;
   }
   public void setItem_name(String item_name) {
      this.item_name = item_name;
   }
   public String getItem_info() {
      return item_info;
   }
   public void setItem_info(String item_info) {
      this.item_info = item_info;
   }
   public String getItem_packing() {
      return item_packing;
   }
   public void setItem_packing(String item_packing) {
      this.item_packing = item_packing;
   }
   public String getItem_category() {
      return item_category;
   }
   public void setItem_category(String item_category) {
      this.item_category = item_category;
   }
   public String getItem_price() {
      return item_price;
   }
   public void setItem_price(String item_price) {
      this.item_price = item_price;
   }
   public String getItem_sale() {
      return item_sale;
   }
   public void setItem_sale(String item_sale) {
      this.item_sale = item_sale;
   }
   public String getItem_stock() {
      return item_stock;
   }
   public void setItem_stock(String item_stock) {
      this.item_stock = item_stock;
   }
   public String getItem_status() {
      return item_status;
   }
   public void setItem_status(String item_status) {
      this.item_status = item_status;
   }
   public String getItem_readcount() {
      return item_readcount;
   }
   public void setItem_readcount(String item_readcount) {
      this.item_readcount = item_readcount;
   }
   public String getItem_date() {
      return item_date;
   }
   public void setItem_date(String item_date) {
      this.item_date = item_date;
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
   public String getBoard_star_score() {
      return board_star_score;
   }
   public void setBoard_star_score(String board_star_score) {
      this.board_star_score = board_star_score;
   }
   public String getCount() {
      return count;
   }
   public void setCount(String count) {
      this.count = count;
   }
   public String getStar1() {
      return star1;
   }
   public void setStar1(String star1) {
      this.star1 = star1;
   }
   public String getStar2() {
      return star2;
   }
   public void setStar2(String star2) {
      this.star2 = star2;
   }
   public String getStar3() {
      return star3;
   }
   public void setStar3(String star3) {
      this.star3 = star3;
   }
   public String getStar4() {
      return star4;
   }
   public void setStar4(String star4) {
      this.star4 = star4;
   }
   public String getStar5() {
      return star5;
   }
   public void setStar5(String star5) {
      this.star5 = star5;
   }
   public String getHeart() {
      return heart;
   }
   public void setHeart(String heart) {
      this.heart = heart;
   }
   public String getMember_id() {
      return member_id;
   }
   public void setMember_id(String member_id) {
      this.member_id = member_id;
   }
   public String getMember_idx() {
      return member_idx;
   }
   public void setMember_idx(String member_idx) {
      this.member_idx = member_idx;
   }
   public String getHeart_idx() {
      return heart_idx;
   }
   public void setHeart_idx(String heart_idx) {
      this.heart_idx = heart_idx;
   }
   public String getScore() {
      return score;
   }
   public void setScore(String score) {
      this.score = score;
   }
   
   public String getBrand_itemCnt() {
      return brand_itemCnt;
   }
   public void setBrand_itemCnt(String brand_itemCnt) {
      this.brand_itemCnt = brand_itemCnt;
   }
   public String getManager_original_file() {
      return manager_original_file;
   }
   public void setManager_original_file(String manager_original_file) {
      this.manager_original_file = manager_original_file;
   }
   public MultipartFile getFile_1() {
      return file_1;
   }
   public void setFile_1(MultipartFile file_1) {
      this.file_1 = file_1;
   }
   public MultipartFile getFile_2() {
      return file_2;
   }
   public void setFile_2(MultipartFile file_2) {
      this.file_2 = file_2;
   }

   public String getSell_amount() {
	return sell_amount;
   }
   
   public void setSell_amount(String sell_amount) {
		this.sell_amount = sell_amount;
	}
   
   
	@Override
	public String toString() {
		return "ItemVO [item_idx=" + item_idx + ", sIdx=" + sIdx + ", re_manager_idx=" + re_manager_idx + ", item_name="
				+ item_name + ", item_info=" + item_info + ", item_packing=" + item_packing + ", item_category="
				+ item_category + ", item_price=" + item_price + ", item_sale=" + item_sale + ", item_stock=" + item_stock
				+ ", item_status=" + item_status + ", item_readcount=" + item_readcount + ", item_date=" + item_date
				+ ", file1=" + file1 + ", file2=" + file2 + ", manager_brandname=" + manager_brandname + ", manager_info="
				+ manager_info + ", board_star_score=" + board_star_score + ", count=" + count + ", star1=" + star1
				+ ", star2=" + star2 + ", star3=" + star3 + ", star4=" + star4 + ", star5=" + star5 + ", heart=" + heart
				+ ", member_id=" + member_id + ", member_idx=" + member_idx + ", heart_idx=" + heart_idx + ", score="
				+ score + ", brand_itemCnt=" + brand_itemCnt + ", manager_original_file=" + manager_original_file
				+ ", ranking=" + ranking + ", review=" + review + ", file_1=" + file_1 + ", file_2=" + file_2
				+ ", sell_amount=" + sell_amount + "]";
	}

   
   
   
   
   
   
   
   

   
   

   
}