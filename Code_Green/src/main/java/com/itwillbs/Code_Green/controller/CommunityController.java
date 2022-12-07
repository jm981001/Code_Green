package com.itwillbs.Code_Green.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.Code_Green.service.CommunityService;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.File_boardVO;
import com.itwillbs.Code_Green.vo.PageInfo;
import com.itwillbs.Code_Green.vo.ReplyVO;
import com.itwillbs.Code_Green.vo.ReportVO;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService service;
	
	
	
	//------------ 어서와 비건은 처음이지 페이지 -------------------------------------------
		@RequestMapping(value = "welcome_vegun", method = RequestMethod.GET)
		public String welcome_vegun() {
			return "community/welcome_vegun";
		}

		
		
	//------------ 커뮤니티 메인(커뮤니티 글목록) 페이지 -------------------------------------------
	@GetMapping(value = "/CommunityList.bo")	
	public String list(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum, Model model){
		// -------------------------------------------------------------------
		// 페이징 처리를 위한 계산 작업
		int listLimit = 15; // 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
		
		// Service 객체의 getBoardList() 메서드를 호출하여 게시물 목록 조회
		// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
		// => 리턴타입 : List<BoardVO>(communityList)
		List<BoardVO> communityList = service.getCommunityList(startRow, listLimit, searchType, keyword);
		// -------------------------------------------
		// Service 객체의 getBoardListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
		// => 파라미터 : 없음, 리턴타입 : int(listCount)
		int listCount = service.getCommunityListCount(searchType, keyword);
		
		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		// Math 클래스의 ceil() 메서드를 활용하여 소수점 올림 처리를 통해 전체 페이지 수 계산
		// => listCount / listLimit 를 실수 연산으로 수행하여 소수점까지 계산하고
		//    Math.ceil() 메서드를 통해 올림 처리 후 결과값을 정수로 변환
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		// 시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		// 끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;
		
		// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우 
		// 끝 페이지 번호를 최대 페이지 번호로 교체
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		// 게시물 목록(boardList) 과 페이징 처리 정보(pageInfo)를 Model 객체에 저장
		model.addAttribute("communityList", communityList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword",keyword);
		
		return "community/community_main";
	}
	
	
	
	
	//------------ 커뮤니티 글 상세보기 페이지 -------------------------------------------
	@GetMapping(value = "/CommunityDetail.bo")
	public String communityDetail(@RequestParam("board_idx") int board_idx,
								 @RequestParam("board_id") String board_id, Model model, HttpSession session) {
		String sId = "";
		if(session.getAttribute("sId")!=null) {
			sId = (String) session.getAttribute("sId");
		}
		// 게시물 조회수 증가
		if(!sId.equals(board_id) || sId.equals("")) {
			service.increaseReadcount(board_idx);
		}
		BoardVO cBoard = service.getBoardDetail(board_idx);
		model.addAttribute("cBoard", cBoard);
	
		return "community/community_detail";
	}
	
	//------------ 커뮤니티 새글 작성 폼 페이지 -------------------------------------------
	@GetMapping(value = "/CommunityWrite.bo")
	public String communityWrite() {
		return "community/community_write";
	}
	
	
	//------------ 커뮤니티 새글 작성 로직 -------------------------------------------
	@PostMapping(value = "/CommunityWritePro.bo")
	public String communityWritePro(@ModelAttribute BoardVO board,
									@ModelAttribute File_boardVO fileBoard, Model model, HttpSession session) {
		// 가상 업로드 경로에 대한 실제 업로드 경로 알아내기
		// => 단, request 객체에 getServletContext() 메서드 대신, session 객체로 동일한 작업 수행
		//    (request 객체에 해당 메서드 없음)
		String uploadDir = "/resources/commUpload"; // 가상의 업로드 경로
		// => webapp/resources 폴더 내에 upload 폴더 생성 필요
		String saveDir = session.getServletContext().getRealPath(uploadDir);
//		System.out.println("실제 업로드 경로 : " + saveDir);
		
		File f = new File(saveDir); // 실제 경로를 갖는 File 객체 생성
		// 만약, 해당 경로 상에 디렉토리(폴더)가 존재하지 않을 경우 생성
		if(!f.exists()) { // 해당 경로가 존재하지 않을 경우
			// 경로 상의 존재하지 않는 모든 경로 생성
			f.mkdirs();
		}
		
		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		// => 복수개의 파일이 각각 다른 name 속성으로 전달된 경우
		// => 각각의 MultipartFile 객체를 통해 getFile() 메서드 호출
//				MultipartFile mFile = board.getFile();
		MultipartFile mFile1 = fileBoard.getFile_1();
		MultipartFile mFile2 = fileBoard.getFile_2();
		MultipartFile mFile3 = fileBoard.getFile_3();
		
		String uuid = UUID.randomUUID().toString();

		String originalFileName1 = mFile1.getOriginalFilename();
		String originalFileName2 = mFile2.getOriginalFilename();
		String originalFileName3 = mFile3.getOriginalFilename();

		
		fileBoard.setFile1(uuid + "_" + originalFileName1);
		fileBoard.setFile2(uuid + "_" + originalFileName2);
		fileBoard.setFile3(uuid + "_" + originalFileName3);
// ========================================================

		int insertCount = service.writeCommunityBoard(board);
		int file_insertCount = service.writeCommunityFile(fileBoard);
		if(insertCount > 0) {
			if(file_insertCount > 0) {
				try {
						mFile1.transferTo(new File(saveDir, fileBoard.getFile1()));
						mFile2.transferTo(new File(saveDir, fileBoard.getFile2()));
						mFile3.transferTo(new File(saveDir, fileBoard.getFile3()));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				return "redirect:/CommunityList.bo";
			} else {
				model.addAttribute("msg", "파일 업로드 실패!");
				return "member/fail_back3";
			}
		} else {
			model.addAttribute("msg", "글 등록에 실패하였습니다. \n 다시한번 시도해주세요.");
			return "member/fail_back3";
		}
	} 
	
	
	
	//------------ 커뮤니티 글 수정 폼으로 가기(원글불러오기) ------------------------------------------- 
	@GetMapping(value = "/CommunityModify.bo")
	public String communityModify(@ModelAttribute BoardVO board, Model model) {
		BoardVO boardMove = service.getBoard(board);
		
		model.addAttribute("board", boardMove);
		
		return "community/community_modify";
	}
	
	//------------ 커뮤니티 글 수정 업데이트로직(새로덮어쓰기)------------------------------------------- 
	@PostMapping(value = "/CommunityModifyPro.bo")
	public String communityModifyPro(@ModelAttribute BoardVO board,
									 @ModelAttribute File_boardVO fileBoard, 
									 HttpSession session,
									 @RequestParam(defaultValue = "1") int pageNum,
									 Model model) {

		// 기존 실제파일명을 변수에 저장 ( 새파일 업로드시 삭제필요 )
		String oldRealFile1 = fileBoard.getFile1();
		String oldRealFile2 = fileBoard.getFile2();
		String oldRealFile3 = fileBoard.getFile3();
		
		
		String uploadDir = "/resources/commUpload";	// 가상의 업로드 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		File f = new File(saveDir); // 실제 경로를 갖는 File 객체 생성
		// 만약, 해당 경로 상에 디렉토리(폴더)가 존재하지 않을 경우 생성
		if(!f.exists()) { // 해당 경로가 존재하지 않을 경우
			// 경로 상의 존재하지 않는 모든 경로 생성
			f.mkdirs();
		}
		
		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		MultipartFile mFile1 = fileBoard.getFile_1();
		MultipartFile mFile2 = fileBoard.getFile_2();
		MultipartFile mFile3 = fileBoard.getFile_3();
		
		String uuid = UUID.randomUUID().toString();
		boolean isNewFile1 = false;
		if(!mFile1.getOriginalFilename().equals("")) {
			
			String originalFileName1 = mFile1.getOriginalFilename();
			fileBoard.setFile1(uuid + "_" + originalFileName1);
			isNewFile1 = true;
		}
		
		boolean isNewFile2 = false;
		if(!mFile2.getOriginalFilename().equals("")) {
			
			String originalFileName2 = mFile2.getOriginalFilename();
			fileBoard.setFile2(uuid + "_" + originalFileName2);
			isNewFile2 = true;
		}		

		boolean isNewFile3 = false;
		if(!mFile3.getOriginalFilename().equals("")) {
			
			String originalFileName3 = mFile3.getOriginalFilename();
			fileBoard.setFile3(uuid + "_" + originalFileName3);
			isNewFile3 = true;
		}		
		// ==================== 덮어쓰기 과정시작 =========================
		// 새 파일 선택 여부와 관계없이 공통으로 수정 작업 요청
		 	int updateFileCount = service.modifyFile(fileBoard);
			if(updateFileCount == 0) {
				
				model.addAttribute("msg","파일수정 실패");
				return "member/fail_back3";
				
			} else {
				if(isNewFile1) {
					try {
						mFile1.transferTo(new File(saveDir, fileBoard.getFile1()));
						File f1_1 = new File(saveDir, oldRealFile1); 
						if(f1_1.exists()) {
							f1_1.delete();
						}
						
					} catch (IllegalStateException e) {
						System.out.println("IllegalStateException");
						e.printStackTrace();
					} catch (IOException e) {
						System.out.println("IOException");
						e.printStackTrace();
					}
				}
				
				if(isNewFile2) {
					try {
						mFile2.transferTo(new File(saveDir, fileBoard.getFile2()));
						File f2_2 = new File(saveDir, oldRealFile2); 
						if(f2_2.exists()) {
							f2_2.delete();
						}
						
					} catch (IllegalStateException e) {
						System.out.println("IllegalStateException");
						e.printStackTrace();
					} catch (IOException e) {
						System.out.println("IOException");
						e.printStackTrace();
					}
				}
				
				if(isNewFile3) {
					try {
						mFile3.transferTo(new File(saveDir, fileBoard.getFile3()));
						File f3_3 = new File(saveDir, oldRealFile3); 
						if(f3_3.exists()) {
							f3_3.delete();
						}
					} catch (IllegalStateException e) {
						System.out.println("IllegalStateException");
						e.printStackTrace();
					} catch (IOException e) {
						System.out.println("IOException");
						e.printStackTrace();
					}
				}
			}
//		 }
		// ========================= 글 수정 ===============================
		
		int updateCount = service.modifyBoard(board);
		model.addAttribute("pageNum", pageNum);
		if(updateCount == 0) {
			model.addAttribute("msg", "글 수정 실패");
			return "member/fail_back3";
		}
		
		return "redirect:/CommunityDetail.bo?board_idx=" + board.getBoard_idx()+ "&board_id=" + board.getBoard_id();
	}
	
	//------------ 커뮤니티 글 삭제 페이지------------------------------------------- 
	@GetMapping(value = "/CommunityDelete.bo")
	public String communityDelete(@RequestParam int board_idx, Model model, HttpSession session,@RequestParam int pageNum) {
		
		//글 삭제 전 실제 업로드된 파일 삭제작업
		String realFile1 = service.getRealFile1(board_idx);
		String realFile2 = service.getRealFile2(board_idx);
		String realFile3 = service.getRealFile3(board_idx);
		
		int deleteCount = service.removeBoard(board_idx);
		int deleteFileCount = service.removeFile(board_idx);
		// ----------------------------------------------------------
		
		if(deleteCount > 0) {
			String uploadDir = "/resources/commUpload"; // 가상의 업로드 경로
			// => webapp/resources 폴더 내에 upload 폴더 생성 필요
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			
			if(realFile1!=null) {
				File f1 = new File(saveDir, realFile1); // 실제 경로를 갖는 File 객체 생성
				if(f1.exists()) { // 해당 경로에 파일이 존재할 경우
					f1.delete();
				}
			} 
			if(realFile2!=null) {
				File f2 = new File(saveDir, realFile2); // 실제 경로를 갖는 File 객체 생성
				if(f2.exists()) { // 해당 경로에 파일이 존재할 경우
					f2.delete();
				}
			}
			if(realFile3!=null) {
				File f3 = new File(saveDir, realFile3); // 실제 경로를 갖는 File 객체 생성
				if(f3.exists()) { // 해당 경로에 파일이 존재할 경우
					f3.delete();
				}
			}
			
			model.addAttribute("pageNum", pageNum);
			return "redirect:/CommunityList.bo?pageNum=" + pageNum;
			
		} else {
			model.addAttribute("msg", "글 삭제 실패!<br>다시 확인해주세요");
			return "member/fail_back3";
		}
		
	}
		
	
	//------------------- 커뮤니티 글 신고 기능 (신고테이블에 입력) ------------------------------------------- 
		
	@PostMapping(value = "/ReportBoard.re")	
	public String reportBoard(@ModelAttribute ReportVO report,Model model,
							  @RequestParam int pageNum,@RequestParam String board_id) {
		
		int reportCount = service.reportBoard(report);
		
		if(reportCount == 0) {
			
			model.addAttribute("msg", "신고글 제출 실패!<br>확인 후 다시 시도해주세요.");
			return "member/fail_back3";
			
		} else {
			
			return "redirect:/CommunityDetail.bo?board_idx=" + report.getBoard_idx() 
															 + "&pageNum=" + pageNum
															 + "&board_id=" + board_id;
		}
	}
	
		
	//-------------------------------- 추천하기 로직 수행------------------------------------------- 
	@ResponseBody
	@PostMapping("/BestCountUpdate.bo")
	public void bestCountUpdate(@RequestParam int rf_board_idx,@RequestParam String member_id, Model model, HttpServletResponse response) {
		
		// 가져온 아이디와 보드넘버로 board_best테이블에 존재유무 판단하기
		int existCount = service.selectBoardBest(rf_board_idx,member_id);
		String msg = "";

		
		if(existCount > 0) { // 판단해서 있으면 삭제하기
			int resultDeleteCount = service.deleteBoardBest(rf_board_idx,member_id);
			if(resultDeleteCount > 0) {
				msg = "추천이 취소되었습니다!";
			}
		} else {	// 판단해서 없으면 추가하기
			int resultInsertCount = service.insertBoardBest(rf_board_idx,member_id);
			if(resultInsertCount > 0) {
				msg = "추천했습니다!";
			}
		}
		
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(msg);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//-------------------------------- 추천수 카운팅 -------------------------------------------
	@ResponseBody
	@PostMapping("/BestCounting.bo")
	public int bestBoardCounting(int rf_board_idx) {
		
		int count = service.countBoardBest(rf_board_idx);
		return count;
	}
		
	//------------------------------- 댓글수 카운팅 -------------------------------------------
	@ResponseBody
	@PostMapping("/ReplyCounting.bo")
	public int ReplyCounting(int reply_bo_ref) {
		
		int rCount = service.countReply(reply_bo_ref);
		return rCount;
	}
	
	
	//-------------------------------- 댓글 작성 -------------------------------------------
	@ResponseBody
	@PostMapping("/ReplyWrite.re")
	public Map<String,Object> replyWrite(
			@RequestParam int reply_bo_ref, 
			@RequestParam String reply_id,
			@RequestParam String reply_content){
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		ReplyVO replyVO = new ReplyVO();
		replyVO.setReply_bo_ref(reply_bo_ref);
		replyVO.setReply_id(reply_id);
		replyVO.setReply_content(reply_content);
		int resultCount = service.writeReply(replyVO);
		
		if(resultCount > 0) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		
		return map;
	}
	
	//-------------------------------- 대댓글 작성 ----------------------------------------- 
	@ResponseBody
	@PostMapping("/reReplyWrite.re")
	public void reReplyWrite(@ModelAttribute ReplyVO reply, Model model) {
		
		// 순서번호(reply_re_seq) 조정 
		service.increaseReplyReSeq(reply);
		
		
		// 대댓글 등록
		int reResultCount = service.writeReReply(reply);
		
		String msg = "";
		if(reResultCount > 0) {
			msg += "답댓글작성 완료";
		} else {
			msg += "답댓글작성 실패";
		}
		
	}
	
	
	//-------------------------------- 댓글 전체 목록 출력 -------------------------------------------
	@ResponseBody
	@PostMapping("/ReplyList.re")
	public List<ReplyVO> replyList(@RequestParam int reply_bo_ref){
		
		List<ReplyVO> replyList = service.replyList(reply_bo_ref);
		return replyList;
	}
	
	//-------------------------------- 댓글 삭제 ------------------------------------------- 
	@ResponseBody
	@GetMapping("/replyDelete.re")
	public void deleteReply(@RequestParam int reply_idx) {
		
		int deleteReplyCount = service.deleteReply(reply_idx);
		String msg = "";
		if(deleteReplyCount > 0) {
			msg += "선택한 댓글이 삭제되었습니다.";
		} else {
			msg += "댓글삭제에 실패하였습니다.\n 다시시도해주세요.";
		}
		
	}
	
	
}
