package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.CoinMapper;
import com.itwillbs.Code_Green.vo.CoinVO;

@Service
public class CoinService {
	@Autowired
	private CoinMapper mapper;
	
	//----------------------마이페이지--------------------------
	
	// 적립금 목록
	public List<CoinVO> getCoinList(int startRow, int listLimit, String member_id) {
		return mapper.selectCoinList(startRow, listLimit, member_id);
	}
	
	// 적립금 목록 갯수
	public int getCoinListCount(String member_id) {
		return mapper.selectCoinListCount(member_id);
	}
	
	//적립금 총금액
	public List<CoinVO> getTotalCoin(String member_id) {
		return mapper.selectTotalCoin(member_id);
	}
	
	//-----------------------주문--------------------------
	
	// 적립금 목록 불러오기
	public CoinVO getCoin(String member_id) {
		return mapper.selectCoin(member_id);
	}

	// 주문시 적립금 사용
	public int insert_order_useCoin(String sell_usecoin, int member_idx) {
		return mapper.insert_order_useCoin(sell_usecoin, member_idx);
	}

	// 주문시 결제금액 3% 적립금 적립
	public int insert_order_addCoin(int sell_total_price, int member_idx) {
		return mapper.insert_order_addCoin(sell_total_price, member_idx);
	}
	

}
