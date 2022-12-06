package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.CartMapper;
import com.itwillbs.Code_Green.vo.CartVO;

@Service
public class CartService {

	@Autowired
	private CartMapper mapper;
	
	//  장바구니 추가
	public int insertCart(CartVO cart) {
		return mapper.insertCart(cart);
	}
	//  장바구니 목록
	public List<CartVO> getCart(String member_id) {
		return mapper.selectCart(member_id);
	}
	//  장바구니 삭제
	public int deleteCart(int cart_idx) {
		return mapper.deleteCart(cart_idx);
	}
	//  장바구니 수정
	public int modifyCart(int cart_amount,int cart_idx) {
		return mapper.modifyCart(cart_amount,cart_idx);
	}
	//  장바구니 금액 합계
	public String sumMoney(int member_idx) {
		return mapper.sumMoney(member_idx);
	}
	//  장바구니 상품수량 변경
	public int updateCart(CartVO cart) {
		return mapper.updateCart(cart);
	}
	//	장바구니 수
	public int cartCount(int member_idx) {
		return mapper.cartCount(member_idx);
	}
	// 상품 중복체크
	public int sameItem(int member_idx) {
		return mapper.sameItem(member_idx);
	}
	public int getCartCount(int member_idx) {
		return mapper.getCartCount(member_idx);
	}
	// 주문 후 장바구니 내 상품 삭제
	public int afterOrderDeleteCart(int member_idx) {
		return mapper.afterOrderDeleteCart(member_idx);
	}

	
	
}
