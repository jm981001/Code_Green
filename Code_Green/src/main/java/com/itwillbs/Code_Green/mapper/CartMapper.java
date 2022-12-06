package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.CartVO;

public interface CartMapper {

	// 1. 장바구니 추가
	public int insertCart(CartVO cart);
	// 2. 장바구니 목록
	public List<CartVO> selectCart(String member_id);
	// 3. 장바구니 삭제
	public int deleteCart(int cart_idx);
	// 4. 장바구니 수정
	public int modifyCart(@Param("cart_amount")int cart_amount,@Param("cart_idx")int cart_idx);
	// 5. 장바구니 금액 합계
	public String sumMoney(int member_idx);
	// 6. 장바구니 상품수량 변경
	public int updateCart(CartVO vo);
	// 6. 장바구니 수
	public int cartCount(@Param("member_idx")int member_idx);
	public int sameItem(@Param("member_idx")int member_idx);
	
	public int getCartCount(@Param("member_idx")int member_idx);
	// 주문 후 장바구니 내 상품 삭제
	public int afterOrderDeleteCart(int member_idx);

	
	
	
}
