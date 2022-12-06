package com.itwillbs.Code_Green.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.File_ItemVO;
import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.MemberVO;
import com.itwillbs.Code_Green.vo.QnaVO;
import com.itwillbs.Code_Green.vo.SellVO;

public interface ManagerMapper {

	// 기업 가입에 필요한 insertManager() 메서드 정의
	// => 파라미터 : ManagerVO 객체(member), 리턴타입 : int
	public int insertManager(ManagerVO manager);
	// 아이디 중복체크
	public int idCheckM(String manager_id);
	// 메일 중복체크
	public int mailCheckM(String manager_id);
	
	// 로그인에 필요한 selectPasswd() 메서드 정의
	// => 파라미터 : String manager_id, 리턴타입 : String
	public String selectPasswd(String manager_id);

	// 브랜드 정보 조회에 필요한 selectManagerInfo() 메서드 정의
	// => 파라미터 : 아이디, 리턴타입 : ManagerVO
	public ManagerVO selectManagerInfo(String manager_id);
    
	// 브랜드 상세정보조회(브랜드마이페이지)
	public ManagerVO selectBrandInfo(String manager_id);
	
	// 브랜드 정보수정조회(브랜드마이페이지)
//	public ManagerVO modifyBrandInfo(String sId);
	
	// 브랜드 정보수정(브랜드마이페이지)
	public int updateBrandInfo(ManagerVO manager);
		
	// 브랜드 정보삭제(브랜드마이페이지)
	public int deleteBrand(String manager_id);
	
	
	//상품 목록 조회 (복수개의 파라미터는 @Param 어노테이션으로 이름 설정)
	public List<ItemVO> selectItemList(
			@Param("startRow") int startRow,@Param("listLimit") int listLimit,
			@Param("searchType") String searchType,@Param("keyword") String keyword,@Param("id") String id);

	//상품 상세 조회
     public ItemVO selectItemInfo(int item_idx);
     
	//상품 갯수 조회
	public int selectItemListCount(
			@Param("searchType") String searchType,@Param("keyword")  String keyword,@Param("id") String id);
	
	// 새 상품등록 - 텍스트
	public int insertProducts(@Param("item")ItemVO item, @Param("manager_idx")int manager_idx);
	
	// 새 상품등록 - 파일업로드
	public int insertProductsFile(File_ItemVO fileItem);
	
	
	//상품 상세보기 원글 불러오기   
		public ItemVO selectProducts(int itemModify_idx);
	
	
	//상품수정하기- 파일수정
	public int updateItemFileModify(File_ItemVO fileItem);
	
	//상품 수정(글) 
	public int updateItemModify(ItemVO item);
	
	//상품 삭제 전 파일명(file1) 조회   
	public String selectRealFile1(int item_idx);
	//상품 삭제 전 파일명(file2) 조회   
	public String selectRealFile2(int item_idx);
	// 상품 글 삭제
	public int deleteItem(int item_idx);
	// 상품 파일 삭제
	public int deleteItemFile(int item_idx);

	// 재고 목록 조회
		public List<ItemVO> selectStockList(
				@Param("startRow") int startRow,@Param("listLimit") int listLimit,
				@Param("searchType") String searchType,@Param("keyword") String keyword,@Param("id") String id);
	// 재고 갯수 조회
		public int selectStockListCount(@Param("searchType") String searchType,@Param("keyword")  String keyword,@Param("id") String id);
	
	//재고 상세 조회
		public ItemVO selectStockInfo(int item_idx);
	
	//재고 상세보기 원글 불러오기 
		public ItemVO selectstock(int item_idx);	
	//재고 수정
		public int updateStockModify(Object item_idx);
		
		
	//문의글 목록 조회
	public List<QnaVO> selectQnaBoardList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit, 
			@Param("searchType") String searchType,@Param("keyword") String keyword,@Param("id") String id);
	
	//문의글 갯수 조회
		public int selectQnaBoardListCount(
				@Param("searchType") String searchType, @Param("keyword") String keyword,@Param("id") String id);
	//문의글 상세 조회
	public QnaVO selectQnaInfo(String qna_idx);

	//문의글 답변등록
	public int updateQnaboard(QnaVO qna);
	//문의글 삭제
	 public int deleteQnaboard(String qna_idx);
	 
	 // 주문 목록 조회
	 public List<SellVO> selectOrderList(
			 @Param("startRow") int startRow,@Param("listLimit") int listLimit,
			 @Param("searchType") String searchType,@Param("keyword") String keyword,@Param("id") String id);
	 //주문 갯수 조회
	 public int selectOrderListCount(
			 @Param("searchType") String searchType,@Param("keyword")  String keyword, @Param("id") String id);
	 
	 //주문 상세 조회  
	 public List<SellVO> selectOrderInfo(@Param("sId")String sId, @Param("sell_order_number")String sell_order_number);
	 //주문 수정
	 public int updateOrders(ItemVO item);
	//총매출
	public SellVO selectTotalMoney();

	//총주문수
	public int selectTotalsellCount();
	
	//총매출,총주문건수
	public ManagerVO selectTotalMoneyOrder(String sId);
	
	// 매출 3순위
	   public List<ItemVO> getTop3(String sId);

	//팔로우 수
	   public int follow(String sId);

	 //매출순위 더보기  
	public List<ItemVO> getTop10(String sId);
    
	//총매출
	public ManagerVO selectSalesTotal(String sId);
	//한달매출
	public List<ManagerVO> selectSalesMonth(String sId);
	//일주일매출
	public List<ManagerVO> selectSalesWeek(String sId);
	//하루매출
	public List<ManagerVO> selectSalesDay(String sId);
	//수수료
	public SellVO selectCommission(String sId);
	//순수익
	public SellVO selectNet(String sId);
//	public Map<String, String> selectNet(String sId);
	
	
	
	
	
	
	


	   




}
