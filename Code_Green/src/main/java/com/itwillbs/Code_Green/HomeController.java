package com.itwillbs.Code_Green;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.itwillbs.Code_Green.service.ItemService;
import com.itwillbs.Code_Green.service.RecipeService;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.ItemVO;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private ItemService service;
	
	@Autowired
	private RecipeService recipe_service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String itemList(Model model) {
		
		//새롭게 만나는 상품들 (신상품 30개 중에 랜덤 7개)
		List<ItemVO> mainList1 = service.mainList1();

		//고객님들의 혼자알기 아까운 상품들 (리뷰많은 상품 30개 중에 랜덤 7개)
		List<ItemVO> mainList2 = service.mainList2();
		
		//내 취향을 잘 아는 상품들 (좋아요 많은 상품 30개 중에 랜덤 7개)
		List<ItemVO> mainList3 = service.mainList3();
		
		// 레시피 리스트
		List<BoardVO> recipeList = recipe_service.getMainRecipe();
		
		model.addAttribute("mainList1", mainList1);
		model.addAttribute("mainList2", mainList2);
		model.addAttribute("mainList3", mainList3);
		model.addAttribute("recipeList", recipeList);
		return "main/main";
	}

}
