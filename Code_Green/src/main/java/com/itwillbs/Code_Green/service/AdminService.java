package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.AdminMapper;
import com.itwillbs.Code_Green.vo.AdminVO;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.MemberVO;
import com.itwillbs.Code_Green.vo.QnaVO;
import com.itwillbs.Code_Green.vo.ReportVO;
import com.itwillbs.Code_Green.vo.SellVO;
import com.itwillbs.Code_Green.vo.TotalVO;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;

	public AdminVO loginAdmin(AdminVO admin) {
		return mapper.loginAdmin(admin);
	}
	
	//----------------------
	
	//총매출
	public SellVO getTotalMoney() {
		return mapper.selectTotalMoney(); 
	}
	//총주문수
	public int getTotalsellCount() {
		return mapper.selectTotalsellCount();
	}
	
	//주문취소건수
	public int getCancelCount() {
		return mapper.selectCancelCount();
	}
	
	//매출 3순위
	public List<ManagerVO> getTopSale() {
		return mapper.selectTopSaleList();
	}
	
	//매출 랭킹
	public List<ManagerVO> getRanking() {
		return mapper.selectRanking();
	}
	
	//기업 별점 순위
	public List<ManagerVO> getStarRanking() {
		return mapper.selectStarRankingList();
	}
	//기업 팔로워 순위
	public List<ManagerVO> getFollowerRanking() {
		return mapper.selectFollowerRankingList();
	}

	//----------------------
	
	
	//전체 회원목록 조회
	public List<MemberVO> getMemberList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectMemberList(startRow, listLimit, searchType, keyword);
	}

	//회원 상세정보 조회(1개)
	public MemberVO memberInfo(String id) {
		return mapper.selectMemberInfo(id);
	}

	//회원 수정
	public int modifyMember(MemberVO member, String newName, String id) {
		return mapper.updateMemberInfo(member,newName, id);
	}
	
	//회원 삭제
	public int removeMember(String id) {
		return mapper.deleteMember(id);
	}
	
	//회원관리 검색기능
	public int getMemberListCount(String searchType, String keyword) {
		return mapper.selectMemberListCount(searchType, keyword);
	}
	
	
	
	//기업관리 기업관리 기업관리 기업관리 기업관리 기업관리 기업관리 기업관리 기업관리 기업관리 기업관리 기업관리 기업관리 기업관리 기업관리 기업관리 기업관리 기업관리 
	
	
	
	//기업관리(승인완료) 검색기능
	public int getManagerListCount(String searchType, String keyword) {
		return mapper.selectManagerListCount(searchType, keyword);
	}
	

	//기업목록 조회(승인완료)
	public List<ManagerVO> getManagerList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectManagerList(startRow, listLimit, searchType, keyword);
	}
	
	//기업관리(미승인) 검색기능
	public int getAuthListCount(String searchType, String keyword) {
		return mapper.selectAuthListCount(searchType, keyword);
	}
	
	//기업 가입 승인
	public int updateAuth(ManagerVO manager) {
		return mapper.updateAdminAuth(manager);
	}
	
	//기업목록 조회(미승인)
	public List<ManagerVO> getManagerAuthList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectManagerAuthList(startRow, listLimit, searchType, keyword);
	}
	
	//기업 상세정보 조회(1개)
	public ManagerVO getManagerInfo(String id) {
		return mapper.selectManagerInfo(id);
	}
	
	//기업 삭제(1개)
	public int removeManager(String id) {
		return mapper.deleteManager(id);
	}
	
	
	
	
	
	//문의글 관리 문의글 관리 문의글 관리 문의글 관리 문의글 관리 문의글 관리 문의글 관리 문의글 관리 문의글 관리 문의글 관리 문의글 관리 문의글 관리 문의글 관리 문의글 관리
	
	
	
	
	//1:1문의(답변대기) 갯수 조회
	public int getOneListCount(String searchType, String keyword) {
		return mapper.selectOneListCount(searchType, keyword);
	}
	
	//1:1문의(답변대기) 목록 조회
	public List<QnaVO> getOneQnaBoardList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectOneQnaList(startRow, listLimit, searchType, keyword);
	}
	
	//1:1문의 답변 등록
	public int registAnswer(QnaVO qna) {
		return mapper.updateAnswer(qna);
	}
	
	//1:1문의 답변 상태변경 
		public int changeQnaStatus(QnaVO qna) {
			return mapper.updateQnaStatus(qna);
		} 
	
	//1:1문의(답변완료) 갯수
	public int getOneQnaAnswerCount(String searchType, String keyword) {
		return mapper.selectOneAnswerListCount(searchType, keyword);
	}
	
	//1:1문의(답변완료) 목록 조회
	public List<QnaVO> getOneQnaAnswerList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectOneQnaAnswerList(startRow, listLimit, searchType, keyword);
	}
	
	
	//1:1게시글 상세정보 조회(1개)
	public QnaVO getOneQnaInfo(int qna_idx, String id) {
		return mapper.selectOneQnaInFo(qna_idx, id);
	}

	
	//1:1 게시글 삭제
	public int removeOneQnaRemove(int idx, String id) {
		return mapper.deleteOneQnaBoard(idx, id);
	}


	
	
	//게시글 관리(커뮤,레시피 등) 게시글 관리(커뮤,레시피 등) 게시글 관리(커뮤,레시피 등) 게시글 관리(커뮤,레시피 등) 게시글 관리(커뮤,레시피 등) 게시글 관리(커뮤,레시피 등)
	
	//커뮤니티 갯수
	public int getBoardListCount(String searchType, String keyword) {
		return mapper.selectBoardListCount(searchType, keyword);
	}
	
	//커뮤니티 목록
	public List<BoardVO> getBoardList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectBoardList(startRow, listLimit, searchType, keyword);
	}
	
	//커뮤니티 게시글 상세조회
	public BoardVO getCommuDetail(int board_idx) {
		return mapper.selectCommuDetail(board_idx);
	}

	//후기게시판 갯수 조회 | 검색
	public int getReviewListCount(String searchType, String keyword) {
		return mapper.selectReviewListCount(searchType, keyword);
	}
	
	//후기 게시판 목록
	public List<BoardVO> getReviewList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectReviewList(startRow, listLimit, searchType, keyword);
	}
	
	//후기 게시글 상세조회
	public BoardVO getReviewDetail(int board_idx) {
		return mapper.selectReviewDetail(board_idx);
	}
	
	//레시피 목록 조회
	public List<BoardVO> getRecipeList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectRecipeList(startRow, listLimit, searchType, keyword);
	}
	
	
	//레시피 목록 갯수 조회
	public int getRecipeListCount(String searchType, String keyword) {
		return mapper.selectRecipeListCount(searchType, keyword);
	}
	
	//레시피 상세 조회
	public BoardVO getRecipeDetail(String board_idx) {
		return mapper.selectRecipeDetail(board_idx);
	}
	
	//게시판 글 삭제
	public int removeBoard(int board_idx) {
		return mapper.deleteBoard(board_idx);
	}
	
	
	
	// 신고글 관리 신고글 관리 신고글 관리 신고글 관리 신고글 관리 신고글 관리 신고글 관리 신고글 관리 신고글 관리 신고글 관리 신고글 관리 신고글 관리 신고글 관리 신고글 관리 신고글 관리
	
	
	
	//신고글(처리대기) 갯수 조회
	public int getReportListCount(String searchType, String keyword) {
		return mapper.selectReportListCount(searchType, keyword);
	}

	
	//신고글 목록(처리대기)
	public List<ReportVO> getReportList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectReportList(startRow, listLimit, searchType, keyword);
	}

	//신고글(처리완료) 갯수 조회
	public int getReportSuccessListCount(String searchType, String keyword) {
		return mapper.selectReportSuccessListCount(searchType, keyword);
	}
	
	
	//신고글 목록 조회(처리완료)
	public List<ReportVO> getReportSuccessList(int startRow, int listLimit, String searchType, String keyword) {
		return mapper.selectReportSuccessList(startRow, listLimit, searchType, keyword);
	}
	
	
	//신고글 상세조회(reporter)
	public ReportVO getReportInfo(int report_idx) {
		return mapper.selectReportInfo(report_idx);
	}
	
	
	//신고된 원본글 상세조회
	public BoardVO getOriginBoard(int report_idx) {
		return mapper.selectOriginBoard(report_idx);
	}
	
	//신고글 삭제
	public int removeReportBoard(int report_idx) {
		return mapper.deleteReport(report_idx);
	}
	
	//신고글 상태 변경(처리대기 => 처리완료)
	public int changeStatus(int board_idx, ReportVO report) {
		return mapper.updateReportStatus(board_idx, report);
	}
	
	//신고글 처리반려 요청
	public int changeReportStatus(int report_idx) {
		return mapper.updateReportReturn(report_idx);
	}
	
	
	
	//공지글 관리 공지글 관리 공지글 관리 공지글 관리 공지글 관리 공지글 관리 공지글 관리 공지글 관리 공지글 관리 공지글 관리 공지글 관리 공지글 관리 공지글 관리 공지글 관리
	
	
	//공지 목록 조회
	public List<BoardVO> getNoticeList(int startRow, int listLimit) {
		return mapper.selectNoticeList(startRow, listLimit);
	}
	//공지 갯수 조회
	public int getNoticeListCount() {
		return mapper.selectNoticeListCount();
	}
	//공지 상세 조회
	public BoardVO getNoticeDetail(int board_idx) {
		return mapper.selectNoticeDetail(board_idx);
	}
	//공지 등록
	public int registNotice(BoardVO board) {
		return mapper.insertNotice(board);
	}
	//공지 삭제
	public int removeNotice(String idx) {
		return mapper.deleteNotice(idx);
	}
	//공지 수정
	public int modifyNotice(BoardVO board) {
		return mapper.updateNotice(board);
	}
	
	//결제취소목록 결제취소목록 결제취소목록 결제취소목록 결제취소목록 결제취소목록 결제취소목록 결제취소목록 결제취소목록 결제취소목록 결제취소목록 결제취소목록
	
	//결제취소요청 목록
	public List<SellVO> getCancelRequestList() {
		return mapper.selectCancelRequestList();
	}
	//결제취소승인 목록
	public List<SellVO> getCancelSuccessList() {
		return mapper.selectCancelSuccessList();
	}
	
	//결제취소요청승인
	public int changeCancelStatus(int sell_idx) {
		return mapper.updateStatusApproval(sell_idx);
	}
	
	
	
	
	
	
	
	
	

	



	

	
	
	
	

	
	
}
