package com.itwillbs.Code_Green.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.Code_Green.service.CartService;
import com.itwillbs.Code_Green.service.CoinService;
import com.itwillbs.Code_Green.service.ItemService;
import com.itwillbs.Code_Green.service.MemberService;
import com.itwillbs.Code_Green.service.SellService;
import com.itwillbs.Code_Green.vo.CartVO;
import com.itwillbs.Code_Green.vo.CoinVO;
import com.itwillbs.Code_Green.vo.MemberVO;
import com.itwillbs.Code_Green.vo.SellVO;

@Controller
public class SellController { 
	@Autowired
	private MemberService member_service;
	
	@Autowired
	private SellService sell_service;
	
	@Autowired
	private CartService cart_service;
	
	@Autowired
	private CoinService coin_service;
	
	@Autowired
	private ItemService item_service;
	
	// 주문하기
	@GetMapping(value = "/payment")
	public ModelAndView payment(@RequestParam String member_id, HttpSession session, 
							Model model, ModelAndView mav) {
		
		// 주문자 기본 정보 불러오기
		MemberVO memberInfo = member_service.getMemberInfo(member_id);
		model.addAttribute("memberInfo", memberInfo);
		
		// 장바구니 정보 불러오기
		List<CartVO> cartList = sell_service.getCart(member_id);
		model.addAttribute("cartList", cartList);
		
		Map<String, Object> map = new HashMap<String, Object>();

		String sumMoney = cart_service.sumMoney(cartList.get(0).getRf_member_idx());

		int sumM = (int) (Double.parseDouble(sumMoney));
		int fee = (sumM >= 50000 ? 0 : 2500); // 5만원 기준으로 배송비 측정

		model.addAttribute("cartList", cartList); // 장바구니 상품 저장
		map.put("cartList", cartList); // 장바구니 정보를 map에 저장
		map.put("count", cartList.size()); // 장바구니 상품의 유무
		map.put("sumM", sumM); // 장바구니 전체 금액
		map.put("fee", fee); // 배송비
		map.put("allSum", sumM + fee); // 주문 상품 전체 금액

		mav.addObject("map", map); // map 변수 저장
		mav.setViewName("payment/payment"); // 이동할 view 페이지의 이름 저장
		
		// 적립금 불러오기
		CoinVO coin = coin_service.getCoin(member_id);
		model.addAttribute("coin", coin);
		
		return mav;
	}
	
	

	// 주문완료
	@ResponseBody
	@PostMapping(value = "/payment_success")
	public void payment_success(HttpSession session,
								 @RequestParam(name = "member_idx", value = "member_idx", required = false, defaultValue = "1") int member_idx,
								 @RequestParam(name = "member_name", value = "member_name", required = false) String member_name,
								 @RequestParam(name = "member_phone", value = "member_phone", required = false) String member_phone,
								 @RequestParam(name = "member_address", value = "member_address", required = false) String member_address,
								 @RequestParam(name = "member_postcode", value = "member_postcode", required = false) String member_postcode,
								 @RequestParam(name = "item_total_price", value = "item_total_price", required = false, defaultValue = "1")  int item_total_price,
								 @RequestParam(name = "shipping_fee", value = "shipping_fee", required = false, defaultValue = "1")  int shipping_fee,
								 @RequestParam(name = "sell_usecoin", value = "sell_usecoin", required = false)  String sell_usecoin, Model model) {
		
		
		String member_id = (String) session.getAttribute("sId");
	
		// 적립금 사용 관련
		if(sell_usecoin == null) { // 주문시 적립금 사용 않을때
			// 전체 금액 계산
			int sell_total_price = item_total_price + shipping_fee - 0;
			// sell sell_usecoin에 "0" 데이터 넣기 위함
			sell_usecoin = "0";
			
			// 주문
			int insertCount = sell_service.insertOrder(member_id, member_idx, member_name, member_phone, member_address, member_postcode, sell_usecoin, sell_total_price);
			
			// 주문시 사용한 적립금
			int insertOrderUseCoinCount = coin_service.insert_order_useCoin(sell_usecoin, member_idx);
			
			// 주문시 결제 금액의 3% 적립
			int insertOrderCoinAddCount = coin_service.insert_order_addCoin(sell_total_price, member_idx);
		} else { // 주문시 적립금 사용 할때
			// 전체 금액 계산
			int sell_usecoin2 = Integer.parseInt(sell_usecoin);
			int sell_total_price = item_total_price + shipping_fee - sell_usecoin2;
			
			if(sell_total_price == 0) { // 적립금 사용하고 총 주문금액이 0이라면
				sell_total_price = 0;
				int insertCount = sell_service.insertOrder(member_id, member_idx, member_name, member_phone, member_address, member_postcode, sell_usecoin, sell_total_price);
			} else { // 적림금 사용하고 총 주문금액이 0 이상
				int insertCount = sell_service.insertOrder(member_id, member_idx, member_name, member_phone, member_address, member_postcode, sell_usecoin, sell_total_price);
			}
			
			// 주문시 사용한 적립금
			int insertOrderUseCoinCount = coin_service.insert_order_useCoin(sell_usecoin, member_idx);
			
			// 주문시 결제 금액의 3% 적립(적립금으로 다 사용할때는 3% 적립 안됨 - 주문금액 0이라서)
			int insertOrderCoinAddCount = coin_service.insert_order_addCoin(sell_total_price, member_idx);
		}
		
		// 장바구니 정보
		List<CartVO> cartList = cart_service.getCart(member_id); 
		
		// 주문 상세(sell_detail)에 데이터 넣기
		for(int i = 0; i < cartList.size(); i++) {
			int rf_item_idx = cartList.get(i).getRf_item_idx();
			int sell_amount = cartList.get(i).getCart_amount();
			
			int insertOrderDetailCount = sell_service.insertOrderDetail(rf_item_idx, sell_amount, member_idx);
		}
		
		// 주문 후 장바구니 비우기
		int deleteCartCount = cart_service.afterOrderDeleteCart(member_idx);
		session.setAttribute("cartCount", 0);//
		
//		return "redirect:/payment_success_cardPayForm?member_id=" + member_id;
	}	
	
	// 주문완료 및 카드 결제 폼
	@GetMapping(value = "/payment_success_cardPayForm") 
	public String payment_success_cardPayForm(Model model, HttpSession session) {
		
		String member_id = (String) session.getAttribute("sId");
		
		// 주문내역 불러오기
		SellVO orderList = sell_service.getOrderList(member_id);
		
		// 주문 상세내역 불러오기
		List<SellVO> orderDetailList = sell_service.getOrderDetailList(orderList.getSell_idx());
		
		// 전체 상품 가격
		int item_price = 0;
		int item_amount = 0;
		int item_total_price = 0;
		
		for(int i = 0; i < orderDetailList.size(); i++) {
			item_price = Integer.parseInt(orderDetailList.get(i).getItem_price());
			item_amount = Integer.parseInt(orderDetailList.get(i).getSell_amount());
			item_total_price += item_price * item_amount;
		}
		
		// 배송비
		int shipping_fee = (item_total_price >= 50000 ? 0 : 2500);
		
		model.addAttribute("orderList", orderList);
		
		model.addAttribute("orderDetailList" , orderDetailList);
		
		model.addAttribute("item_total_price" , item_total_price);
		
		model.addAttribute("shipping_fee", shipping_fee);
		
		return "payment/payment_success";
	}
	
	
	// 결제완료(카드)
	@PostMapping(value = "/payment_success_card")
	public void payment_success_card(@RequestParam int sell_idx) {
		
		// 카드 결제 완료시 카드 결제일, 주문 상태 등 변경
		int cardOrderModifyCount = sell_service.modifyCardOrder(sell_idx);
		
		// 주문시 재고 차감
		if(cardOrderModifyCount > 0) {
			List<SellVO> orderDetailList = sell_service.getOrderDetailList(sell_idx);
			
			for(int i = 0; i < orderDetailList.size(); i++) {
				String item_idx1 = orderDetailList.get(i).getItem_idx();

				String sell_amount1 = orderDetailList.get(i).getSell_amount();
				
				int item_idx2 = Integer.parseInt(item_idx1);

				int sell_amount2 = Integer.parseInt(sell_amount1);
				
			int modifyItemNumberCount = item_service.modifyItemNumber(item_idx2, sell_amount2);
			
			}
			
		}
		
	}
	
	// 결제완료(카드) 페이지
	@GetMapping(value = "/payment_success_card_thanks")
	public String payment_success_card_thanks(Model model) {
		
		return "payment/payment_success_card";
	}
	
	// 주문 취소 요청
	@PostMapping(value = "/payment_cancel")
	public void payment_cancel(@RequestParam int sell_idx) {
		
		// 주문 취소 요청
		int cancelOrderCount = sell_service.modifyCancelOrder(sell_idx);
		
	}
}