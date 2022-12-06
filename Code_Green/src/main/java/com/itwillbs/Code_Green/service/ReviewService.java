package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.ReviewMapper;
import com.itwillbs.Code_Green.vo.BoardStarVO;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.CoinVO;
import com.itwillbs.Code_Green.vo.File_ItemVO;
import com.itwillbs.Code_Green.vo.File_boardVO;

@Service
public class ReviewService {
	@Autowired
	private ReviewMapper mapper;

	
	//리뷰 등록
	public int registReview(BoardVO board) {
		return mapper.insertReview(board);
	}

	//리뷰 삭제
	public int removeReview(int board_idx) {
		return mapper.deleteReview(board_idx);
	}

	//마이페이지 작성글 리스트 
	public List<BoardVO> boardList(int startRow, int listLimit, String member_id) {
		return  mapper.selectBoardList(startRow, listLimit, member_id);
	}

	//마이페이지 작성글 갯수
	public int getBoardListCount(String member_id) {
		return mapper.selectItemListCount(member_id);
	}

	//리뷰 파일업로드
	public int registReview_file(File_boardVO file) {
		return mapper.insertFile(file);
	}

	//별점 등록
	public int StarScore(BoardStarVO star) {
		return mapper.insertStar(star);
	}

	//리뷰 상세정보 조회
	public BoardVO getReview(int board_idx) {
		return mapper.selectReview(board_idx);
	}
	
	//리뷰 파일 상세정보 조회
	public File_boardVO getFile(int board_idx) {
		return mapper.selecFile(board_idx);
	}

	//리뷰 수정
	public int modifyReview(BoardVO board) {
		return mapper.updateReview(board);
	}

	//파일 수정
	public int modifyFile(File_boardVO file) {
		return mapper.updateFile(file);
	}

	// 삭제 전 실제 업로드 된 파일명 조회 작업 요청1
	public String getRealFile1(int board_idx) {
		return mapper.selectRealFile1(board_idx);
	}

	// 삭제 전 실제 업로드 된 파일명 조회 작업 요청1
	public String getRealFile2(int board_idx) {
		return mapper.selectRealFile2(board_idx);
	}

	//파일 삭제
	public int removeFile(int board_idx) {
		return mapper.deleteFile(board_idx);
	}

	//리뷰 상태 변경
	public void updateStatus(int sell_idx, int item_idx) {
		mapper.updateStatus(sell_idx,item_idx);
	}
	//리뷰작성시 적립금
	public int CoinScore(CoinVO coin) {
		return mapper.CoinScore(coin);
	}

	//리뷰게시판 리뷰 상태 변경
	public void reviewStatus(int item_idx, int sIdx) {
		mapper.reviewStatus(item_idx, sIdx);
	}

	//마이페이지 후기 적립금
	public int CoinScore_my(CoinVO coin) {
		return mapper.CoinScore_my(coin);
	}





}
