package com.itwillbs.Code_Green.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.SellMapper;
import com.itwillbs.Code_Green.vo.CartVO;
import com.itwillbs.Code_Green.vo.SellVO;

@Service
public class SellService {
	
	@Autowired
	private SellMapper sell_mapper;

	// 장바구니 목록 불러오기
	public List<CartVO> getCart(String member_id) {
		return sell_mapper.selectCart(member_id);
	}
	
	// 주문(sell)에 데이터 넣기
	public int insertOrder(String member_id, int member_idx, 
						   String member_name, String member_phone, String member_address, 
						   String member_postcode, String sell_usecoin, int sell_total_price) {
		return sell_mapper.insertOrder(member_id, member_idx, member_name, member_phone, member_address, member_postcode, sell_usecoin, sell_total_price);
	}
	
	// 주문(sell_detail) 상세에 데이터 넣기
	public int insertOrderDetail(int rf_item_idx, int sell_amount, int member_idx) {
		return sell_mapper.insertOrderDetail(rf_item_idx, sell_amount, member_idx);
	}
	
	// 주문내역 불러오기
	public SellVO getOrderList(String member_id) {
		return sell_mapper.selectOrderList(member_id);
	}

	// 주문 상세내역 불러오기
	public List<SellVO> getOrderDetailList(int sell_idx) {
		return sell_mapper.selectOrderDetailList(sell_idx);
	}
	
	// 결제 완료(카드)
	public int modifyCardOrder(int sell_idx) {
		return sell_mapper.updateCardOrder(sell_idx);
	}
	
	
	
//========================================== 마이페이지 ==================================================================		

	// 상품구매 목록
	public List<SellVO> getReviewList(int startRow, int listLimit, String member_id) {
		return sell_mapper.getReviewList(startRow, listLimit, member_id);
	}

	// 상품구매 목록 갯수
	public int getSellListCount() {
		return sell_mapper.selectSellListCount();
	}
	
	// 마이페이지 리뷰 가능상품 목록
	public List<SellVO> getSellDetailList(int startRow, int listLimit, String member_id) {
		return sell_mapper.getSellDetailList(startRow,listLimit ,member_id);
	}

	// 마이페이지 상품후기작성
	public List<SellVO> getSellReview(String member_id, int sell_idx, int item_idx) {
		return sell_mapper.getSellReview(member_id, sell_idx,item_idx);
	}

	
	// 마이페이지 - 내 주문목록 리스트들 불러오기
	public List<SellVO> getMyBuyList(int startRow, int listLimit, int member_idx, String period) {
		return sell_mapper.selectMyBuyList(startRow, listLimit, member_idx, period);
	}

	// 마이페이지 - 내 주문목록 리스트들 카운트
	public int getMyBuyListCount(int member_idx, String period) {
		return sell_mapper.selectMyBuyListCount(member_idx,period);
	}
	
	// 마이페이지 - 내 주문목록 리스트들 특정날짜범위로 불러오기
	public List<SellVO> getMyBuyListByDate(int startRow, int listLimit, int member_idx, String date1, String date2) {
		return sell_mapper.getMyBuyListByDate(startRow, listLimit, member_idx, date1, date2);
	}

	// 마이페이지 - 내 주문목록 리스트들 특정날짜범위로 불러온거 카운트
	public int getMyBuyListByDateCount(int member_idx, String date1, String date2) {
		return sell_mapper.getMyBuyListByDateCount(member_idx,date1,date2);
	}

	// 마이페이지 - 내주문목록 주문별 상세내용 
	public SellVO getMyBuyListDetail(int member_idx, String sell_order_number) {
		return sell_mapper.getMyBuyListDetail(member_idx,sell_order_number);
	}
	
	// 마이페이지 - 내주문목록 아이템리스트 출력
	public List<SellVO> getMyBuyItemList(String sell_order_number) {
		return sell_mapper.getMyBuyItemList(sell_order_number);
	}

	// 마이페이지 - 주문 취소 요청
	public int modifyCancelOrder(int sell_idx) {
		return sell_mapper.updateCancelOrder(sell_idx);
	}
	
	// 마이페이지 - 주문상세목록위한 리스트불러오기
	public SellVO getMyOrderDetailList(String sell_order_number) {
		return sell_mapper.getMyOrderDetailList(sell_order_number);
	}



		
	
	
}
