package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.CoinVO;

public interface CoinMapper {

	//----------------------마이페이지--------------------------
	
	//적립금 목록
	public List<CoinVO> selectCoinList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("member_id")String member_id);

	//적립금 목록 갯수
	public int selectCoinListCount(String member_id);

	//적립금 총금액
	public List<CoinVO> selectTotalCoin(String member_id);
	
	//-----------------------주문--------------------------
	
	// 적립금 불러오기
	CoinVO selectCoin(String member_id);

	// 주문시 적립금 사용
	public int insert_order_useCoin(@Param("sell_usecoin")String sell_usecoin, @Param("member_idx")int member_idx);

	// 주문시 결제금액 3% 적립금 적립
	public int insert_order_addCoin(@Param("sell_total_price")int sell_total_price, @Param("member_idx")int member_idx);


}
