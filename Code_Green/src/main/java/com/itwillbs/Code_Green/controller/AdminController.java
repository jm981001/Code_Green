package com.itwillbs.Code_Green.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.Code_Green.service.AdminService;
import com.itwillbs.Code_Green.service.ItemService;
import com.itwillbs.Code_Green.service.SellService;
import com.itwillbs.Code_Green.vo.AdminVO;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.MemberVO;
import com.itwillbs.Code_Green.vo.PageInfo;
import com.itwillbs.Code_Green.vo.QnaVO;
import com.itwillbs.Code_Green.vo.ReportVO;
import com.itwillbs.Code_Green.vo.SellVO;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	@Autowired
	private SellService sell_service;
	
	@Autowired
	private ItemService item_service;

	//관리자 로그인
	@PostMapping(value = "/AdminLoginPro.me")
	public String adminloginPro(@ModelAttribute AdminVO admin, Model model, HttpSession session) {
		AdminVO adminResult = service.loginAdmin(admin);
		
		
		if (adminResult == null) {
			model.addAttribute("msg", "관리자 로그인 실패! 힝~");
//			System.out.println(admin.getAdmin_id() + ", " + admin.getAdmin_pass());
			return "member/fail_back";
		} else {
			session.setAttribute("sId", adminResult.getAdmin_id());
			return "redirect:/";
		}

	}
	
	//------------메인페이지----------------------------
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main() {
		return "main/main";
	}
	

	//------------전체관리자 메인----------------------------
	@RequestMapping(value = "AdminMain.me", method = RequestMethod.GET)
	public String index(Model model,HttpSession session) { 

		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin") || sId == "") {
			model.addAttribute("msg", " 잘못된 접근입니다!");
			return "admin/ad_fail_back";
		} 
		
		List<ManagerVO> topSale = service.getTopSale(); 		//매출 3순위
			   SellVO sellTotal = service.getTotalMoney(); 		//총매출
				 int sell_count = service.getTotalsellCount();  //총주문수
				 int cancelSell = service.getCancelCount();		//주문취소건수
		
		session.setAttribute("total", sellTotal.getNet());		//총매출(메뉴바)
		
		model.addAttribute("topSale", topSale);			//총주문수
		model.addAttribute("sellTotal", sellTotal);		//매출 3순위
		model.addAttribute("sellCount", sell_count);	//총매출
		model.addAttribute("cancelSell", cancelSell);
		
		return "admin/index";
		
	}
	

	
	//------------매출 순위 더 보기----------------------------
	@GetMapping(value = "ad_more_Ranking")
	public String moreRanking(Model model, HttpSession session) {
		
		List<ManagerVO> ranking = service.getRanking();					//매출순위
		List<ManagerVO> starRanking = service.getStarRanking();			//별점순위
		List<ManagerVO> followerRanking = service.getFollowerRanking(); //팔로워순위
		
		model.addAttribute("ranking", ranking);							//매출순위
		model.addAttribute("starRanking", starRanking);					//매출순위
		model.addAttribute("followerRanking", followerRanking);			//팔로워순위
		
		
		return "admin/ad_more_Ranking";
	}

		
		
	
	//======================================여기부터는 주문취소요청  열차입니다=====================================================
	//======================================여기부터는 주문취소요청  열차입니다=====================================================
	
	
	//------------결제취소요청 목록----------------------------
	@RequestMapping(value = "ad_Cancel_Order", method = RequestMethod.GET)
	public String CancleOrder(Model model,HttpSession session) { 

		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin") || sId == "") {
			model.addAttribute("msg", " 잘못된 접근입니다!");
			return "admin/ad_fail_back";
		} 
		
		List<SellVO> CancelRequest = service.getCancelRequestList(); //요청목록
		List<SellVO> cancelSuccess = service.getCancelSuccessList(); //승인목록
		
		model.addAttribute("CancelRequest", CancelRequest); //요청목록
		model.addAttribute("cancelSuccess", cancelSuccess); //승인목록
		
		
		return "admin/ad_Cancel_Order";
		
	}
		

	//------------결제취소요청 목록----------------------------
	@RequestMapping(value = "ad_statusChange", method = RequestMethod.GET)
	public String statusChange(Model model, HttpSession session,
											@RequestParam int sell_idx,
											@RequestParam String sell_cancel_status ) { 

		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin") || sId == "") {
			model.addAttribute("msg", " 잘못된 접근입니다!");
			return "admin/ad_fail_back";
		} 
		
		if(sell_cancel_status.equals("취소요청")) {
			int updateCount = service.changeCancelStatus(sell_idx); //취소요청 승인
			
			if(updateCount > 0) {
				// 취소 승인시 재고 다시 추가
				List<SellVO> orderDetailList = sell_service.getOrderDetailList(sell_idx);
				
				for(int i = 0; i < orderDetailList.size(); i++) {
					String item_idx1 = orderDetailList.get(i).getItem_idx();
					String sell_amount1 = orderDetailList.get(i).getSell_amount();
					
					int item_idx2 = Integer.parseInt(item_idx1);
					int sell_amount2 = Integer.parseInt(sell_amount1);
					
				int modifyItemNumberCount = item_service.modifyItemNumber2(item_idx2, sell_amount2);
			}
		}	
//						System.out.println("승인완료" + updateCount);

			return "redirect:/ad_Cancel_Order";
		
				} 
				return "redirect:/ad_Cancel_Order"; //수정쓰
			}
		
		
		
		
		
		
		
	//------------전체관리자 회원관리(전체목록)----------------------------
	@GetMapping(value = "/ad_member_Manage")
	public String ad_member_Manage(Model model, HttpSession session,
									@RequestParam(defaultValue = "1") int pageNum,
									@RequestParam(defaultValue = "") String searchType,
									@RequestParam(defaultValue = "") String keyword) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		//페이징 처리
		int listLimit = 10;
		int pageListLimit = 10;
		
		int startRow = (pageNum - 1) * listLimit;
		
		
		List<MemberVO> memberList = service.getMemberList(startRow, listLimit, searchType, keyword);
		System.out.println("gmd" + memberList);
		
		
		int listCount = service.getMemberListCount(searchType, keyword);
		System.out.println("검색 결과(목록 수)" + listCount);
		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		//시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		//끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo  pageinfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageInfo", pageinfo);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
//			System.out.println("회원목록" + memberList);
		return "admin/ad_member_Manage"; 
		
	}
		
		
	//------------전체관리자 회원정보조회----------------------------
	@GetMapping(value = "/ad_member_Detail")
	public String ad_member_Detail(@RequestParam String id, Model model, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			
			return "admin/ad_fail_back";
		}
		MemberVO member = service.memberInfo(id);
		//조회된 회원 1명의 데이터를 model 객체에 저장 
		model.addAttribute("member", member);
//			System.out.println("회원상세정보" + member);
		return "admin/ad_member_Detail";
	}
		

	//------------전체관리자 회원관리 수정 폼 요청----------------------------
	@GetMapping(value = "/ad_member_Detail_Update")
	public String ad_member_Detail_UpdateForm(@RequestParam String id, Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		MemberVO member = service.memberInfo(id);
		model.addAttribute("member", member);
		
		return "admin/ad_member_Detail_Update" ;
	}
		
		
	//------------회원관리 수정----------------------------
	@PostMapping(value = "/ad_member_Detail_UpdatePro")
	public String ad_member_Detail_Update(@ModelAttribute MemberVO member,@RequestParam String newName,
											String id, Model model, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		member = service.memberInfo(id);
		int updateCount = service.modifyMember(member, newName, id);
		System.out.println("회원정보 수정" + updateCount);
		if(updateCount > 0) {
			return "redirect:/ad_member_Detail?id=" + member.getMember_id();
		}
		model.addAttribute("fail", "회원정보 수정에 실패했습니다!");
		return "admin/ad_fail_back";
	}
		
		

	//------------회원 삭제----------------------------
	@RequestMapping(value = "ad_memberDelete", method = RequestMethod.GET)
	public String ad_memberDelete(@ModelAttribute MemberVO member,@RequestParam String id,
								  Model model, HttpSession session) {  
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		int deleteCount = service.removeMember(id);
		
		if(deleteCount > 0) {
			
			return "redirect:/ad_member_Manage";

		}
			model.addAttribute("fail", "회원 추방 실패!"); 
			return "admin/ad_fail_back";
		
	}
		

	//======================================여기부터는 기업행 열차입니다=====================================================
	//======================================여기부터는 기업행 열차입니다=====================================================

		
		
		
	//------------전체관리자 기업관리(승인완료)----------------------------
	@GetMapping(value = "/ad_Manager_manage")
	public String ad_Manager_manage(Model model, HttpSession session,
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		//페이징 처리
		int listLimit = 10;
		int pageListLimit = 10;
		
		int startRow = (pageNum - 1) * listLimit;
		
		//기업목록 조회
		List<ManagerVO> managerList = service.getManagerList(startRow, listLimit,
															searchType, keyword);
		
		int listCount = service.getManagerListCount(searchType, keyword);
		System.out.println("검색 결과(목록 수)" + listCount);
		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		//시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		//끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo  pageinfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("managerList", managerList);
		model.addAttribute("pageInfo", pageinfo);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		System.out.println(managerList);
		return "admin/ad_Manager_manage";
	}
		
		
	//------------전체관리자 기업관리(승인대기)----------------------------
	@GetMapping(value = "/ad_Manager_auth")
	public String ad_ad_Manager_auth(Model model, HttpSession session,
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		
		//페이징 처리
		int listLimit = 10;
		int pageListLimit = 10;
		
		int startRow = (pageNum - 1) * listLimit;
		
		
		List<ManagerVO> managerAuthList = service.getManagerAuthList(startRow, listLimit,
																	searchType, keyword);
		
		int listCount = service.getAuthListCount(searchType, keyword);
		System.out.println("검색 결과(목록 수)" + listCount);
		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		//시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		//끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo  pageinfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		
		model.addAttribute("managerAuthList", managerAuthList);
		model.addAttribute("pageInfo", pageinfo);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		System.out.println(managerAuthList);
		return "admin/ad_Manager_auth";
	}

		
	//------------기업상세정보 조회----------------------------
	@GetMapping(value = "/ad_Manager_detail")
	public String ad_Manager_detail(@RequestParam String id, Model model, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		ManagerVO manager = service.getManagerInfo(id);
		model.addAttribute("manager", manager);
		
		return "admin/ad_Manager_detail";
	}
		
		
	//------------기업 가입 승인 기능----------------------------
	@GetMapping(value = "/ad_AdminAuth")
	public String ad_AdminAuth(Model model, HttpSession session, ManagerVO manager) {
		
		int updateCount = service.updateAuth(manager);
		
		return "redirect:/ad_Manager_detail?id=" + manager.getManager_id() + "&auth=" + manager.getManager_adminauth();
	}
		
		
	//------------전체관리자 기업삭제----------------------------
	@GetMapping(value = "/ad_ManagerDelete")
	public String ad_Manager_remove(@RequestParam String id, Model model, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		int delectCount = service.removeManager(id);
		
		if(delectCount > 0) {
			return "redirect:/ad_Manager_manage";
		}
		
		model.addAttribute("fail", "기업 삭제에 실패 했습니다!");
		return "admin/ad_fail_back";
	}
		
		
		
	//======================================여기부터는 문의게시판행 열차입니다=====================================================
	//======================================여기부터는 문의게시판행 열차입니다=====================================================
		
		
		
	//------------1:1문의(답변대기) 목록 조회----------------------------
	@RequestMapping(value = "/ad_One_Board", method = RequestMethod.GET)
	public String ad_One_Board(Model model, HttpSession session,
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		//페이징 처리
		int listLimit = 10;
		int pageListLimit = 10;
		
		int startRow = (pageNum - 1) * listLimit;
		
		//1:1 문의 목록
		List<QnaVO> OneQnaList = service.getOneQnaBoardList(startRow, listLimit,
															searchType, keyword);
		
		//1:1 문의 갯수
		int listCount = service.getOneListCount(searchType, keyword);
		System.out.println("검색 결과(목록 수)" + listCount);
		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		//시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		//끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo  pageinfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		
		model.addAttribute("OneQnaList", OneQnaList);
		model.addAttribute("pageInfo", pageinfo);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
//			System.out.println("야야야야야" + OneQnaList);
		
			return "admin/ad_One_Board";
	}
		
		
	
	//------------1:1문의 답변 등록 요청----------------------------
	@GetMapping(value = "/ad_Answer")
	public String ad_Answer(Model model, HttpSession session, QnaVO qna) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		int updateCount = service.registAnswer(qna); 	 //답변등록요청
		int changeStatus = service.changeQnaStatus(qna); //답변상태 업데이트 요청
		
		if(updateCount > 0 && updateCount > 0) {
			//답변(qna_answer)이 달리면 답변상태(qna_status)를 변경하는 메서드
			return "redirect:/ad_One_Answer"; //답변완료 상세 페이지로 포워딩하기
		}
		model.addAttribute("fail", "답변등록에 실패했습니다");
		return "admin/ad_fail_back";
		
	}
		
		
	//------------1:1문의 답변 수정 요청----------------------------
	@GetMapping(value = "/ad_AnswerModifiy")
	public String ad_AnswerModifiy(Model model, HttpSession session, QnaVO qna) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		int updateCount = service.registAnswer(qna);
		
		return "redirect:/ad_One_Answer_Detail?qna_idx=" + qna.getQna_idx() + "&id=" + qna.getQna_id();
				
	}
		
		
	//------------1:1문의(답변 완료) 목록 조회----------------------------
	@RequestMapping(value = "/ad_One_Answer", method = RequestMethod.GET)
	public String ad_One_Answer(Model model, HttpSession session,
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		//페이징 처리
		int listLimit = 10;
		int pageListLimit = 10;
		
		int startRow = (pageNum - 1) * listLimit;
		
		//1:1문의(답변완료) 목록
		List<QnaVO> OneQnaAnswerList = service.getOneQnaAnswerList(startRow, listLimit,
															searchType, keyword);
		
		//1:1문의(답변완료) 갯수
		int listCount = service.getOneQnaAnswerCount(searchType, keyword);
		System.out.println("검색 결과(목록 수)" + listCount);
		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		//시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		//끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo  pageinfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		
		model.addAttribute("OneQnaAnswerList", OneQnaAnswerList);
		model.addAttribute("pageInfo", pageinfo);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
			return "admin/ad_One_Answer";
	}
		
		
		
	//------------1:1 문의글(답변완료) 상세정보 조회----------------------------
	@RequestMapping(value = "/ad_One_Answer_Detail", method = RequestMethod.GET)
	public String ad_One_Answer_Detail(Model model, HttpSession session, int qna_idx, String id) {
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		QnaVO oneQnaInfo = service.getOneQnaInfo(qna_idx, id);
		System.out.println("1:1문의 완료상세 : " + oneQnaInfo);
		model.addAttribute("oneQnaInfo", oneQnaInfo);
		
		
		return "admin/ad_One_Answer_Detail";
	}
		
		
	//------------1:1 문의글 상세정보 조회----------------------------
	@RequestMapping(value = "/ad_One_Board_Detail", method = RequestMethod.GET)
	public String ad_One_Board_Detail(Model model, HttpSession session, int qna_idx, String id) {
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		QnaVO oneQnaInfo = service.getOneQnaInfo(qna_idx, id);
		System.out.println("1:1문의 상세 : " + oneQnaInfo);
		model.addAttribute("oneQnaInfo", oneQnaInfo);
		
		
		return "admin/ad_One_Board_Detail";
	}
		
		
		
	//------------1:1게시글 삭제----------------------------
	@GetMapping(value = "/ad_oneQnaDelete")
	public String oneQna_remove(@RequestParam String id, int idx, Model model, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		int delectCount = service.removeOneQnaRemove(idx,id);
		
		if(delectCount > 0) {
			return "redirect:/ad_One_Board";
		}
		
		model.addAttribute("fail", "1:1문의글 삭제에 실패 했습니다!");
		return "admin/ad_fail_back";
	}
		
		
		
	//======================================여기부터는 게시판관리행 열차입니다=====================================================
	//======================================여기부터는 게시판관리행 열차입니다=====================================================
			
			
			
	//------------관리자 커뮤니티 게시판 관리----------------------------
	@GetMapping(value = "/ad_Board_Management")
	public String ad_Board_Management(Model model, HttpSession session,
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		//페이징 처리
		int listLimit = 10;
		int pageListLimit = 10;
		
		int startRow = (pageNum - 1) * listLimit;
		
		
		List<BoardVO> boardList = service.getBoardList(startRow, listLimit, searchType, keyword);
		
		int listCount = service.getBoardListCount(searchType, keyword);
		System.out.println("검색 결과(목록 수)" + listCount);
		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		//시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		//끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo  pageinfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageInfo", pageinfo);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		return "admin/ad_Board_Management";
	}	
		
		
		
	//------------커뮤니티글 상세조회----------------------------
	@GetMapping(value = "/ad_Board_Detail")
	public String ad_Board_Detail(Model model, HttpSession session, int board_idx) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		
		BoardVO commuDetail = service.getCommuDetail(board_idx);
		model.addAttribute("commuDetail", commuDetail);
		
		
		return "admin/ad_Board_Detail";
	}
		
		
	//------------게시글(커뮤,레시피,후기) 삭제----------------------------
	@GetMapping(value = "/ad_BoardRemove")
	public String ad_Board_Remove(Model model ,HttpSession session, int board_idx, String board_type) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		
		int deleteCount = service.removeBoard(board_idx);
		
		if(deleteCount > 0 ) {
			
			switch (board_type) {
			case "커뮤": 	return "redirect:/ad_Board_Management";
			case "후기":	return "redirect:/ad_Board_Review";
			default	  :	return "redirect:/ad_Board_Recipe";
			}
			
		}
		
		model.addAttribute("fail", "게시글 삭제에 실패했습니다");
		return "admin/ad_fail_back";
	}
		
		
		
	//------------후기 게시판 목록----------------------------
	@RequestMapping(value = "/ad_Board_Review", method = RequestMethod.GET)
	public String ad_Board_Review(Model model, HttpSession session,
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		//페이징 처리
		int listLimit = 10;
		int pageListLimit = 10;
		
		int startRow = (pageNum - 1) * listLimit;
		
		List<BoardVO> reviewList = service.getReviewList(startRow, listLimit,
														searchType, keyword);
		
		int listCount = service.getReviewListCount(searchType, keyword);
		System.out.println("검색 결과(목록 수)" + listCount);
		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		//시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		//끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo  pageinfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pageInfo", pageinfo);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		return "admin/ad_Board_Review";
	}
		
		
		
	//------------후기 게시글 상세조회----------------------------
	@GetMapping(value = "/ad_Review_Detail")
	public String ad_Review_Detail(Model model, HttpSession session, int board_idx) {
		
		String sId = (String)session.getAttribute("sId");
		System.out.println("sId= " + sId);
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		BoardVO reviewDetail = service.getReviewDetail(board_idx);
		model.addAttribute("reviewDetail", reviewDetail);
		
		
		return "admin/ad_Review_Detail";
	}
		
		
		
	//------------레시피 게시판----------------------------
	@GetMapping(value = "/ad_Board_Recipe")
	public String ad_Board_Recipe(Model model, HttpSession session,
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword) {
		
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		//페이징 처리
		int listLimit = 10;
		int pageListLimit = 10;
		
		int startRow = (pageNum - 1) * listLimit;
		
		
		//레시피 목록
		List<BoardVO> recipeList = service.getRecipeList(startRow, listLimit, searchType, keyword);
		System.out.println("레시피 목록 : " + recipeList);
		
		//레시피 목록 갯수
		int listCount = service.getRecipeListCount(searchType, keyword);
		System.out.println("검색 결과(목록 수)" + listCount);
		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		//시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		//끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo  pageinfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("recipeList", recipeList);
		model.addAttribute("pageInfo", pageinfo);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		return "admin/ad_Board_Recipe";
	}
		
		
	//------------관리자 게시글 상세조회----------------------------
	@GetMapping(value = "/ad_Recipe_Detail")
	public String ad_Recipe_Detail(Model model, HttpSession session, String board_idx) {
		
		String sId = (String)session.getAttribute("sId");
		System.out.println("sId= " + sId);
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		
		BoardVO recipeDetail = service.getRecipeDetail(board_idx);
		model.addAttribute("recipeDetail", recipeDetail);
		
		
		return "admin/ad_Recipe_Detail";
	}
		
		
		
		
	//======================================여기부터는 신고글관리행 열차입니다=====================================================
	//======================================여기부터는 신고글관리행 열차입니다=====================================================
		
	
	
	
	//------------ 신고글 관리(처리대기 목록만 출력)----------------------------
	@GetMapping(value = "/ad_Report_Management")
	public String ad_Report_Management(Model model, HttpSession session,
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		//페이징 처리
		int listLimit = 10;
		int pageListLimit = 10;
		
		int startRow = (pageNum - 1) * listLimit;
		
		List<ReportVO> reportList = service.getReportList(startRow, listLimit, searchType, keyword);
		
		
		int listCount = service.getReportListCount(searchType, keyword);
		System.out.println("검색 결과(목록 수)" + listCount);
		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		//시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		//끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo  pageinfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		
		model.addAttribute("reportList", reportList);
		model.addAttribute("pageInfo", pageinfo);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		return "admin/ad_Report_Management";
	}
		
		
		
	//------------ 신고글 관리(처리완료 목록만 출력)----------------------------
	@GetMapping(value = "/ad_Report_Success")
	public String ad_Report_Success(Model model, HttpSession session,
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		//페이징 처리
		int listLimit = 10;
		int pageListLimit = 10;
		
		int startRow = (pageNum - 1) * listLimit;
		
		List<ReportVO> reportSuccessList = service.getReportSuccessList(startRow, listLimit, searchType, keyword);
		
		int listCount = service.getReportSuccessListCount(searchType, keyword);
		System.out.println("검색 결과(목록 수)" + listCount);
		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		//시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		//끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo  pageinfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("reportSuccessList", reportSuccessList);
		model.addAttribute("pageInfo", pageinfo);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		return "admin/ad_Report_Success";
	}
	
		
	
	//------------ 신고글 상세조회----------------------------
	@GetMapping(value = "/ad_Report_Detail")
	public String ad_Report_Detail(Model model, HttpSession session, int report_idx) {
		
		String sId = (String)session.getAttribute("sId");
		System.out.println("sId= " + sId);
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		ReportVO reportInfo = service.getReportInfo(report_idx);  //신고글 조회(reporter)
		BoardVO originBoard = service.getOriginBoard(report_idx); //신고된 원본글 조회
		
		
		model.addAttribute("reportInfo", reportInfo);   //신고글 조회(reporter)
		model.addAttribute("originBoard", originBoard); //신고된 원본글 조회
		
		
		return "admin/ad_Report_Detail";
	}		
		
		
		
	//------------ 신고글 삭제----------------------------
	@GetMapping(value = "/ad_ReportRemove")
	public String ad_Report_Remove(Model model, HttpSession session, int report_idx) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		int deleteCount = service.removeReportBoard(report_idx);
		//신고된 원글이 삭제되면 데이터가 사라지므로 목록에 사용X
		
		if(deleteCount > 0) {

			return "redirect:/ad_Report_Management";
		}
		
		model.addAttribute("fail", "신고글 삭제에 실패했습니다");
		return "admin/ad_fail_back";
	}	
		
		
			
	//------------ 신고된 원본글(board) 삭제 및 상태처리----------------------------
	@GetMapping(value = "/ad_RemoveOriginboard")
	public String ad_Report_RemoveOriginboard(
												Model model, HttpSession session,
												int board_idx, ReportVO report) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		int deleteCount = service.removeBoard(board_idx); 			// 게시글 삭제 요청
		int updateCount = service.changeStatus(board_idx, report); // 처리상태 변경 요청
		//게시글 삭제와 처리상태가 변경되면 포워딩 실행
		if(deleteCount > 0 && updateCount > 0) {
			
			return "redirect:/ad_Report_Success";
		}
		
		model.addAttribute("msg", "게시글 삭제에 실패했습니다");
		return "admin/ad_Report_Management";
	}
		
	//신고글 처리반려 요청
	@GetMapping(value = "/ad_ReportReturn")
	public String statusReturn(Model model, int report_idx) {
		
		int updateCount = service.changeReportStatus(report_idx);
		System.out.println("신고글 처리반려 : " + updateCount);
		
		return "redirect:/ad_Report_Management";
	}
		
		
			
	//======================================여기부터는 공지관리행 열차입니다=====================================================
	//======================================여기부터는 공지관리행 열차입니다=====================================================		
		
		
	
	//------------공지 목록----------------------------
	@GetMapping(value = "/ad_Notice")
	public String ad_Notice(Model model, HttpSession session, @RequestParam(defaultValue = "1") int pageNum) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		//페이징 처리
		int listLimit = 10;
		int pageListLimit = 10;
		
		int startRow = (pageNum - 1) * listLimit;
		
		
		List<BoardVO> noticeList = service.getNoticeList(startRow, listLimit);
		
		
		int listCount = service.getNoticeListCount();
		System.out.println("검색 결과(목록 수)" + listCount);
		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		//시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		//끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo  pageinfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageInfo", pageinfo);
		
		
		return "admin/ad_Notice";
	}
	
	
	//------------공지 상세조회----------------------------
	@GetMapping(value = "/ad_Notice_Detail")
	public String ad_Notice_Detail(Model model, HttpSession session, int board_idx) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		
		BoardVO noticeDetail = service.getNoticeDetail(board_idx);
		model.addAttribute("noticeDetail", noticeDetail);
		
		
		return "admin/ad_Notice_Detail";
	}
	
		
	//------------공지 작성폼 요청----------------------------
	@GetMapping(value = "/ad_Notice_Write")
	public String ad_Notice_Write() {
		return "admin/ad_Notice_Write";
	}
	
		
	//------------공지 등록----------------------------
	@PostMapping(value = "/ad_Notice_WritePro")
	public String ad_Notice_WritePro(BoardVO board, Model model, HttpSession session) {
		
		int insertCount = service.registNotice(board);
		
		if(insertCount > 0) {
			
			return "redirect:/ad_Notice";
		}
		
		model.addAttribute("fail", "공지등록에 실패했습니다!");
		
		return "admin/ad_fail_back";
	}
		
		
	//------------공지 수정 폼 요청----------------------------
	@GetMapping(value = "/ad_Notice_Update")
	public String ad_Notice_Update(Model model, HttpSession session, @RequestParam int board_idx) {
		
		BoardVO noticeDetail = service.getNoticeDetail(board_idx);
		model.addAttribute("noticeDetail", noticeDetail);
		
		return "admin/ad_Notice_Update";
	}
	
	
	//------------공지 수정----------------------------
	@GetMapping(value = "/ad_Notice_UpdatePro")
	public String ad_Notice_UpdatePro(Model model, HttpSession session, BoardVO board) {
		
		int updateCount = service.modifyNotice(board);
		
		
		return "redirect:/ad_Notice";
	}

	
	//------------공지 삭제----------------------------
	@GetMapping(value = "/ad_Notice_Delete")
	public String ad_Notice_Delete(Model model, HttpSession session, @RequestParam String idx) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		int deleteCount = service.removeNotice(idx);
		
		if(deleteCount > 0 ) {
			return "redirect:/ad_Notice";
		}
		
		model.addAttribute("fail", "공지글 삭제에 실패 했습니다!");
		return "admin/ad_fail_back";
	}
	
		
		
		
		
		
	
	
}
