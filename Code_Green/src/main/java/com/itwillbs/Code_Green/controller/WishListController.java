package com.itwillbs.Code_Green.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.Code_Green.service.WishListService;
import com.itwillbs.Code_Green.vo.WishListVO;

@Controller
public class WishListController {

	@Autowired
	private WishListService service;
	
	
	//------------ 위시리스트 추가-------------------------------------------
	@ResponseBody
	@GetMapping(value = "/WishList.bo")
	public int WishList(@RequestParam(defaultValue = "1") int pageNum, Model model, HttpSession session,@ModelAttribute WishListVO wishList,
			@RequestParam int item_idx, @RequestParam String item_category,@RequestParam String manager_brandname,@RequestParam String member_id ) {
		String sId = (String)session.getAttribute("sId");
		if(member_id == null || sId == null || member_id.equals("") || (!member_id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return 0;
		}
		model.addAttribute("item_idx", item_idx);
		model.addAttribute("member_id", member_id);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("manager_brandname",manager_brandname);
		model.addAttribute("item_category",item_category);
		
		
		
		//위시리스트 있는지 없는지
		int checkWish = service.checkWish(wishList, item_idx, member_id);
		if(checkWish == 0) {
			//위시리스트 추가
			int insertWish = service.insertWish(wishList, item_idx, member_id);
			
			if(insertWish > 0) {
				checkWish = 1;
			}
		}else {
			//위시리스트 삭제
			int deleteCount = service.removeWish(wishList, item_idx, member_id);
			
			if(deleteCount > 0) {
				checkWish = 2;
			}
		}
		return checkWish;
		
	}

	//------------ 위시리스트 갯수-------------------------------------------
	@ResponseBody
	@PostMapping("/WishCount.bo")
	public int WishCount(@RequestParam(defaultValue = "0") int item_idx, Model model ) {
		
		int count = service.WishCount(item_idx);
		model.addAttribute("item_idx", item_idx);
		model.addAttribute("count", count);
		
		return count;
	}
	
	//------------ 위시리스트 추가 -리스트-------------------------------------------
	@ResponseBody
	@GetMapping(value = "/addHeart" ,produces ="text/plain; charset=utf-8")
	public String addHeart(@RequestParam(defaultValue = "1") int pageNum, Model model, HttpSession session,@ModelAttribute WishListVO wishList,
			@RequestParam int item_idx, @RequestParam String item_category,@RequestParam String manager_brandname,@RequestParam String member_id ) {
		String sId = (String)session.getAttribute("sId");
		if(member_id == null || sId == null || member_id.equals("") || (!member_id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "member/fail_back";
		}
		model.addAttribute("item_idx", item_idx);
		model.addAttribute("member_id", member_id);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("manager_brandname",manager_brandname);
		model.addAttribute("item_category",item_category);
		
		
		
		//위시리스트 있는지 없는지
		int checkWish = service.checkWish(wishList, item_idx, member_id);
		if(checkWish == 0) {
			//위시리스트 추가
			int insertWish = service.insertWish(wishList, item_idx, member_id);
			
				if(insertWish > 0) {
					return "찜 목록 추가";
			}
				return "redirect:/cart/fail_back.jsp";
		}else {
			//위시리스트 삭제
			int deleteCount = service.removeWish(wishList, item_idx, member_id);
			
			if(deleteCount > 0) {
				return "찜 목록 삭제";
			}else {
				return "redirect:/cart/fail_back.jsp";
			}
		}
		
	}
	
	
	//------------ 상품후기 추천-------------------------------------------
	@GetMapping(value = "/ReviewBest.bo")
	public String ReviewBest( Model model, HttpSession session,@ModelAttribute WishListVO wishList,
			@RequestParam(defaultValue = "1") int item_idx,@RequestParam int board_idx, @RequestParam String item_category,@RequestParam String manager_brandname,@RequestParam String member_id ) {
		System.out.println(item_idx);
		System.out.println(board_idx);
		
		String sId = (String)session.getAttribute("sId");
		if(member_id == null || sId == null || member_id.equals("") || (!member_id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "member/fail_back";
		}
		model.addAttribute("item_idx", item_idx);
		model.addAttribute("member_id", member_id);
		model.addAttribute("manager_brandname",manager_brandname);
		model.addAttribute("item_category",item_category);
		model.addAttribute("board_idx",board_idx);
		
		
		
		//추천 있는지 없는지
		int checkBest = service.checkBest(board_idx, item_idx, member_id);
		
		
		if(checkBest == 0) {
			//추천 추가
			int insertBest = service.insertBest(board_idx, item_idx, member_id);
			
			if(insertBest > 0) {
				model.addAttribute("best_alert", "글 추천이 완료되었습니다");
				model.addAttribute("item_idx", item_idx);
				model.addAttribute("member_id", member_id);
				model.addAttribute("manager_brandname",manager_brandname);
				model.addAttribute("item_category",item_category);
				model.addAttribute("board_idx",board_idx);
				return "member/fail_back2";
			}
		}else {
			//위시리스트 삭제
			int deleteCount = service.removeBest(board_idx, item_idx, member_id);
			
			if(deleteCount > 0) {
				model.addAttribute("best_alert", "글추천 삭제되었습니다");
				model.addAttribute("item_idx", item_idx);
				model.addAttribute("member_id", member_id);
				model.addAttribute("manager_brandname",manager_brandname);
				model.addAttribute("item_category",item_category);
				model.addAttribute("board_idx",board_idx);
				return "member/fail_back2";
			}
		}
		return "redirect:/ItemDetail.bo";
	}
	

	//------------ 상품후기 추천 갯수-------------------------------------------
	@ResponseBody
	@GetMapping("/ReviewBest_Count.bo")
	public int ReviewBest_Count(@RequestParam(defaultValue = "0") int board_idx, Model model,@RequestParam(defaultValue = "0") int item_idx ) {
		
		int count = service.BestCount(board_idx);
		model.addAttribute("board_idx", board_idx);
		model.addAttribute("item_idx", item_idx);
		model.addAttribute("count", count);
		System.out.println(count);
		return count;
	}
	
}
