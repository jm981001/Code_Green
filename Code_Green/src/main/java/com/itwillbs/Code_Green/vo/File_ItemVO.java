package com.itwillbs.Code_Green.vo;

import org.springframework.web.multipart.MultipartFile;

public class File_ItemVO {
 
 private int  file_item_idx;
 private String  file1;
 private String  file2;
 private int  rf_item_idx;
 private MultipartFile file_1;
 private MultipartFile file_2;
 private String item_idx;
 
 
 
 
public int getFile_item_idx() {
	return file_item_idx;
}
public void setFile_item_idx(int file_item_idx) {
	this.file_item_idx = file_item_idx;
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
public int getRf_item_idx() {
	return rf_item_idx;
}
public void setRf_item_idx(int rf_item_idx) {
	this.rf_item_idx = rf_item_idx;
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
public String getItem_idx() {
	return item_idx;
}
public void setItem_idx(String item_idx) {
	this.item_idx = item_idx;
}



public File_ItemVO() {
	super();
	// TODO Auto-generated constructor stub
}
public File_ItemVO(int file_item_idx, String file1, String file2, int rf_item_idx, MultipartFile file_1,
		MultipartFile file_2, String item_idx) {
	super();
	this.file_item_idx = file_item_idx;
	this.file1 = file1;
	this.file2 = file2;
	this.rf_item_idx = rf_item_idx;
	this.file_1 = file_1;
	this.file_2 = file_2;
	this.item_idx = item_idx;
}
@Override
public String toString() {
	return "File_ItemVO [file_item_idx=" + file_item_idx + ", file1=" + file1 + ", file2=" + file2 + ", rf_item_idx="
			+ rf_item_idx + ", file_1=" + file_1 + ", file_2=" + file_2 + ", item_idx=" + item_idx + "]";
}



	
}
