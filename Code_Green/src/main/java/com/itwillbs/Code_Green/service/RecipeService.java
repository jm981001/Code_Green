package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.RecipeMapper;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.File_boardVO;
import com.itwillbs.Code_Green.vo.ItemVO;

@Service
public class RecipeService {
	
	@Autowired
	private RecipeMapper mapper;

	
	
	//-------------------------레시피 페이지 내-----------------------------------
	// 레시피 목록(글) 불러오기
	public List<BoardVO> getRecipeList(int startRow, int listLimit, String keyword) {
		return mapper.selectRecipeFile(startRow, listLimit, keyword);
	}
	
	// 레시피 글 목록 갯수 조회
	public int getRecipeCount() {
		return mapper.selectRecipeCount();
	}
	
	// 레시피 상세보기 원글 불러오기
	public BoardVO getRecipe(int board_idx) {
		return mapper.selectRecipe(board_idx);
	}

	// 레시피 상세보기에서 사용한 상품 불러오기
	public ItemVO getUseItem(int board_idx) {
		return mapper.selectUseItem(board_idx);
	}
	
	// 레시피 작성자(브랜드) 관련상품 불러오기
	public List<ItemVO> getRelatedItem(String board_id) {
		return mapper.selectRelatedItem(board_id);
	}
	
	
	
	//------------------브랜드 페이지 내 레시피 관리-------------------------
	// 기업이 올린 상품 조회
	public List<ItemVO> getmyItem(String sId) {
		return mapper.selectMyItem(sId);
	}
	
	// 레시피 작성(글)
	public int writeRecipe(BoardVO board, int use_item_idx) {
		return mapper.insertRecipe(board, use_item_idx);
	}

	// 레시피 작성(파일)
	public int writeRecipeFile(File_boardVO fileBoard) {
		return mapper.insertRecipeFile(fileBoard);
	}
	
	// 레시피 파일 수정
	public int modifyRecipeFile(File_boardVO fileBoard) {
		return mapper.updateRecipeFile(fileBoard);
	}

	// 레시피 글 수정
	public int modifyRecipe(BoardVO board, int use_item_idx) {
		return mapper.updateRecipe(board, use_item_idx);
	}

	// 레시피 삭제 전 파일명(file1) 조회  
	public String getRealFile1(int board_idx) {
		return mapper.selectRealFile1(board_idx);
	}
	
	// 레시피 삭제 전 파일명(file2) 조회 
	public String getRealFile2(int board_idx) {
		return mapper.selectRealFile2(board_idx);
	}

	// 레시피 글 삭제
	public int removeRecipe(int board_idx) {
		return mapper.deleteRecipe(board_idx);
	}

	// 레시피 파일 삭제
	public int removeRecipeFile(int board_idx) {
		return mapper.deleteRecipeFile(board_idx);
	}

	// 브랜드 페이지 내 등록한 레시피 조회
   public List<BoardVO> getMyRecipeList(int startRow, int listLimit, String keyword, String sId) {
      return mapper.selectMyRecipeList(startRow, listLimit, keyword, sId);
   }

   // 브랜드 페이지 내 레시피 갯수 조회
   public int getMyRecipeCount(String keyword, String sId) {
      return mapper.selectMyRecipeCount(keyword, sId);
   }
	
   // 레시피 조회수 증가
	public void increaseReadcount(int board_idx) {
		mapper.updateReadcount(board_idx);
	}

	
	
	//-----------------메인 페이지-------------------
	// 메인 페이지 내 레시피리스트
	public List<BoardVO> getMainRecipe() {
		return mapper.selectMainRecipe();
	}

	
	

	

	

	
	

	

	

	// 레시피 목록(사진) 불러오기
//	public List<File_boardVO> getRecipeFileList() {
//		return mapper.selectRecipeFileList();
//	}
	

}
