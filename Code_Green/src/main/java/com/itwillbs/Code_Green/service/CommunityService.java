package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.CommunityMapper;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.File_boardVO;
import com.itwillbs.Code_Green.vo.ReplyVO;
import com.itwillbs.Code_Green.vo.ReportVO;

@Service
public class CommunityService {
	
	@Autowired
	private CommunityMapper mapper;
	

	// 전체 글 목록 조회 
	public List<BoardVO> getCommunityList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectCommunityList(startRow, listLimit, searchType, keyword);
	}

	// 전체 글 목록 갯수 조회 
	public int getCommunityListCount(String searchType, String keyword) {
		return mapper.selectCommunityListCount(searchType, keyword);
	}

	// 게시글 조회수 증가 
	public void increaseReadcount(int board_idx) {
		mapper.updateReadcount(board_idx);
	}
	
	// 게시글 상세조회
	public BoardVO getBoardDetail(int board_idx) {
		return mapper.selectBoardDetail(board_idx);
	}

	// 게시글 삭제 
	public int removeBoard(int board_idx) {
		return mapper.deleteBoard(board_idx);
	}

	
	// 관리자에게 신고글 제출(신고테이블에 입력)
	public int reportBoard(ReportVO report) {
		return mapper.insertReport(report);
	}

	// 추천하기 테이블에 아이디존재유무 판단하기
	public int selectBoardBest(int rf_board_idx, String member_id) {
		return mapper.selectBoardBest(rf_board_idx,member_id);
	}
	
	// 추천하기 테이블에서 추천한 아이디 행 삭제하기 
	public int deleteBoardBest(int rf_board_idx, String member_id) {
		return mapper.deleteBoardBest(rf_board_idx,member_id);
	}
	
	// 추천하기 테이블에 추천아이디 행 추가하기 
	public int insertBoardBest(int rf_board_idx, String member_id) {
		return mapper.insertBoardBest(rf_board_idx,member_id);
	}
	
	// 추천 수 카운팅 
	public int countBoardBest(int rf_board_idx) {
		return mapper.countBoardBest(rf_board_idx);
	}
	
	// 댓글 수 카운팅 
	public int countReply(int reply_bo_ref) {
		return mapper.countReply(reply_bo_ref);
	}
	
	// 댓글 쓰기등록 (기본)
	public int writeReply(ReplyVO replyVO) {
		System.out.println(replyVO);
		 return mapper.insertReply(replyVO);
	}
	
	// 댓글 목록 출력
	public List<ReplyVO> replyList(int reply_bo_ref) {
		return mapper.selectReplyList(reply_bo_ref);
	}

	// 대댓글 순서번호(reply_re_seq) 조정
	public void increaseReplyReSeq(ReplyVO reply) {
		mapper.updateReplyReSeq(reply);
	}
	
	// 대댓글 쓰기등록
	public int writeReReply(ReplyVO reply) {
		return mapper.insertReReply(reply);
	}
	
	// 댓글 삭제 
	public int deleteReply(int reply_idx) {
		return mapper.deleteReply(reply_idx);
	}
	
	// 새글 작성(사진제외)
	public int writeCommunityBoard(BoardVO board) {
		return mapper.insertCommunityBoard(board);
	}
	
	// 새글 작성 - 파일업로드
	public int writeCommunityFile(File_boardVO fileBoard) {
		return mapper.insertCommunityFile(fileBoard);
	}

	// 글 수정폼 페이지에 글데이터 가져오기
	public BoardVO getBoard(BoardVO board) {
		return mapper.selectBoardModify(board);
	}
	
	// 커뮤니티 게시글 삭제 전 실제 파일명 조회 1  
	public String getRealFile1(int board_idx) {
		return mapper.selectRealFile1(board_idx);
	}

	// 커뮤니티 게시글 삭제 전 실제 파일명 조회 2 
	public String getRealFile2(int board_idx) {
		return mapper.selectRealFile2(board_idx);
	}
	
	// 커뮤니티 게시글 삭제 전 실제 파일명 조회 3 
	public String getRealFile3(int board_idx) {
		return mapper.selectRealFile3(board_idx);
	}

	// 커뮤니티 게시글 해당파일 삭제
	public int removeFile(int board_idx) {
		return mapper.deleteBoardFile(board_idx);
	}

	// 글 수정하기 -> 파일수정 
	public int modifyFile(File_boardVO fileBoard) {
		return mapper.updateFile(fileBoard);
	}

	// 글 수정하기 -> 글 수정 
	public int modifyBoard(BoardVO board) {
		return mapper.updateBoard(board);
	}
	

	

	


		
	

	
	
	
}
