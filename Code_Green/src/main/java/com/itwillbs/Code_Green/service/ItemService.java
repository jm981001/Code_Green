package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.ItemMapper;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.QnaVO;


@Service
public class ItemService {

	@Autowired
	private ItemMapper mapper;
	
	//상품 조회수 증가
	public void increaseReadcount(int item_idx) {
		mapper.updateReadcount(item_idx);
	}


	//상품 상세정보 조회
	public ItemVO getItem(int item_idx) {
		return mapper.selectItem(item_idx);
	}

	//상품 후기 조회
	public List<BoardVO> getReview(int startRow, int listLimit, String searchType,int item_idx) {
		return mapper.selectReview(startRow, listLimit,searchType,item_idx);
	}
	
	//상품 후기 별점높은순
	public List<BoardVO> selectGoodList(int startRow, int listLimit, int item_idx) {
		return mapper.selectGoodList(startRow, listLimit, item_idx);
	}
	
	//상품 후기 추천 많은순
	public List<BoardVO> selectBestList(int startRow, int listLimit, int item_idx) {
		return mapper.selectBestList(startRow, listLimit, item_idx);
	}

	//상품 후기 별점낮은순
	public List<BoardVO> selectWorstList(int startRow, int listLimit, int item_idx) {
		return mapper.selectWorstList(startRow, listLimit, item_idx);
	}

	// 상품 후기 갯수 조회
	public int getReviewListCount(int item_idx) {
		return mapper.selectReviewListCount(item_idx);
	}

	// 상품 문의 갯수 조회
	public int getQnaListCount(int item_idx) {
		return mapper.selectQnaListCount(item_idx);
	}

	//신상품리스트
	public List<ItemVO> itemList() {
		return mapper.selectItemList();
	}

	//신상품리스트 판매순
	public List<ItemVO> itemList_sales() {
		return mapper.selectItemList_sales();
	}
	
	//신상품리스트 가격 낮은순
	public List<ItemVO> itemList_cheap() {
		return mapper.selectItemList_cheap();
	}

	//신상품리스트 가격 높은순
	public List<ItemVO> itemList_ex() {
		return mapper.selectItemList_ex();
	}

	//상품 갯수
	public int getItemListCount(String searchType, String keyword) {
		return mapper.selectItemListCount(searchType, keyword);
	}
	
	//베스트리스트
	public List<ItemVO> itemBestList() {
		return mapper.selectItemBestList();
	}

	//베스트리스트 갯수
	public int getItemBestListCount(String searchType, String keyword) {
		return mapper.selectItemBestListCount(searchType, keyword);
	}

	//상세상세페이지 안 관련상품 6개
	public List<ItemVO> itemList6(String item_category) {
		return mapper.selectItemList6(item_category);
	}

	//상품 문의 리스트
	public List<QnaVO> getQna(int Qna_startRow, int Qna_listLimit, int item_idx) {
		return mapper.selectQna(Qna_startRow, Qna_listLimit, item_idx);
	}

	//상세상세페이지 같은 브랜드상품 2개
	public List<ItemVO> sameBrand(String manager_brandname) {
		return mapper.selectSameBrand(manager_brandname);
	}


	//마이페이지 찜한 상품 리스트
	public List<ItemVO> wishList(int startRow, int listLimit, String member_id) {
		return mapper.wishList(startRow, listLimit, member_id);
	}

	//마이페이지 찜한 상품 리스트 갯수
	public int getWishListCount(String member_id) {
		return mapper.selectWishListCount(member_id);
	}

	//마이페이지 찜한상품 삭제
	public int removeWish(int member_idx, int heart_idx) {
		return mapper.deleteWish(member_idx, heart_idx);
	}

	//메인 새롭게 만나는 상품들
	public List<ItemVO> mainList1() {
		return mapper.mainList1();
	}


	//고객님들의 혼자알기 아까운 상품들
	public List<ItemVO> mainList2() {
		return mapper.mainList2();
	}

	//내 취향을 잘 아는 상품들
	public List<ItemVO> mainList3() {
		return mapper.mainList3();
	}

	//상품구매 유무 (리뷰 버튼)
	public int reviewBtn(int sIdx, int item_idx) {
		return mapper.reviewBtn(sIdx,item_idx);
	}

	//베스트리스트_판매순
	public List<ItemVO> itemBestList_sales() {
		return mapper.selectItemBestList_slaes();
	}

	//베스트리스트_가격 낮은순
	public List<ItemVO> itemBestList_cheap() {
		return mapper.selectItemBestList_cheap();
	}
	
	//베스트리스트_가격 높은순
	public List<ItemVO> itemBestList_ex() {
		return mapper.selectItemBestList_ex();
	}

	//작성 가능 후기 갯수
	public int getReviewListCount(String member_id) {
		return  mapper.getReviewListCount(member_id);
	}

	// 주문시 재고 차감
	public int modifyItemNumber(int item_idx2, int sell_amount2) {
		return  mapper.updateItemNumber(item_idx2, sell_amount2);
	}

	// 취소 승인시 재고 추가
	public int modifyItemNumber2(int item_idx2, int sell_amount2) {
		return mapper.updateItemNumber2(item_idx2, sell_amount2);
	}


	public int checkWish1(int sIdx, int item_idx) {
		return mapper.checkWish1(sIdx,item_idx);
	}








	
}
