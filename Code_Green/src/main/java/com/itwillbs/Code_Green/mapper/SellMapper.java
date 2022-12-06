package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.CartVO;
import com.itwillbs.Code_Green.vo.SellVO;

public interface SellMapper {

	// 장바구니 목록 불러오기
	List<CartVO> selectCart(String member_id);

	// 주문하기
	int insertOrder(@Param("member_id")String member_id, @Param("member_idx")int member_idx, 
					@Param("member_name")String member_name, @Param("member_phone")String member_phone, 
				    @Param("member_address")String member_address, @Param("member_postcode")String member_postcode, 
				    @Param("sell_usecoin")String sell_usecoin, @Param("sell_total_price")int sell_total_price);

	// 주문(sell_detail) 상세에 데이터 넣기
	int insertOrderDetail(@Param("rf_item_idx")int rf_item_idx, @Param("sell_amount")int sell_amount, @Param("member_idx")int member_idx);
	
	// 주문내역 불러오기
	SellVO selectOrderList(@Param("member_id")String member_id);
	
	// 주문 상세내역 불러오기
	List<SellVO> selectOrderDetailList(int sell_idx);
	
	// 결제 완료(카드)
	int updateCardOrder(int sell_idx);
	
	
// =================================== 마이페이지 ==================================================
	
	// 상품구매 목록
	List<SellVO> getReviewList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("member_id")String member_id);

	// 상품구매 목록 갯수
	int selectSellListCount();
	
	// 마이페이지 리뷰 가능상품 목록
	List<SellVO> getSellDetailList(@Param("member_id")String member_id);

	// 마이페이지 상품후기작성
	List<SellVO> getSellReview(@Param("member_id")String member_id, @Param("sell_idx")int sell_idx, @Param("item_idx")int item_idx);
	
	// 마이페이지 - 내 주문목록 리스트들 불러오기
	List<SellVO> selectMyBuyList(@Param("startRow") int startRow, @Param("listLimit") int listLimit,@Param("member_idx") int member_idx,@Param("period") String period);

	// 마이페이지 - 내 주문목록 리스트들 카운트
	int selectMyBuyListCount(@Param("member_idx") int member_idx,@Param("period") String period);

	// 마이페이지 - 내 주문목록 리스트들 특정날짜범위로 불러오기
	List<SellVO> getMyBuyListByDate(@Param("startRow") int startRow, @Param("listLimit") int listLimit,@Param("member_idx") int member_idx,@Param("date1") String date1,@Param("date2") String date2);

	// 마이페이지 - 내 주문목록 리스트들 특정날짜범위로 불러온거 카운트
	int getMyBuyListByDateCount(@Param("member_idx") int member_idx,@Param("date1") String date1,@Param("date2") String date2);

	// 마이페이지 - 내주문목록 주문별 상세내용 
	SellVO getMyBuyListDetail(@Param("member_idx") int member_idx,@Param("sell_order_number") String sell_order_number);

	// 마이페이지 - 내주문목록 아이템리스트 출력
	List<SellVO> getMyBuyItemList(String sell_order_number);

	// 마이페이지 리뷰 가능상품 목록
	List<SellVO> getSellDetailList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("member_id")String member_id);

	// 주문 취소 요청
	int updateCancelOrder(int sell_idx);

	// 마이페이지 - 주문상세목록위한 리스트불러오기
	SellVO getMyOrderDetailList(String sell_order_number);

		
	
}
