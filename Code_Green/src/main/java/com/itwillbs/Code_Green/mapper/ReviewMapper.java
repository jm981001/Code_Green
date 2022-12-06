package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.BoardStarVO;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.CoinVO;
import com.itwillbs.Code_Green.vo.File_boardVO;

public interface ReviewMapper {

	//리뷰 등록
	int insertReview(BoardVO board);

	//리뷰 삭제
	int deleteReview(int board_idx);

	//마이페이지 작성글 리스트
	List<BoardVO> selectBoardList(@Param("startRow") int startRow,@Param("listLimit") int listLimit, @Param("member_id") String member_id);

	//마이페이지 작성글 갯수
	int selectItemListCount(String member_id);

	//리뷰 파일업로드
	int insertFile(File_boardVO file);

	//별점등록
	int insertStar(BoardStarVO star);

	//리뷰 상세정보 조회
	BoardVO selectReview(int board_idx);

	//리뷰 파일 상세정보 조회
	File_boardVO selecFile(int board_idx);
	
	//리뷰 수정
	int updateReview(BoardVO board);

	//파일 수정
	int updateFile(File_boardVO file);

	// 삭제 전 실제 업로드 된 파일명 조회 작업 요청1
	String selectRealFile1(int board_idx);
	// 삭제 전 실제 업로드 된 파일명 조회 작업 요청2
	String selectRealFile2(int board_idx);

	//파일삭제 
	int deleteFile(int board_idx);

	//리뷰 상태 변경
	void updateStatus(@Param("sell_idx") int sell_idx, @Param("item_idx") int item_idx);

	//리뷰작성시 적립금
	int CoinScore(CoinVO coin);


//	리뷰게시판 리뷰 상태 변경
	void reviewStatus(@Param("item_idx")int item_idx, @Param("sIdx")int sIdx);

	//마이페이지 후기 적립금
	int CoinScore_my(CoinVO coin);

	

	
}
