package com.itwillbs.Code_Green.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.WishListMapper;
import com.itwillbs.Code_Green.vo.WishListVO;

@Service
public class WishListService {

	@Autowired
	private WishListMapper mapper;

	//위시리스트 있는지 없는지
	public int checkWish(WishListVO wishList, int item_idx, String member_id) {
		return mapper.checkWish(wishList,item_idx,member_id);
	}
	
	//위시리스트 추가
	public int insertWish(WishListVO wishList, int item_idx, String member_id) {
		return mapper.insertWish(wishList,item_idx,member_id);
	}

	//위시리스트 삭제
	public int removeWish(WishListVO wishList, int item_idx, String member_id) {
		return mapper.removeWish(wishList,item_idx,member_id);
	}

	//위시리스트 갯수
	public int WishCount(int item_idx) {
		return mapper.WishCount(item_idx);
	}

	//추천 있는지 없는지
	public int checkBest(int board_idx, int item_idx, String member_id) {
		return mapper.checkBest(board_idx,item_idx,member_id);
	}

	//추천 추가
	public int insertBest(int board_idx, int item_idx, String member_id) {
		return mapper.insertBest(board_idx,item_idx,member_id);
	}

	//추천 삭제
	public int removeBest(int board_idx, int item_idx, String member_id) {
		return mapper.removeBest(board_idx,item_idx,member_id);
	}

	//추천 갯수
	public int BestCount(int board_idx) {
		return mapper.BestCount(board_idx);
	}



}
