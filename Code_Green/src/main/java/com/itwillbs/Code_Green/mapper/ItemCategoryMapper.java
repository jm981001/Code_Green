package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.ItemVO;

public interface ItemCategoryMapper {

	// 전체 상품
	List<ItemVO> select_all(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);
	
	// 유제품/음료
	List<ItemVO> select_dairy_drink(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 해산물
	List<ItemVO> select_fish(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 과일/채소
	List<ItemVO> select_fruit_vegi(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 냉동/간편식품
	List<ItemVO> select_iced_easy(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 특가 상품
	List<ItemVO> select_sale();

	// 간식류 
	List<ItemVO> select_snack(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);
	
	
	// 전체 글 목록 갯수 조회(전체 상품)
	int selectAllListCount(@Param("searchType")String searchType, @Param("keyword")String keyword);

	// 전체 글 목록 갯수 조회(유제품/음료)
	int selectDairyDrinkListCount(@Param("searchType")String searchType, @Param("keyword")String keyword);

	// 전체 글 목록 갯수 조회(해산물)
	int selectFishListCount(@Param("searchType")String searchType, @Param("keyword")String keyword);

	// 전체 글 목록 갯수 조회(과일/채소)
	int selectFruitVegiListCount(@Param("searchType")String searchType, @Param("keyword")String keyword);

	// 전체 글 목록 갯수 조회(냉동/간편식품)
	int selectIcedEasyListCount(@Param("searchType")String searchType, @Param("keyword")String keyword);

	// 전체 글 목록 갯수 조회(간식류)
	int selectSnackListCount(@Param("searchType")String searchType, @Param("keyword")String keyword);

	
	
	// 낮은 가격순(유제품/음료)
	List<ItemVO> selectCheapDairyDrinkList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 높은 가격순(유제품/음료)
	List<ItemVO> selectExpensiveDairyDrinkList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 낮은 가격순(전체 상품)
	List<ItemVO> selectCheapAllList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 높은 가격순(전체 상품)
	List<ItemVO> selectExpensiveAllList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 낮은 가격순(해산물)
	List<ItemVO> selectCheapFishList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 높은 가격순(해산물)
	List<ItemVO> selectExpensiveFishList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 낮은 가격순(과일/채소)
	List<ItemVO> selectCheapFruitVegiList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 높은 가격순(과일/채소)
	List<ItemVO> selectExpensiveFruitVegiList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 낮은 가격순(냉동/간편식품)
	List<ItemVO> selectCheapIcedEasyList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 높은 가격순(냉동/간편식품)
	List<ItemVO> selectExpensiveIcedEasyList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 낮은 가격순(간식류)
	List<ItemVO> selectCheapSnackList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 높은 가격순(간식류)
	List<ItemVO> selectExpensiveSnackList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	
	
	
	// 후기 많은순(전체 상품)
	List<ItemVO> selectReviewAllList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 후기 많은순(유제품/음료)
	List<ItemVO> selectReviewDairyDrinkList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 후기 많은순(해산물)
	List<ItemVO> selectReviewFishList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 후기 많은순(과일/채소)
	List<ItemVO> selectReviewFruitVegiList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 후기 많은순(냉동/간편식품)
	List<ItemVO> selectReviewIcedEasyList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);

	// 후기 많은순(간식류)
	List<ItemVO> selectReviewSnackList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType")String searchType, @Param("keyword")String keyword);
	

}
