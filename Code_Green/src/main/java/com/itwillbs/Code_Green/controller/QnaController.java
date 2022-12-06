package com.itwillbs.Code_Green.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.Code_Green.service.QnaService;
import com.itwillbs.Code_Green.vo.QnaVO;

@Controller
public class QnaController {
	@Autowired
	private QnaService service;

	//------------상품 문의 작성-------------------------------------------
	@PostMapping(value = "/QnaWritePro.bo")
	public String reviewWritePro(@ModelAttribute QnaVO qna, Model model,int item_idx,@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam String item_category,@RequestParam String manager_brandname) {
		int insertCount = service.registQna(qna);
		model.addAttribute("item_idx", item_idx);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("manager_brandname",manager_brandname);
		model.addAttribute("item_category",item_category);
		if(insertCount > 0) {
			return "redirect:/ItemDetail.bo";
		} else {
			model.addAttribute("msg", "글 쓰기 실패!");
			return "member/fail_back";
		}
		
	}	
	
	//------------상품문의 삭제-------------------------------------------
	@GetMapping(value = "/QnaDelete.bo")
	public String deletePro(@RequestParam String qna_idx, Model model, HttpSession session,@RequestParam String item_idx,
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam String item_category,@RequestParam String manager_brandname) {

			int deleteCount = service.removeQna(qna_idx);
			model.addAttribute("item_idx", item_idx);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("manager_brandname",manager_brandname);
			model.addAttribute("item_category",item_category);

			System.out.println(manager_brandname);
			System.out.println(item_category);
			if(deleteCount > 0) {
				return "redirect:/ItemDetail.bo";
			}
		return "member/fail_back";
	}	
	
	
	//------------상품문의 수정-------------------------------------------
	@GetMapping(value = "/QnaModify.bo")
	public String qna_modify(@RequestParam int qna_idx, Model model, String item_idx,
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam String item_category,@RequestParam String manager_brandname) {
		QnaVO qna = service.getQna(qna_idx);
		model.addAttribute("qna",qna);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("manager_brandname",manager_brandname);
		model.addAttribute("item_category",item_category);
		return "item/qna_modify";
	}	
	
	@PostMapping(value = "/QnaModifyPro.bo")
	public String modifyPro(@ModelAttribute QnaVO qna, Model model, String item_idx,
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam String item_category,@RequestParam String manager_brandname) {

		//상품 문의 수정
		int updateCount = service.modifyQna(qna);
		model.addAttribute("item_idx", item_idx);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("manager_brandname",manager_brandname);
		model.addAttribute("item_category",item_category);


		if(updateCount == 0) {
			model.addAttribute("msg", "수정 실패!");
			return "member/fail_back";
		}
		
		return "redirect:/ItemDetail.bo" ;
	}
	
	
	
	
	// ---------------------------------- 1:1 문의 작성폼띄우기 ------------------------------------------------
	@GetMapping(value = "/WriteQna.bo")
	public String ManToManwrite(HttpSession session,Model model) {
		String sId = (String)session.getAttribute("sId");
		
		if(sId==null) {
			String msg = "로그인 후 작성가능합니다.";
			model.addAttribute("msg", msg);
			return "member/fail_back";
			
		} else {
			return "member/myPage_qnaWriteForm";
		}
		
	}
	
	// ---------------------------------- 1:1 문의 작성 ------------------------------------------------
	@PostMapping(value = "/WriteQnaPro.bo")
	public String ManToManwritePro(@ModelAttribute QnaVO qna ,Model model) {
		System.out.println(qna);
		
		int insertCount = service.writeMtmQna(qna);
		if(insertCount == 0) {
			model.addAttribute("msg", "문의글 작성에 실패했습니다. 다시 시도해주세요.");
			return "member/fail_back";
		} else {
			return "redirect:/myPageQnaList.my";
		}
		
	}
	
	
}
