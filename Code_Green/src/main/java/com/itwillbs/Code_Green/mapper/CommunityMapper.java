package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.File_boardVO;
import com.itwillbs.Code_Green.vo.ReplyVO;
import com.itwillbs.Code_Green.vo.ReportVO;

public interface CommunityMapper {

	
	// 전체 글 목록 조회
	List<BoardVO> selectCommunityList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword);

	// 전체 글 목록 갯수 조회 
	int selectCommunityListCount(
			@Param("searchType") String searchType, @Param("keyword") String keyword);

	// 게시글 조회수 증가 
	void updateReadcount(int board_idx);

	// 게시글 상세조회
	BoardVO selectBoardDetail(int board_idx);
	
	// 게시글 삭제 
	int deleteBoard(int board_idx);

	// 신고하기 (신고테이블에 입력하기)
	int insertReport(ReportVO report);

	// 추천버튼 클릭시 아이디존재여부 판단하기 
	int selectBoardBest(@Param("rf_board_idx") int rf_board_idx, @Param("member_id") String member_id);

	// 추천하기 테이블에서 추천한 아이디 행 삭제하기 
	int deleteBoardBest(@Param("rf_board_idx") int rf_board_idx, @Param("member_id") String member_id);

	// 추천하기 테이블에 추천아이디 행 추가하기 
	int insertBoardBest(@Param("rf_board_idx") int rf_board_idx, @Param("member_id") String member_id);
	
	// 추천수 카운팅 
	int countBoardBest(int rf_board_idx);

	// 댓글 수 카운팅
	int countReply(int reply_bo_ref);
	
	// 댓글 쓰기 (기본)
	int insertReply(ReplyVO replyVO);

	// 댓글 목록 출력
	List<ReplyVO> selectReplyList(int reply_bo_ref);
	
	// 대댓글 순서번호 조정(reply_re_seq)
	void updateReplyReSeq(ReplyVO reply);
	
	// 대댓글 쓰기
	int insertReReply(ReplyVO reply);
	
	// 댓글 삭제
	int deleteReply(int reply_idx);

	// 새글 작성 - 텍스트 (사진제외)
	int insertCommunityBoard(BoardVO board);
	
	// 새글작성 - 파일업로드 
	int insertCommunityFile(File_boardVO fileBoard);

	// 글 수정폼 페이지에 글데이터 가져오기
	BoardVO selectBoardModify(BoardVO board);

	
	// 커뮤니티 게시글 삭제 전 실제 파일명 조회 1  
	String selectRealFile1(int board_idx);

	// 커뮤니티 게시글 삭제 전 실제 파일명 조회 2 
	String selectRealFile2(int board_idx);

	// 커뮤니티 게시글 삭제 전 실제 파일명 조회 3 
	String selectRealFile3(int board_idx);
	
	// 커뮤니티 게시글 해당파일 삭제
	int deleteBoardFile(int board_idx);

	// 글 수정하기 -> 파일수정 
	int updateFile(File_boardVO fileBoard);

	// 글 수정하기 -> 글수정
	int updateBoard(BoardVO board);

	


	
	
	
	
	
}
