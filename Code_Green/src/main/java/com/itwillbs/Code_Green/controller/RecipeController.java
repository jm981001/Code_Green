package com.itwillbs.Code_Green.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.Code_Green.service.RecipeService;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.File_boardVO;
import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.PageInfo;
import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeService service;
	
	// 레시피 메인(리스트)
	@GetMapping(value = "/recipe_main.bo")
	public String recipe_main(@RequestParam(defaultValue = "") String keyword,
							  @RequestParam(defaultValue = "1") int pageNum,
							  Model model) {
		
		int listLimit = 6; 
		
		int pageListLimit = 10; 

		int startRow = (pageNum - 1) * listLimit;
		
		// 전체 레시피 목록 조회
		List<BoardVO> recipeList = service.getRecipeList(startRow, listLimit, keyword);
		
		// 레시피 글 목록 갯수 조회
		int listCount = service.getRecipeCount();
		
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("recipeList", recipeList);
		
		System.out.println(recipeList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "recipe/recipe_main";
	}
	
	
	// 레시피 상세보기
	@GetMapping(value = "/recipe_detail.bo")
	public String recipe_detail(@RequestParam int board_idx, Model model) {
		
		// 등록한 레시피 불러오기
		BoardVO recipe = service.getRecipe(board_idx);
		
		// 레시피에 사용한 상품 불러오기
		ItemVO use_item = service.getUseItem(board_idx);
		
		// 레시피 작성자(브랜드) 관련상품 불러오기
		List<ItemVO> related_item = service.getRelatedItem(recipe.getBoard_id());
		
		// 레시피 조회수 증가
		service.increaseReadcount(board_idx);
		
		model.addAttribute("recipe", recipe);
		
		model.addAttribute("use_item" ,use_item);

		model.addAttribute("related_item" ,related_item);
		
		System.out.println(related_item);
		
		return "recipe/recipe_detail";
	}
	
}
