package com.itwillbs.Code_Green.vo;

public class QnaVO {
	private int qna_idx;
	private int qna_item;
	private String qna_type;
	private String qna_category;//답변상태(상품문의)
	private String qna_answer;
	private String qna_id;
	private String qna_pass;
	private String qna_subject;
	private String qna_content;
    private String qna_status;//답변상태
    private String qna_readcount;
    private String qna_date;
    private String item_idx; //상품번호
    private String item_name;
    private String manager_brandname;
    private String item_category;
    private String manager_id;
    
    
   
    public QnaVO() {}


	public String getManager_id() {
		return manager_id;
	}



	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}



	public int getQna_idx() {
		return qna_idx;
	}


	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}


	public int getQna_item() {
		return qna_item;
	}


	public void setQna_item(int qna_item) {
		this.qna_item = qna_item;
	}


	public String getQna_type() {
		return qna_type;
	}


	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}


	public String getQna_category() {
		return qna_category;
	}


	public void setQna_category(String qna_category) {
		this.qna_category = qna_category;
	}


	public String getQna_answer() {
		return qna_answer;
	}


	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}


	public String getQna_id() {
		return qna_id;
	}


	public void setQna_id(String qna_id) {
		this.qna_id = qna_id;
	}


	public String getQna_pass() {
		return qna_pass;
	}


	public void setQna_pass(String qna_pass) {
		this.qna_pass = qna_pass;
	}


	public String getQna_subject() {
		return qna_subject;
	}


	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}


	public String getQna_content() {
		return qna_content;
	}


	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}


	public String getQna_status() {
		return qna_status;
	}


	public void setQna_status(String qna_status) {
		this.qna_status = qna_status;
	}


	public String getQna_readcount() {
		return qna_readcount;
	}


	public void setQna_readcount(String qna_readcount) {
		this.qna_readcount = qna_readcount;
	}


	public String getQna_date() {
		return qna_date;
	}


	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}


	public String getItem_idx() {
		return item_idx;
	}


	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}


	public String getManager_brandname() {
		return manager_brandname;
	}


	public void setManager_brandname(String manager_brandname) {
		this.manager_brandname = manager_brandname;
	}


	public String getItem_category() {
		return item_category;
	}


	public void setItem_category(String item_category) {
		this.item_category = item_category;
	}

	
	public String getItem_name() {
		return item_name;
	}



	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	



	public QnaVO(int qna_idx, int qna_item, String qna_type, String qna_category, String qna_answer, String qna_id,
			String qna_pass, String qna_subject, String qna_content, String qna_status, String qna_readcount,
			String qna_date, String item_idx, String item_name, String manager_brandname, String item_category) {
		super();
		this.qna_idx = qna_idx;
		this.qna_item = qna_item;
		this.qna_type = qna_type;
		this.qna_category = qna_category;
		this.qna_answer = qna_answer;
		this.qna_id = qna_id;
		this.qna_pass = qna_pass;
		this.qna_subject = qna_subject;
		this.qna_content = qna_content;
		this.qna_status = qna_status;
		this.qna_readcount = qna_readcount;
		this.qna_date = qna_date;
		this.item_idx = item_idx;
		this.item_name = item_name;
		this.manager_brandname = manager_brandname;
		this.item_category = item_category;
	}



	@Override
	public String toString() {
		return "QnaVO [qna_idx=" + qna_idx + ", qna_item=" + qna_item + ", qna_type=" + qna_type + ", qna_category="
				+ qna_category + ", qna_answer=" + qna_answer + ", qna_id=" + qna_id + ", qna_pass=" + qna_pass
				+ ", qna_subject=" + qna_subject + ", qna_content=" + qna_content + ", qna_status=" + qna_status
				+ ", qna_readcount=" + qna_readcount + ", qna_date=" + qna_date + ", item_idx=" + item_idx
				+ ", item_name=" + item_name + ", manager_brandname=" + manager_brandname + ", item_category="
				+ item_category + "]";
	}



	
    
    
    
    
  
    
    
    
} 