package com.itwillbs.Code_Green.vo;

import org.springframework.web.multipart.MultipartFile;

public class File_boardVO {
 
 private int  file_board_idx;
 private String  file1;
 private String  file2;
 private String  file3;
 private int  rf_board_idx;
 private MultipartFile file_1;
 private MultipartFile file_2;
 private MultipartFile file_3;
 private String item_idx;
 private String board_idx;
 
public int getFile_board_idx() {
	return file_board_idx;
}
public void setFile_board_idx(int file_board_idx) {
	this.file_board_idx = file_board_idx;
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
public String getFile3() {
	return file3;
}
public void setFile3(String file3) {
	this.file3 = file3;
}
public int getRf_board_idx() {
	return rf_board_idx;
}
public void setRf_board_idx(int rf_board_idx) {
	this.rf_board_idx = rf_board_idx;
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
public MultipartFile getFile_3() {
	return file_3;
}
public void setFile_3(MultipartFile file_3) {
	this.file_3 = file_3;
}
public String getItem_idx() {
	return item_idx;
}
public void setItem_idx(String item_idx) {
	this.item_idx = item_idx;
}


public String getBoard_idx() {
	return board_idx;
}
public void setBoard_idx(String board_idx) {
	this.board_idx = board_idx;
}
public File_boardVO() {
	// TODO Auto-generated constructor stub
}
public File_boardVO(int file_board_idx, String file1, String file2, String file3, int rf_board_idx,
		MultipartFile file_1, MultipartFile file_2, MultipartFile file_3, String item_idx) {
	super();
	this.file_board_idx = file_board_idx;
	this.file1 = file1;
	this.file2 = file2;
	this.file3 = file3;
	this.rf_board_idx = rf_board_idx;
	this.file_1 = file_1;
	this.file_2 = file_2;
	this.file_3 = file_3;
	this.item_idx = item_idx;
}
@Override
public String toString() {
	return "File_boardVO [file_board_idx=" + file_board_idx + ", file1=" + file1 + ", file2=" + file2 + ", file3="
			+ file3 + ", rf_board_idx=" + rf_board_idx + ", file_1=" + file_1 + ", file_2=" + file_2 + ", file_3="
			+ file_3 + ", item_idx=" + item_idx + "]";
}
 
 

 
}
