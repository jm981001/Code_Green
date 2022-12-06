package com.itwillbs.Code_Green.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.Code_Green.service.ReviewService;
import com.itwillbs.Code_Green.vo.BoardStarVO;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.CoinVO;
import com.itwillbs.Code_Green.vo.File_boardVO;
import com.itwillbs.Code_Green.vo.QnaVO;
import com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService service; 
	
	//------------리뷰작성-------------------------------------------
	@PostMapping(value = "/ReviewWritePro.bo")
	public String reviewWritePro( @ModelAttribute BoardVO board,@ModelAttribute File_boardVO file, Model model,int item_idx , HttpSession session, @ModelAttribute BoardStarVO star
								 ,@RequestParam String item_category,@RequestParam String manager_brandname, @ModelAttribute CoinVO coin) {
//		@RequestParam String board_idx
		int sIdx = (int)session.getAttribute("sIdx");
		
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
		MultipartFile mFile = file.getFile_1();
		MultipartFile mFile2 = file.getFile_2();
		
		String originalFileName = mFile.getOriginalFilename();
		String originalFileName2 = mFile2.getOriginalFilename();
		String uuid = UUID.randomUUID().toString();
//		System.out.println("업로드 될 파일명 : " + uuid + "_" + originalFileName);
		
		file.setFile1(uuid + "1_" + originalFileName);
		file.setFile2(uuid + "2_" + originalFileName2);
		
		int insertCount = service.registReview(board);
		int file_insertCount = service.registReview_file(file);
		int starCount= service.StarScore(star);
		
		
		service.reviewStatus(item_idx, sIdx);//리뷰 상태 변경
		
		model.addAttribute("item_idx", item_idx);
		model.addAttribute("item_category", item_category);
		model.addAttribute("manager_brandname", manager_brandname);

		
		
		if(insertCount > 0) {
			int coinCount= service.CoinScore(coin);
			model.addAttribute("coinCount", coinCount);
			if(file_insertCount > 0) {
				try {
					mFile.transferTo(new File(saveDir, file.getFile1()));
					mFile2.transferTo(new File(saveDir, file.getFile2()));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				return "redirect:/ItemDetail.bo";
			} else {
				model.addAttribute("msg", "파일업로드 실패!");
				return "member/fail_back";
			}
		}else {
			model.addAttribute("msg", "글 쓰기 실패!");
			return "member/fail_back";
		}
		
	}	
	
	
	//------------마이페이지 리뷰작성-------------------------------------------
	@PostMapping(value = "/ReviewWritePro.my")
	public String reviewWritePro_my( @ModelAttribute BoardVO board,@ModelAttribute File_boardVO file, Model model,int item_idx , HttpSession session, @ModelAttribute BoardStarVO star
								 ,@RequestParam String item_category,@RequestParam String manager_brandname,@RequestParam int sell_idx, @RequestParam String member_id,@ModelAttribute CoinVO coin) {
//		@RequestParam String board_idx
		
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
		MultipartFile mFile = file.getFile_1();
		MultipartFile mFile2 = file.getFile_2();
		
		String originalFileName = mFile.getOriginalFilename();
		String originalFileName2 = mFile2.getOriginalFilename();
		String uuid = UUID.randomUUID().toString();
//		System.out.println("업로드 될 파일명 : " + uuid + "_" + originalFileName);
		
		file.setFile1(uuid + "1_" + originalFileName);
		file.setFile2(uuid + "2_" + originalFileName2);
		
		int insertCount = service.registReview(board);
		int file_insertCount = service.registReview_file(file);
		int starCount= service.StarScore(star);
		
	    service.updateStatus(sell_idx,item_idx);//리뷰 상태 변경
	    
		model.addAttribute("item_idx", item_idx);
		model.addAttribute("item_category", item_category);
		model.addAttribute("manager_brandname", manager_brandname);
		model.addAttribute("member_id", member_id);

		
		
		if(insertCount > 0) {
			int coinCount= service.CoinScore_my(coin);//마이페이지 후기 적립금
			if(file_insertCount > 0) {
				try {
					mFile.transferTo(new File(saveDir, file.getFile1()));
					mFile2.transferTo(new File(saveDir, file.getFile2()));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				return "redirect:/myPageReview.my";
			} else {
				model.addAttribute("msg", "파일업로드 실패!");
				return "member/fail_back";
			}
		}else {
			model.addAttribute("msg", "글 쓰기 실패!");
			return "member/fail_back";
		}
		
		
	}	
	
	//------------리뷰 수정-------------------------------------------
	@GetMapping(value = "/ReviewModify.bo")
	public String reveiw_modify(@RequestParam int board_idx, Model model, String item_idx,
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam String item_category,@RequestParam String manager_brandname) {

		//리뷰 상세정보 조회
		BoardVO board = service.getReview(board_idx);
		model.addAttribute("board",board);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("manager_brandname",manager_brandname);
		model.addAttribute("item_category",item_category);
		
		return "item/review_modify";
	}
	
	@PostMapping(value = "/ReviewModifyPro.bo")
	public String modifyPro( @ModelAttribute BoardVO board,@ModelAttribute File_boardVO file,@RequestParam int board_idx, Model model, String item_idx,
			@RequestParam(defaultValue = "1") int pageNum,HttpSession session,
			@RequestParam String item_category,@RequestParam String manager_brandname) {
		//기존 실제 파일명을 변수에 저장 (새 파일 업로드시 삭제하기 위함)
		String oldRealFile1 = file.getFile1();
		String oldRealFile2 = file.getFile2();
		
		
		
		String uploadDir = "/resources/commUpload"; // 가상의 업로드 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		

		File f = new File(saveDir); // 실제 경로를 갖는 File 객체 생성
		// 만약, 해당 경로 상에 디렉토리(폴더)가 존재하지 않을 경우 생성
		if(!f.exists()) { // 해당 경로가 존재하지 않을 경우
			// 경로 상의 존재하지 않는 모든 경로 생성
			f.mkdirs();
		}
		
		MultipartFile mFile = file.getFile_1();
		MultipartFile mFile2 = file.getFile_2();
		

		boolean isNewFile1 = false;
		if(!mFile.getOriginalFilename().equals("")) {
			
			String originalFileName = mFile.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			file.setFile1(uuid + "1_" + originalFileName);
			
			isNewFile1 = true;
		}
		
		boolean isNewFile2 = false;
		if(!mFile2.getOriginalFilename().equals("")) {
			
			String originalFileName2 = mFile2.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			file.setFile2(uuid + "2_" + originalFileName2);
			
			isNewFile2 = true;
		}
		
		
		
		//------------파일 수정-------------------------------------------
		int updateFile = service.modifyFile(file);
		
		if(updateFile== 0) {
			model.addAttribute("msg", "파일수정 실패!");
			return "member/fail_back";
		} else { 
			if( isNewFile1) { 
				try {
					mFile.transferTo(new File(saveDir, file.getFile1()));
					
					File f2 = new File(saveDir, oldRealFile1); 
					if(f2.exists()) {
						f2.delete();
					}
				} catch (IllegalStateException e) {
					System.out.println("IllegalStateException");
					e.printStackTrace();
				} catch (IOException e) {
					System.out.println("IOException");
					e.printStackTrace();
				}
			}
			if( isNewFile2) {
				try {
					mFile2.transferTo(new File(saveDir, file.getFile2()));
					
					File f3 = new File(saveDir, oldRealFile2); 
					System.out.println("File f3 = new File(saveDir, oldRealFile2); -> "+ f3);
					if(f3.exists()) {
						f3.delete();
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
		
		//리뷰 글수정
		int updateCount = service.modifyReview(board);
		model.addAttribute("item_idx", item_idx);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("manager_brandname",manager_brandname);
		model.addAttribute("item_category",item_category);


		if(updateCount == 0) {
			model.addAttribute("msg", "수정 실패!");
			return "member/fail_back";
		}
		
		return "redirect:/ItemDetail.bo" ;
	}
	
	
	//------------리뷰 삭제-------------------------------------------
	@GetMapping(value = "/ReviewDelete.bo")
	public String deletePro(@ModelAttribute BoardVO board, @RequestParam int board_idx, Model model, HttpSession session,@RequestParam String item_idx
			,@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam String item_category,@RequestParam String manager_brandname) {
			
		//글 삭제 전 실제 업로드된 파일 삭제작업
		String realFile1 = service.getRealFile1(board_idx);
		String realFile2 = service.getRealFile2(board_idx);
		
		int deleteFileCount = service.removeFile(board_idx);
		int deleteCount = service.removeReview(board_idx);
		
		System.out.println("deleteFileCount 갯수 -> "+deleteFileCount);
		
		model.addAttribute("item_idx", item_idx);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("manager_brandname",manager_brandname);
		model.addAttribute("item_category",item_category);
		
		
		if(deleteCount > 0) {
			String uploadDir = "/resources/commUpload"; // 가상의 업로드 경로
			// => webapp/resources 폴더 내에 upload 폴더 생성 필요
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			System.out.println("실제 업로드 경로 : " + saveDir);
			
			File f1 = new File(saveDir, realFile1); // 실제 경로를 갖는 File 객체 생성
			File f2 = new File(saveDir, realFile2);
			System.out.println("삭제될것인가...!!"+f1);
				
			if(f1.exists()) { // 해당 경로에 파일이 존재할 경우
					f1.delete();
			}
			if(f2.exists()) { // 해당 경로에 파일이 존재할 경우
				f2.delete();
			}
			
			return "redirect:/ItemDetail.bo";
//				return "redirect:/ItemList.bo?";
		}
		return "member/fail_back";
	}	
	


	
	
	
	
	
	
	
}
