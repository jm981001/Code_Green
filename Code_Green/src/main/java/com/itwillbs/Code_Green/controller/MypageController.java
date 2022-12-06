package com.itwillbs.Code_Green.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.Code_Green.service.CoinService;
import com.itwillbs.Code_Green.service.ItemService;
import com.itwillbs.Code_Green.service.MemberService;
import com.itwillbs.Code_Green.service.QnaService;
import com.itwillbs.Code_Green.service.ReviewService;
import com.itwillbs.Code_Green.service.SellService;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.CoinVO;
import com.itwillbs.Code_Green.vo.FollowVO;
import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.MemberVO;
import com.itwillbs.Code_Green.vo.PageInfo;
import com.itwillbs.Code_Green.vo.QnaVO;
import com.itwillbs.Code_Green.vo.ReportVO;
import com.itwillbs.Code_Green.vo.SellVO;

@Controller
public class MypageController {

	@Autowired
	private MemberService Mservice;
	@Autowired
	private ReviewService Rservice;
	@Autowired
	private QnaService Qservice;
	@Autowired
	private ItemService Iservice;
	@Autowired
	private CoinService Cservice;
	@Autowired
	private SellService Sservice;
	
	//====================================== 마이페이지 메인 ========================================== 
		@GetMapping(value = "/MemberInfo.me")
		public String getMemberInfo(Model model, HttpSession session) {
			// 세션 아이디 가져와서 sId 변수에 저장
			String sId = (String)session.getAttribute("sId");
			int sIdx = (int) session.getAttribute("sIdx");
			
			if(sId == null || sId.equals("") || session.getAttribute("sCode")!=null) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "member/fail_back";
			} else {
				MemberVO member = Mservice.getMemberInfo(sId); // 파라미터는 검색할 아이디 전달
				model.addAttribute("member", member);
				
				// 마이페이지 - 내정보 카운트 테이블
				MemberVO myCountInfo = Mservice.getMyCountInfo(sIdx);
				model.addAttribute("myCountInfo", myCountInfo);
				
				// 마이페이지 - 최근주문목록(1개월내)
				List<SellVO> recentOrderList = Mservice.getMyRecentOrderList(sIdx,1);
				model.addAttribute("recentOrderList", recentOrderList);
				
				return "member/myPage_main";
			}
		}
	
		
		
	//------------마이페이지 찜한상품-------------------------------------------
	@GetMapping(value = "/myPageWishList.my")
	public String myPage_heart(@RequestParam(defaultValue = "1") int pageNum,
			Model model, @RequestParam(defaultValue = "null") String member_id,
			@ModelAttribute ItemVO item, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		if(member_id == null || sId == null || member_id.equals("") || (!member_id.equals(sId) && !sId.equals("admin"))) {
			return "redirect:/login";
		}
			MemberVO member = Mservice.getMemberInfo(member_id); // 파라미터는 검색할 아이디 전달
			model.addAttribute("member", member);
			
			
			int listLimit = 7; // 한 페이지 당 표시할 게시물 목록 갯수 
			int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
			int startRow = (pageNum - 1) * listLimit;
			
			//마이페이지 찜한 상품 리스트
			List<ItemVO> WishList = Iservice.wishList(startRow, listLimit, member_id );
			
			//마이페이지 찜한 상품 리스트 갯수
			int listCount = Iservice.getWishListCount(member_id);
			session.setAttribute("listCount", listCount);
			
			int maxPage = (int)Math.ceil((double)listCount / listLimit);
			// 시작 페이지 번호 계산
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
			// 끝 페이지 번호 계산
			int endPage = startPage + pageListLimit - 1;
			// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우 
			// 끝 페이지 번호를 최대 페이지 번호로 교체
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			PageInfo pageInfo = new PageInfo(
					pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
			
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("WishList", WishList);
			model.addAttribute("listCount", listCount);
			model.addAttribute("member_id", member_id);
			
			
			return "member/myPage_wishList";
		
	}
	
	
	
	//------------마이페이지 찜한상품 삭제-------------------------------------------
	@GetMapping(value = "/deleteWish")
	public String deleteWish(@RequestParam(defaultValue = "1") int pageNum,
			Model model, @RequestParam String member_id,@RequestParam int member_idx,@RequestParam int heart_idx,
			@ModelAttribute ItemVO item, HttpSession session) {
	
		model.addAttribute("member_id", member_id);
		model.addAttribute("member_idx", member_idx);
		model.addAttribute("heart_idx", heart_idx);
		System.out.println(member_id);
		
		String sId = (String)session.getAttribute("sId");
		if(member_id == null || sId == null || member_id.equals("") || (!member_id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "member/fail_back";
		}
		
			int deleteCount = Iservice.removeWish(member_idx,heart_idx);
			
			if(deleteCount == 0) {
				model.addAttribute("msg", "위시리스트 삭제 실패");
				return "member/fail_back";
			}

			return "redirect:/myPageWishList.my";

	}
	
	
	
	//====================================== 마이페이지 팔로우브랜드 목록 ========================================== 
	
	@GetMapping(value = "/myPageFollowingList.my")
	public String myFollowingList(@RequestParam(defaultValue = "1") int pageNum, HttpSession session, Model model) {
		
		String member_id = (String)session.getAttribute("sId");
		int member_idx = (int)session.getAttribute("sIdx");
		
		int listLimit = 8; 
		int pageListLimit = 8; 
		
		int startRow = (pageNum - 1) * listLimit;
		
		//팔로우브랜드 목록
		List<FollowVO> followList = Mservice.getFollowList(startRow, listLimit, member_id);
		
		//팔로우브랜드 목록 갯수
		int listCount = Mservice.getFollowListCount(member_idx);
		
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		model.addAttribute("followList", followList);
		model.addAttribute("pageInfo", pageInfo);
		
		
		
		return "member/myPage_following";
	}
	
	
	//====================================== 마이페이지 팔로우브랜드 언팔로우 ==========================================
	@ResponseBody
	@PostMapping(value = "/UnfollowBrand.my",produces = "application/text; charset=utf8")
	public String unFollowBrand(@RequestParam int rf_member_idx, @RequestParam int rf_manager_idx) {
		
		int unFollowResult = Mservice.deleteFollow(rf_member_idx,rf_manager_idx);
		
		String msg = "";
		if(unFollowResult > 0) {
			msg += "해당브랜드를 언팔로우했습니다!";
		}
		
		return msg;
	}
	
	
	
	
	
	
	//------------마이페이지 적립금-------------------------------------------
	@GetMapping(value = "/myPageEmoney.my")
	public String myPageEmoney(
			@RequestParam(defaultValue = "1") int pageNum, Model model, HttpSession session ,@RequestParam String member_id) {
		String sId = (String)session.getAttribute("sId");
		if(member_id == null || sId == null || member_id.equals("") || (!member_id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "member/fail_back";
		}
		int listLimit = 10; 
		int pageListLimit = 10; 
		
		int startRow = (pageNum - 1) * listLimit;
		
		//적립금 목록
		List<CoinVO> coinList = Cservice.getCoinList(startRow, listLimit,member_id);
		
		//적립금 목록 갯수
		int listCount = Cservice.getCoinListCount(member_id);
		
		//적립금 총금액
		List<CoinVO> TotalCoin = Cservice.getTotalCoin(member_id);
		
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		
		model.addAttribute("coinList", coinList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("TotalCoin", TotalCoin);
		model.addAttribute("member_id", member_id);
		
		return "member/myPage_emoney";
	}
	
	
	
	
	//====================================== 마이페이지 주문목록 ========================================== 
	@GetMapping(value = "/myBuyList.my")
	public String myBuyList(@RequestParam(defaultValue = "1") int pageNum, 
							@RequestParam(defaultValue = "") String period, Model model, HttpSession session) {
		
		int member_idx = (int)session.getAttribute("sIdx");
		int listLimit = 8; 
		int pageListLimit = 8; 
		int startRow = (pageNum - 1) * listLimit;
		
		// 주문목록전체
		List<SellVO> buyList = Sservice.getMyBuyList(startRow, listLimit, member_idx, period);
		// 주문목록갯수 카운트
		int listCount = Sservice.getMyBuyListCount(member_idx,period);
		
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("buyList", buyList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("period", period);
		
		return "member/myPage_buyList";
	}
	
	//====================================== 마이페이지 주문목록 - 개월수로 검색 ========================================== 
	@GetMapping(value = "/myBuyListbyMonth.my")
	public String myBuyListByMonth(@RequestParam(defaultValue = "1") int pageNum, 
			@RequestParam(defaultValue = "") String period, Model model, HttpSession session) {
		
		int member_idx = (int)session.getAttribute("sIdx");
		int listLimit = 8; 
		int pageListLimit = 8; 
		int startRow = (pageNum - 1) * listLimit;
		
		// 주문목록전체
		List<SellVO> buyList = Sservice.getMyBuyList(startRow, listLimit, member_idx, period);
		// 주문목록갯수 카운트
		int listCount = Sservice.getMyBuyListCount(member_idx,period);
		
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("buyList", buyList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("period", period);
		
		return "member/myPage_buyListDate";
	}
	
	//====================================== 마이페이지 주문목록 - 특정날짜범위 ========================================== 
	@GetMapping(value = "/myBuyListbySelect.my")
	public String myBuyListbySelect(@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "")String date1,@RequestParam(defaultValue = "") String date2, Model model, HttpSession session) {
		
		int member_idx = (int)session.getAttribute("sIdx");
		int listLimit = 8; 
		int pageListLimit = 8; 
		int startRow = (pageNum - 1) * listLimit;
		
		// 주문목록전체
		List<SellVO> buyList = Sservice.getMyBuyListByDate(startRow, listLimit, member_idx, date1, date2);
		// 주문목록갯수 카운트
		int listCount = Sservice.getMyBuyListByDateCount(member_idx,date1, date2);
		
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("buyList", buyList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("date1", date1);
		model.addAttribute("date2", date2);
		
		return "member/myPage_buyListSelect";
	}
	
	//====================================== 마이페이지 주문상세내역 ========================================== 
	@GetMapping(value = "/myBuyListDetail.my") 
	public String payment_success_cardPayForm(String sell_order_number, Model model, HttpSession session) {
		
		// 주문내역 불러오기
		SellVO orderList = Sservice.getMyOrderDetailList(sell_order_number);
		
		// 주문 상세내역 불러오기
		List<SellVO> orderDetailList = Sservice.getOrderDetailList(orderList.getSell_idx());
		
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
		
		return "member/myPage_buyListDetail";
	}
	
	
	
	
	//------------마이페이지 리뷰 가능상품-------------------------------------------
			@GetMapping(value = "/myPageReview.my")
			public String myPage_review_detail( @RequestParam(defaultValue = "1") int pageNum, Model model
					                           ,@RequestParam String member_id,HttpSession session) {
				
			String sId = (String)session.getAttribute("sId");
			if(member_id == null || sId == null || member_id.equals("") || (!member_id.equals(sId) && !sId.equals("admin"))) {
				model.addAttribute("msg", "잘못된 접근입니다");
				return "member/fail_back";
			}
			
			int listLimit = 7; // 한 페이지 당 표시할 게시물 목록 갯수 
			int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
			int startRow = (pageNum - 1) * listLimit;
			
//			//마이페이지 찜한 상품 리스트
//			List<ItemVO> WishList = Iservice.wishList(startRow, listLimit, member_id );
			
			//작성 가능 후기 갯수
			int listCount = Iservice.getReviewListCount(member_id);
//			System.out.println(listCount + "   listCount");
//			session.setAttribute("listCount", listCount);
			
			int maxPage = (int)Math.ceil((double)listCount / listLimit);
			// 시작 페이지 번호 계산
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
			// 끝 페이지 번호 계산
			int endPage = startPage + pageListLimit - 1;
			System.out.println(maxPage + "maxPage");
			System.out.println(endPage + "endPage");
			// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우 
			// 끝 페이지 번호를 최대 페이지 번호로 교체
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			PageInfo pageInfo = new PageInfo(
					pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
			
			
			//리뷰 가능상품 목록
			List<SellVO> sellDetailList = Sservice.getSellDetailList(startRow, listLimit,member_id);	
				
			model.addAttribute("pageInfo", pageInfo);	
			model.addAttribute("listCount", listCount);	
			model.addAttribute("member_id", member_id);
			model.addAttribute("sellDetailList", sellDetailList);
			return "member/myPage_review_detail";
		}
		
		//------------마이페이지 상품후기 작성-------------------------------------------
		@RequestMapping(value = "myPage_review_Write.my", method = RequestMethod.GET)
		public String myPage_review_Write(Model model ,@RequestParam String member_id,@RequestParam int sell_idx,@RequestParam int item_idx, HttpSession session,@ModelAttribute CoinVO coin) {
			String sId = (String)session.getAttribute("sId");
			if(member_id == null || sId == null || member_id.equals("") || (!member_id.equals(sId) && !sId.equals("admin"))) {
				model.addAttribute("msg", "잘못된 접근입니다");
				return "member/fail_back";
			}
			//마이페이지 상품후기작성
			List<SellVO> sellReview = Sservice.getSellReview(member_id, sell_idx, item_idx);
				
			
			
			model.addAttribute("member_id", member_id);
			model.addAttribute("sell_idx", sell_idx);
			model.addAttribute("item_idx", item_idx);
			model.addAttribute("sellReview", sellReview);
			return "member/myPage_review_Write";
		}
	
	//====================================== 마이페이지 1:1 문의내역 ========================================== 
	@GetMapping(value = "/myPageQnaList.my")
	public String myPageQnaMtmList(@RequestParam(defaultValue = "1") int pageNum,@RequestParam(defaultValue = "") String qna_status, Model model,HttpSession session) {
		
		String qna_id = (String)session.getAttribute("sId");
		
		int listLimit = 8; 
		int pageListLimit = 8; 
		
		int startRow = (pageNum - 1) * listLimit;
		
		// 1:1 문의내역 목록
		List<QnaVO> mantomanList = Qservice.getMantomanList(startRow, listLimit, qna_id, qna_status);
		
		// 1:1 문의내역 목록 갯수
		int listCount = Qservice.getMantomanListCount(qna_id, qna_status);
		
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		model.addAttribute("mantomanList", mantomanList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("qna_status", qna_status);
		
		
		return "member/myPage_qnaList";
			
		
		
	}
	
	//====================================== 마이페이지 1:1 문의내역 분류버튼 ========================================== 
	@GetMapping(value = "/myPageQnaSelectList.bo")
	public String myPageQnaMtmSelectList(@RequestParam(defaultValue = "1") int pageNum,
										@RequestParam(defaultValue = "") String qna_status, 
										Model model,HttpSession session) {
		
		String qna_id = (String)session.getAttribute("sId");
		
		int listLimit = 8; 
		int pageListLimit = 8; 
		int startRow = (pageNum - 1) * listLimit;
		
		// 1:1 문의내역 목록
		List<QnaVO> mantomanList = Qservice.getMantomanList(startRow, listLimit, qna_id, qna_status);
		
		// 1:1 문의내역 목록 갯수
		int listCount = Qservice.getMantomanListCount(qna_id, qna_status);
		
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		model.addAttribute("mantomanList", mantomanList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("qna_status", qna_status);
		
		
		return "member/myPage_qnaSelectList";
		
		
	}
	
	
	//====================================== 마이페이지 1:1 문의글 개별내용확인 ========================================== 
	@GetMapping(value = "/QnaMtmDetail.bo")
	public String myPageQnaMtmDetail(@RequestParam int qna_idx,Model model,HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		QnaVO mtmDetail = Qservice.getMantomanDetail(qna_idx);
		
		if(!sId.equals(mtmDetail.getQna_id())){
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "member/fail_back3";
		}else {
			model.addAttribute("mtmDetail", mtmDetail);
			return "member/myPage_qnaDetail";
		}
	}

	//====================================== 마이페이지 1:1 문의내역 삭제  ========================================== 
	@GetMapping(value = "/DeleteMtmQna.bo")
	public String myPageQnaMtmDelete(@RequestParam int qna_idx,Model model) {
		int DeleteResult = Qservice.deleteMantoman(qna_idx);
		if(DeleteResult == 0) {
			model.addAttribute("msg", "글삭제에 실패했습니다.\n다시한번 시도해주세요");
			return "member/fail_back";
		} else {
			return "redirect:/myPageQnaList.my";
		}
	}
	
	
	
	
	
	//------------마이페이지 작성글-------------------------------------------
	@GetMapping(value = "/myPageBoard.my")
	public String myPageBoard(@RequestParam(defaultValue = "1") int pageNum, Model model, @RequestParam String member_id,@ModelAttribute BoardVO board, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		System.out.println(member_id + ", " + sId);
		if(member_id == null || sId == null || member_id.equals("") || (!member_id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "member/fail_back";
		} 
			MemberVO member = Mservice.getMemberInfo(member_id); // 파라미터는 검색할 아이디 전달
			// Model 객체에 "member" 속성명으로 MemberVO 객체 저장
			System.out.println(member);
			model.addAttribute("member", member);
			
			int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수 
			int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
			
			// 조회 시작 게시물 번호(행 번호) 계산
			int startRow = (pageNum - 1) * listLimit;
			
			// Service 객체의 getBoardList() 메서드를 호출하여 게시물 목록 조회
			// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
			// => 리턴타입 : List<BoardVO>(boardList)
			List<BoardVO> BoardList = Rservice.boardList(startRow, listLimit, member_id );
			// -------------------------------------------
			// Service 객체의 getBoardListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
			// => 파라미터 : 없음, 리턴타입 : int(listCount)
			int listCount = Rservice.getBoardListCount(member_id);

			int maxPage = (int)Math.ceil((double)listCount / listLimit);
			// 시작 페이지 번호 계산
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
			// 끝 페이지 번호 계산
			int endPage = startPage + pageListLimit - 1;
			// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우 
			// 끝 페이지 번호를 최대 페이지 번호로 교체
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			PageInfo pageInfo = new PageInfo(
					pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
			
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("BoardList", BoardList);
			model.addAttribute("member_id", member_id);
			model.addAttribute("listCount", listCount);
			
			// member/member_info.jsp 페이지로 이동
			return "member/myPage_board";
		}
		
	
	//====================================== 마이페이지 신고목록  ========================================== 
	@GetMapping(value = "/myPageReportList.my")
	public String myPageReportList(@RequestParam(defaultValue = "1") int pageNum, Model model, HttpSession session) {
		String member_id = (String) session.getAttribute("sId");
		if(member_id==null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "member/fail_back";
		}
		
		int listLimit = 10; 
		int pageListLimit = 10; 
		int startRow = (pageNum - 1) * listLimit;
		
		// 신고내역 목록 
		List<ReportVO> reportList = Mservice.getReportList(startRow, listLimit, member_id);
		
		// 신고내역 목록 갯수
		int reportListCount = Mservice.getReportListCount(member_id);
		
		int maxPage = (int)Math.ceil((double)reportListCount / listLimit);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, reportListCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("reportList", reportList);
		
		
		return "member/myPage_reportList";
	}
	
	//------------마이페이지 개인정보 수정페이지-------------------------------------------
	@GetMapping(value = "myPage_userInfo")
	public String myPage_userInfo(@ModelAttribute MemberVO member, Model model, HttpSession session) {
		String sId = (String) session.getAttribute("sId");
		// 멤버 정보 불러오기
		MemberVO memberInfo = Mservice.getMemberInfo(sId);
		model.addAttribute("member", memberInfo);
		
		return "member/myPage_userInfo";
		
	}

	// ------------마이페이지 개인정보 수정-------------------------------------------
	@PostMapping(value = "myPage_userInfo_Update")
	public String myPage_userInfo_Update(@ModelAttribute MemberVO member, Model model, HttpSession session) {
		String sId = (String) session.getAttribute("sId");
		int idx = (int) session.getAttribute("sIdx");

		System.out.println("member" + member);
		MemberVO memberInfo = Mservice.getMemberInfo(sId);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		// BCryptPasswordEncoder 객체의 encode() 메서드를 호출하여 해싱 결과 리턴
		String securePasswd = encoder.encode(member.getMember_pass());
		// MemberVO 객체의 패스워드에 암호문 저장
		member.setMember_pass(securePasswd);

		int updateCount = Mservice.modifyMemberInfo(member);
		if (updateCount > 0) {
			model.addAttribute("member", memberInfo);
			return "redirect:/myPage_userInfo";
		} else {
//		
			model.addAttribute("msg", "수정 실패");
			return "member/fail_back";
		}
	}
	
	
	
	
	//------------마이페이지 룰렛,,,?-------------------------------------------
	@RequestMapping(value = "roulette", method = RequestMethod.GET)
	public String roulette() {
		return "inc/roulette";
	}
	
	
	
	
	
	
}
