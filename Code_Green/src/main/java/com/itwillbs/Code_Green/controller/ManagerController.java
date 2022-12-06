package com.itwillbs.Code_Green.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.xml.ws.ServiceMode;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.Code_Green.service.ManagerService;
import com.itwillbs.Code_Green.service.RecipeService;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.File_ItemVO;
import com.itwillbs.Code_Green.vo.File_boardVO;
import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.MemberVO;
import com.itwillbs.Code_Green.vo.PageInfo;
import com.itwillbs.Code_Green.vo.QnaVO;
import com.itwillbs.Code_Green.vo.SellVO;

@Controller
public class ManagerController {

	@Autowired
	private ManagerService service;
	@Autowired
	private RecipeService recipe_service;
	private Object item_idx;

	@PostMapping(value = "/ManagerLoginPro.me")
	public String managerloginPro(@ModelAttribute ManagerVO manager, Model model, HttpSession session,
			String manager_id) {

		ManagerVO selectManager = service.getManagerInfo(manager_id);
//		System.out.println(selectManager);

		// ------------------ BCryptPasswordEncoder 활용한 로그인 판별 ----------------------
		// 1. BCryptPasswordEncoder 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		// 2. member 테이블에서 id 에 해당하는 패스워드 조회 후 리턴값 저장(getPasswd())
		// => 파라미터 : 아이디 리턴타입 : String(passwd)
		String passwd = service.getPasswd(manager.getManager_id());
//				System.out.println(passwd);

		// 3. 조회 결과를 활용하여 로그인 성공 여부 판별
		// 1) 아이디가 없을 경우(passwd 값이 null) 실패
		// 2) 패스워드 비교(BCryptPasswordEncoder 객체의 matches() 메서드 활용)
		// 2-1) 다를 경우 실패
		// 2-2) 같을 경우 성공

		if (passwd == null || !encoder.matches(manager.getManager_pass(), passwd)) {
			model.addAttribute("msg", "기업 로그인 실패! 힝~");
//			System.out.println(manager.getManager_id() + ", " + manager.getManager_pass());
			return "member/fail_back";
		} else {
			session.setAttribute("sId", manager.getManager_id());
			if (selectManager.getManager_storecode() != null) {
				session.setAttribute("sCode", selectManager.getManager_storecode());
			}
			return "redirect:/";
		}

	}

	// 아이디 중복
	@ResponseBody
	@PostMapping(value = "idCheckM")
	public int idCheckM(@RequestParam("manager_id") String manager_id, @ModelAttribute ManagerVO manager) {
		int managerCheck = service.idCheck(manager_id);
//		System.out.println("managerCheck"+managerCheck);

		return managerCheck;
	}

	// 메일 중복체크
	@ResponseBody
	@PostMapping(value = "mailCheckM")
	public int mailCheckM(@RequestParam("manager_email") String manager_email, @ModelAttribute ManagerVO manager) {
		int mailCheckM = service.mailCheck(manager_email);

		return mailCheckM;
	}

	// 회원 가입
	@PostMapping(value = "/ManagerJoinPro.me")
	public String joinManagerPro(@ModelAttribute ManagerVO manager, Model model, HttpSession session) {

		// ------------------ BCryptPasswordEncoder 활용한 해싱 ----------------------

		// 1. BCryptPasswordEncoder 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		// 2. BCryptPasswordEncoder 객체의 encode() 메서드를 호출하여 해싱 결과 리턴
		String securePasswd = encoder.encode(manager.getManager_pass());
		// 3. MemberVO 객체의 패스워드에 암호문 저장
		manager.setManager_pass(securePasswd);

		String uploadDir = "/resources/brand_logo"; // 가상의 업로드 경로
		// => webapp/resources 폴더 내에 upload 폴더 생성 필요
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		System.out.println("실제 업로드 경로 : " + saveDir);

		File f = new File(saveDir); // 실제 경로를 갖는 File 객체 생성
		// 만약, 해당 경로 상에 디렉토리(폴더)가 존재하지 않을 경우 생성
		if (!f.exists()) { // 해당 경로가 존재하지 않을 경우
			// 경로 상의 존재하지 않는 모든 경로 생성
			f.mkdirs();
		}

		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		MultipartFile mFile = manager.getFile();

		String originalFileName = mFile.getOriginalFilename();
		long fileSize = mFile.getSize();
		System.out.println("파일명 : " + originalFileName);
		System.out.println("파일크기 : " + fileSize + " Byte");

		// 파일명 중복 방지를 위한 대책
		// 시스템에서 랜덤ID 값을 추출하여 파일명 앞에 붙여 "랜덤ID값_파일명" 형식으로 설정
		// 랜덤ID 는 UUID 클래스 활용(UUID : 범용 고유 식별자)
		String uuid = UUID.randomUUID().toString();
		System.out.println("업로드 될 파일명 : " + uuid + "_" + originalFileName);

		// BoardVO 객체에 원본 파일명과 업로드 될 파일명 저장
		// => 단, uuid 를 결합한 파일명을 사용할 경우 원본 파일명과 실제 파일명을 구분할 필요 없이
		// 하나의 컬럼에 저장해두고, 원본 파일명이 필요할 경우 "_" 를 구분자로 지정하여
		// 문자열을 분리하면 두번째 파라미터가 원본 파일명이 된다!
		manager.setManager_realfile(originalFileName); // 실제로는 불필요한 컬럼
		manager.setManager_original_file(uuid + "_" + originalFileName);

		int insertCount = service.joinManager(manager);

		if (insertCount > 0) { // 가입 성공
			System.out.println("가입 성공!");
			return "redirect:/join_result";
		} else { // 가입 실패
			model.addAttribute("msg", "가입 실패!");
			return "member/fail_back";
		}
	}

	// ------------매니저페이지 메인(로그인시 각 브랜드별
	// 페이지)-------------------------------------------
	@GetMapping(value = "/ManagerInfo.me")
	public String getManagerInfo(@RequestParam String manager_id, Model model, HttpSession session) {
		// 세션 아이디 가져와서 sId 변수에 저장
		String sId = (String) session.getAttribute("sId");
		System.out.println(manager_id + ", " + sId);
		if (manager_id == null || sId == null || manager_id.equals("")
				|| (!manager_id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "member/fail_back";

		} else {
			ManagerVO Manager = service.getManagerInfo(manager_id);
			; // 파라미터는 검색할 아이디 전달

			System.out.println(Manager);
			model.addAttribute("manager", Manager);

		}

		// 매출 3순위
		List<ItemVO> top3 = service.getTop3(sId);
		model.addAttribute("top3", top3);

		// 총매출 ,주문수
		ManagerVO orderTotal = service.getOrderTotal(sId);
		model.addAttribute("orderTotal", orderTotal);

		// 팔로우 수
		int follow = service.follow(sId);
		model.addAttribute("follow", follow);

		return "manager/index";

	}

	// ------------내 브랜드 정보조회-------------------------------------------

	@GetMapping(value = "brand_mypage")
	public String brand_mypage(@RequestParam String manager_id, Model model, HttpSession session) {

		String sId = (String) session.getAttribute("sId");
		System.out.println("sId : " + sId);

		ManagerVO brandInfo = service.getBrandInfo(sId);
		System.out.println(brandInfo);

		model.addAttribute("brandInfo", brandInfo);
		System.out.println();

		return "manager/brand_mypage";

	}

	// ------------내 브랜드 정보 수정----------------------------
	@PostMapping(value = "brand_mypage_modify")
	public String modifyManager(@ModelAttribute ManagerVO manager, Model model, HttpSession session) {

		String sId = (String) session.getAttribute("sId");
		System.out.println("sId : " + sId);

		ManagerVO brandInfo = service.getBrandInfo(sId);
		model.addAttribute("brandInfo", brandInfo);

		return "manager/brand_mypage_modify";
	}

	// ------------내 브랜드 정보 수정 업데이트(브랜드 로고 파일도 같이수정)----------------------------

	@PostMapping(value = "brand_mypage_modifyPro.bo")
	public String modifyManagerPro(@ModelAttribute ManagerVO manager, Model model, HttpSession session) {

		// 선택된 수정 업로드 파일명과 기존 파일명 출력
		System.out.println("기존 파일명 : " + manager.getManager_realfile());
		System.out.println("기존 실제 파일명 : " + manager.getManager_original_file());
		System.out.println("새 파일 객체 : " + manager.getFile());
		System.out.println("새 파일명 : " + manager.getFile().getOriginalFilename());

		// 기존 실제파일명을 변수에 저장 ( 새파일 업로드시 삭제필요 )
		String oldRealFile = manager.getManager_original_file();

		String uploadDir = "/resources/bmnUpload"; // 가상의 업로드 경로
		// => webapp/resources 폴더 내에 bmnUpload 폴더 생성 필요
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		System.out.println("실제 업로드 경로 : " + saveDir);

		File f = new File(saveDir); // 실제 경로를 갖는 File 객체 생성
		// 만약, 해당 경로 상에 디렉토리(폴더)가 존재하지 않을 경우 생성
		if (!f.exists()) { // 해당 경로가 존재하지 않을 경우
			// 경로 상의 존재하지 않는 모든 경로 생성
			f.mkdirs();
		}
		// ManagerVO 객체에 전달된 MultipartFile 객체 꺼내기
		MultipartFile mFile = manager.getFile();

		// 새 파일 업로드 여부와 관계없이 무조건 파일명을 가져와서 BoardVO 객체에 저장
		String originalFileName = mFile.getOriginalFilename();
		long fileSize = mFile.getSize();
		System.out.println("파일명 : " + originalFileName);
		System.out.println("파일크기 : " + fileSize + " Byte");

		String uuid = UUID.randomUUID().toString();
		System.out.println("업로드 될 파일명 : " + uuid + "_" + originalFileName);

		manager.setManager_realfile(originalFileName);
		manager.setManager_original_file(uuid + "_" + originalFileName);

		// 새 파일 선택 여부와 관계없이 공통으로 수정 작업 요청
		// Service - modifyBoard() 메서드 호출하여 수정 작업 요청
		// => 파라미터 : BoardVO 객체, 리턴타입 : int(updateCount)
		int updateCount = service.modifyManager(manager);

		// 수정 실패 시 "수정 실패!" 메세지 저장 후 mn_fail_back.jsp 페이지로 포워딩

		if (updateCount == 0) { // 수정 실패 시
			// 임시 폴더에 업로드 파일이 저장되어 있으며
			// transferTo() 메서드를 호출하지 않으면 임시 폴더의 파일은 자동 삭제됨
			model.addAttribute("msg", "수정 실패!");
			return "manager/mn_fail_back";
		} else { // 수정 성공 시
			// 수정 작업 성공 시 새 파일이 존재할 경우에만 실제 폴더 위치에 파일 업로드 수행
			// => 임시 폴더에 있는 업로드 파일을 실제 업로드 경로로 이동
			// => 새 파일 존재 여부는 업로드 할 파일명이 널스트링("") 이 아닌 것으로 판별
			if (!originalFileName.equals("")) {
				try {
					mFile.transferTo(new File(saveDir, manager.getManager_original_file()));

					// 기존 업로드 된 실제 파일 삭제
					File f2 = new File(saveDir, oldRealFile);
					if (f2.exists()) {
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

			return "redirect:/brand_mypage?manager_id=" + manager.getManager_id();
		}

	}

	// ------------내 브랜드정보 삭제----------------------------

	@GetMapping(value = "brand_mypage_delete")
	public String brandDelete(@ModelAttribute ManagerVO manager, @RequestParam String manager_id, Model model,
			HttpSession session) {

		String sId = (String) session.getAttribute("sId");

		int deleteCount = service.deleteManager(manager_id);
		System.out.println("정보삭제" + deleteCount);

		if (deleteCount > 0) {
//			model.addAttribute("msg", "탈퇴 성공!");
//			model.addAttribute("manager_id", manager_id);
//			model.addAttribute("manager", manager);
			session.invalidate();
			return "redirect:/";

		} else {

			model.addAttribute("fail", "탈퇴 실패");
			return "manager/mn_fail_back";
		}

	}

	// ------------(각브랜드별) 상품 목록
	// 조회(페이징처리같이)-------------------------------------------
	@GetMapping(value = "/products")
	public String itemList(Model model, HttpSession session, @RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String searchType, @RequestParam(defaultValue = "") String keyword) {

		String id = (String) session.getAttribute("sId");
		System.out.println("id : " + id);
		System.out.println("searchType : " + searchType);
		System.out.println("keyword : " + keyword);

		// 페이징처리
		int listLimit = 10;// 한 페이지 당 표시할 게시물 목록 갯수
		int pageListLimit = 10;// 한 페이지 당 표시할 페이지 목록 갯수

		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;

		// Service 객체의 getItemList() 메서드를 호출하여 게시물 목록 조회
		// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
		// => 리턴타입 : List<ItemVO>(itemList)
		List<ItemVO> itemList = service.getItemList(startRow, listLimit, searchType, keyword, id);

		// Service 객체의 getItemListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
		// => 파라미터 : 없음, 리턴타입 : int(listCount)
		int listCount = service.getItemListCount(searchType, keyword, id);
//		System.out.println("검색결과(목록 수)" + listCount);
		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		// Math 클래스의 ceil() 메서드를 활용하여 소수점 올림 처리를 통해 전체 페이지 수 계산
		// => listCount / listLimit 를 실수 연산으로 수행하여 소수점까지 계산하고
		// Math.ceil() 메서드를 통해 올림 처리 후 결과값을 정수로 변환
		int maxPage = (int) Math.ceil((double) listCount / listLimit);

		// 시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;

		// 끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;

		// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우
		// 끝 페이지 번호를 최대 페이지 번호로 교체
		if (endPage > maxPage) {
			endPage = maxPage;
		}

		// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
		PageInfo pageinfo = new PageInfo(pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);

		// 상품 목록(itemList) 과 페이징 처리 정보(pageInfo)를 Model 객체에 저장
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageInfo", pageinfo);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
//		System.out.println("상품목록" + itemList);

		return "manager/products";
	}

	// ------------상품 등록 폼페이지-------------------------------------------
	@RequestMapping(value = "product_register", method = RequestMethod.GET)
	public String product_register() {
		return "manager/product_register";
	}

//		product_registerPro.bo
	// ------------상품 등록-------------------------------------------
//	@RequestMapping(value = "product_registerPro.bo", method = RequestMethod.POST)
	@PostMapping(value = "product_registerPro.bo")
	public String product_registerPro(@ModelAttribute ItemVO item, @ModelAttribute File_ItemVO fileItem, Model model,
			HttpSession session) {

		String id = (String) session.getAttribute("sId");
		System.out.println("아이디 : " + id);
		ManagerVO manager = service.getManagerInfo(id);

//		System.out.println("p : " + item_packing);
//		System.out.println("c : " +item_category);
//		System.out.println("s : " +item_status);
//		System.out.println("i : " +item);

		String uploadDir = "/resources/item";
		String saveDir = session.getServletContext().getRealPath(uploadDir);

		File f = new File(saveDir); // 실제 경로를 갖는 File 객체 생성
		// 만약, 해당 경로 상에 디렉토리(폴더)가 존재하지 않을 경우 생성
		if (!f.exists()) { // 해당 경로가 존재하지 않을 경우
			// 경로 상의 존재하지 않는 모든 경로 생성
			f.mkdirs();
		}

		String uuid = UUID.randomUUID().toString();

		MultipartFile mFile1 = fileItem.getFile_1();
		MultipartFile mFile2 = fileItem.getFile_2();

		String originalFileName1 = mFile1.getOriginalFilename();
		String originalFileName2 = mFile2.getOriginalFilename();

		// ========================================================

		if (!originalFileName1.equals("")) {
			fileItem.setFile1(uuid + "_" + originalFileName1);
//			System.out.println("업로드 될 파일명 : " + uuid + "_" + originalFileName1);
		}

		if (!originalFileName2.equals("")) {
			fileItem.setFile2(uuid + "_" + originalFileName2);
//			System.out.println("업로드 될 파일명 : " + uuid + "_" + originalFileName2);
		}

		// ===========================================================

		int insertCount = service.newProducts(item, manager.getManager_idx());
		int file_insertCount = service.newProductsFile(fileItem);

		if (insertCount > 0) {
			if (file_insertCount > 0) {
				try {
					if (fileItem.getFile1() != null) {
						mFile1.transferTo(new File(saveDir, fileItem.getFile1()));
					}
					if (fileItem.getFile2() != null) {
						mFile2.transferTo(new File(saveDir, fileItem.getFile2()));
					}

				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				return "redirect:/products";
			} else {
				model.addAttribute("msg", "파일 업로드 실패!");
				return "manager/mn_fail_back";
			}

		} else {

			model.addAttribute("msg", "상품 등록에 실패하였습니다. \n 다시한번 시도해주세요.");
			return "manager/mn_fail_back";
		}

	}

	// ------------ 상품 등록 상세 조회-------------------------------------------
	@GetMapping(value = "/products_detail")
	public String products_detail(Model model, HttpSession session, int item_idx) {

		String sId = (String) session.getAttribute("sId");

		System.out.println("item_idx : " + item_idx);

		ItemVO ItemInfo = service.getItemInfo(item_idx);
		System.out.println("상품 상세 : " + ItemInfo);

		model.addAttribute("ItemInfo", ItemInfo);

		return "manager/products_detail";
	}

	// ------------상품 수정 - 원본글 불러오기------------------------------------------

	@GetMapping(value = "/product_modify")
	public String product_modify(Model model, HttpSession session,
			@RequestParam(name = "item_idx", required = false) String item_idx) {

		int itemModify_idx = Integer.parseInt(item_idx);

		ItemVO products = service.getProducts(itemModify_idx);
		System.out.println("번호:" + item_idx);

		model.addAttribute("products", products);
		model.addAttribute("item_idx", item_idx);

		return "manager/product_modify";
	}

	// ------------상품 수정 업데이트 글 수정 / 파일
	// 수정-------------------------------------------
	@PostMapping(value = "product_modifyPro.bo")
	public String edit_product(@ModelAttribute ItemVO item, @ModelAttribute File_ItemVO fileItem, Model model,
			HttpSession session) {

		System.out.println("아이템 : " + item);
		System.out.println("파일 :" + fileItem);

		// 기존 실제파일명을 변수에 저장 ( 새파일 업로드시 삭제필요 )
		String oldRealFile1 = fileItem.getFile1();
		String oldRealFile2 = fileItem.getFile2();

		String uuid = UUID.randomUUID().toString();
		String uploadDir = "/resources/item"; // 가상의 업로드 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir);

		File f = new File(saveDir); // 실제 경로를 갖는 File 객체 생성
		// 만약, 해당 경로 상에 디렉토리(폴더)가 존재하지 않을 경우 생성
		if (!f.exists()) { // 해당 경로가 존재하지 않을 경우
			// 경로 상의 존재하지 않는 모든 경로 생성
			f.mkdirs();
		}

		// ItemVO 객체에 전달된 MultipartFile 객체 꺼내기
		MultipartFile mFile1 = fileItem.getFile_1();
		MultipartFile mFile2 = fileItem.getFile_2();

		// 새 파일 업로드 여부 판별 저장 변수 선언(true : 새 파일 업로드)
		boolean isNewFile1 = false, isNewFile2 = false;

		// MultipartFile 객체의 원본 파일명이 널스트링("") 인지 판별
		// => 주의! 새 파일 업로드 여부와 관계없이 MultipartFile 객체는 항상 생성됨(null 판별 불가)
		// => 또한, 원본 파일명이 널스트링일 경우에는 기존 파일명이 이미 VO 객체에 저장되어 있음
		if (!mFile1.getOriginalFilename().equals("")) {
			String originalFileName = mFile1.getOriginalFilename();
			System.out.println("파일명1 : " + originalFileName);

			// BoardVO 객체에 원본 파일명과 업로드 될 파일명 저장
			// => 단, uuid 를 결합한 파일명을 사용할 경우 원본 파일명과 실제 파일명을 구분할 필요 없이
			// 하나의 컬럼에 저장해두고, 원본 파일명이 필요할 경우 "_" 를 구분자로 지정하여
			// 문자열을 분리하면 두번째 파라미터가 원본 파일명이 된다!
			fileItem.setFile1(uuid + "_" + originalFileName);
			// 새 파일 업로드 표시
			isNewFile1 = true;
		}

		if (!mFile2.getOriginalFilename().equals("")) {
			String originalFileName = mFile2.getOriginalFilename();
			System.out.println("파일명2 : " + originalFileName);

			// BoardVO 객체에 원본 파일명과 업로드 될 파일명 저장
			// => 단, uuid 를 결합한 파일명을 사용할 경우 원본 파일명과 실제 파일명을 구분할 필요 없이
			// 하나의 컬럼에 저장해두고, 원본 파일명이 필요할 경우 "_" 를 구분자로 지정하여
			// 문자열을 분리하면 두번째 파라미터가 원본 파일명이 된다!
			fileItem.setFile2(uuid + "_" + originalFileName);
			// 새 파일 업로드 표시
			isNewFile2 = true;
		}

		// ==================== 덮어쓰기 과정시작 =========================
		// 새 파일 선택 여부와 관계없이 공통으로 수정 작업 요청
		int updateFileCount = service.modifyItemFile(fileItem);

		if (updateFileCount == 0) {

			model.addAttribute("msg", "파일 수정이 되지 않았습니다.<br>다시 시도해 주세요.");
			return "manager/fail_back";

		} else {
			if (isNewFile1) {
				try {
					mFile1.transferTo(new File(saveDir, fileItem.getFile1()));

					File f1_1 = new File(saveDir, oldRealFile1);
//						System.out.println("File f1_1 = new File(saveDir, oldRealFile1);  -> "+ f1_1);
					if (f1_1.exists()) {
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

			if (isNewFile2) {
				try {
					mFile2.transferTo(new File(saveDir, fileItem.getFile2()));
					File f2_2 = new File(saveDir, oldRealFile2);
//						System.out.println("File f2_2 = new File(saveDir, oldRealFile1);  -> "+ f2_2);
					if (f2_2.exists()) {
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

		}

		// ========================= 상품 글 내용 수정 ===============================

		int updateCount = service.modifyProducts(item);

		System.out.println(updateCount);

		if (updateCount == 0) {
			model.addAttribute("msg", "상품 수정이 되지 않았습니다.<br>다시 시도해 주세요.");
			return "manager/mn_fail_back";
		}

		return "redirect:/products?item_idx=" + item_idx;
	}

	// 상품 삭제
	@GetMapping(value = "/product_delete")
	public String product_deletePro(@RequestParam int item_idx, Model model, HttpSession session) {

		System.out.println("번호 : " + item_idx);

		// 글 삭제 전 실제 업로드된 파일 삭제작업
		String realFile1 = service.getRealFile1(item_idx);
		String realFile2 = service.getRealFile2(item_idx);
		System.out.println("realFile1 -> " + realFile1);
		System.out.println("realFile2 -> " + realFile2);

		int deleteCount = service.removeItem(item_idx);
		int deleteFileCount = service.removeItemFile(item_idx);
		System.out.println("deleteCount 갯수 -> " + deleteCount);
		System.out.println("deleteFileCount 갯수 -> " + deleteFileCount);
		// ----------------------------------------------------------

		if (deleteCount > 0) {
			String uploadDir = "/resources/mnUPload"; // 가상의 업로드 경로
			// => webapp/resources 폴더 내에 upload 폴더 생성 필요
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			System.out.println("실제 업로드 경로 : " + saveDir);

			if (!realFile1.equals("N")) {
				File f1 = new File(saveDir, realFile1); // 실제 경로를 갖는 File 객체 생성
				if (f1.exists()) { // 해당 경로에 파일이 존재할 경우
					f1.delete();
				}
			}
			if (!realFile2.equals("N")) {
				File f2 = new File(saveDir, realFile2); // 실제 경로를 갖는 File 객체 생성
				if (f2.exists()) { // 해당 경로에 파일이 존재할 경우
					f2.delete();
				}
			}

			return "redirect:/products";

		} else {
			model.addAttribute("msg", "상품 삭제가 되지 않았습니다.<br>다시 시도해주세요.");
			return "manager/mn_fail_back";
		}

	}

	// ------------주문 목록 조회(페이징, 검색기능추가)-------------------------------------------

	@GetMapping(value = "/orders")
	public String orderList(Model model, HttpSession session, @RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String searchType, @RequestParam(defaultValue = "") String keyword) {

		String id = (String) session.getAttribute("sId");
		System.out.println(pageNum);
//			System.out.println("id : " + id );
		System.out.println("searchType : " + searchType);
		System.out.println("keyword : " + keyword);
//			System.out.println("manager_id : " + manager_id);

		// 페이징처리
		int listLimit = 10;// 한 페이지 당 표시할 게시물 목록 갯수
		int pageListLimit = 10;// 한 페이지 당 표시할 페이지 목록 갯수

		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;

		// Service 객체의 getItemList() 메서드를 호출하여 게시물 목록 조회
		// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
		// => 리턴타입 : List<SellVO>(orderList)
		List<SellVO> orderList = service.getOrderList(startRow, listLimit, searchType, keyword, id);

		// Service 객체의 getItemListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
		// => 파라미터 : 없음, 리턴타입 : int(listCount)
		int listCount = service.getOrderListCount(searchType, keyword, id);
//			System.out.println("검색결과(목록 수)" + listCount);
		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		// Math 클래스의 ceil() 메서드를 활용하여 소수점 올림 처리를 통해 전체 페이지 수 계산
		// => listCount / listLimit 를 실수 연산으로 수행하여 소수점까지 계산하고
		// Math.ceil() 메서드를 통해 올림 처리 후 결과값을 정수로 변환
		int maxPage = (int) Math.ceil((double) listCount / listLimit);

		// 시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;

		// 끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;

		// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우
		// 끝 페이지 번호를 최대 페이지 번호로 교체
		if (endPage > maxPage) {
			endPage = maxPage;
		}

		// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
		PageInfo pageinfo = new PageInfo(pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);

		// 주문 목록(orderList) 과 페이징 처리 정보(pageInfo)를 Model 객체에 저장
		model.addAttribute("orderList", orderList);
		model.addAttribute("pageInfo", pageinfo);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		System.out.println("주문목록" + orderList);
//			System.out.println("페이징" + pageinfo);
		return "manager/orders";
	}

	// ------------주문 상세----------------------------------------
	@RequestMapping(value = "order_detail", method = RequestMethod.GET)
	public String order_detail(Model model, HttpSession session,@RequestParam String sell_order_number) {
		String sId = (String) session.getAttribute("sId");

		List<SellVO> orderInfo = service.getOrderInfo(sId,sell_order_number);
		System.out.println("주문 상세 : " + orderInfo);

		model.addAttribute("orderInfo", orderInfo);

		return "manager/order_detail";
	}

	// ------------주문 수정 - 원본글 불러오기------------------------------------------

	@GetMapping(value = "/order_modify")
	public String order_modify(Model model, HttpSession session,
			@RequestParam(name = "item_idx", required = false) String item_idx,@RequestParam String sell_order_number) {

		String sId = (String) session.getAttribute("sId");

		List<SellVO> orderInfo = service.getOrderInfo(sId ,sell_order_number);
		System.out.println("번호:" + item_idx);

		model.addAttribute("orderInfo", orderInfo);
		model.addAttribute("item_idx", item_idx);

		return "manager/product_modify";
	}
	
	// ========================= 주문  내용 수정 ===============================
	@PostMapping(value = "order_modifyPro.bo")
		public String edit_order(@ModelAttribute ItemVO item, Model model,HttpSession session) {
				
			int updateCount = service.modifyOrder(item);

			System.out.println(updateCount);

			if (updateCount == 0) {
				model.addAttribute("msg", "주문수정이 되지 않았습니다.<br>다시 시도해 주세요.");
				return "manager/mn_fail_back";
			}

			return "redirect:/orders?item_idx=" + item_idx;
		}
	
	


	// ------------재고 목록 조회(페이징처리같이)-------------------------------------------
	@GetMapping(value = "/stock")
	public String stockList(Model model, HttpSession session, @RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String searchType, @RequestParam(defaultValue = "") String keyword) {

		String id = (String) session.getAttribute("sId");
		System.out.println("id : " + id);
		System.out.println("searchType : " + searchType);
		System.out.println("keyword : " + keyword);

		// 페이징처리
		int listLimit = 10;// 한 페이지 당 표시할 게시물 목록 갯수
		int pageListLimit = 10;// 한 페이지 당 표시할 페이지 목록 갯수

		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;

		// Service 객체의 getItemList() 메서드를 호출하여 게시물 목록 조회
		// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
		// => 리턴타입 : List<ItemVO>(itemList)
		List<ItemVO> stockList = service.getStockList(startRow, listLimit, searchType, keyword, id);

		// Service 객체의 getItemListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
		// => 파라미터 : 없음, 리턴타입 : int(listCount)
		int listCount = service.getStockListCount(searchType, keyword, id);
//			System.out.println("검색결과(목록 수)" + listCount);
		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		// Math 클래스의 ceil() 메서드를 활용하여 소수점 올림 처리를 통해 전체 페이지 수 계산
		// => listCount / listLimit 를 실수 연산으로 수행하여 소수점까지 계산하고
		// Math.ceil() 메서드를 통해 올림 처리 후 결과값을 정수로 변환
		int maxPage = (int) Math.ceil((double) listCount / listLimit);

		// 시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;

		// 끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;

		// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우
		// 끝 페이지 번호를 최대 페이지 번호로 교체
		if (endPage > maxPage) {
			endPage = maxPage;
		}

		// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
		PageInfo pageinfo = new PageInfo(pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);

		// 재고 목록(itemList) 과 페이징 처리 정보(pageInfo)를 Model 객체에 저장
		model.addAttribute("stockList", stockList);
		model.addAttribute("pageInfo", pageinfo);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
//			System.out.println("상품목록" + itemList);

		return "manager/stock";
	}

	// ------------ 재고 등록 상세 조회-------------------------------------------
	@GetMapping(value = "/stock_detail")
	public String stock_detail(Model model, HttpSession session, int item_idx) {

		String sId = (String) session.getAttribute("sId");

		System.out.println("item_idx : " + item_idx);

		ItemVO StockInfo = service.getStockInfo(item_idx);
		System.out.println("재고 상세 : " + StockInfo);

		model.addAttribute("StockInfo", StockInfo);

		return "manager/stock_detail";
	}

	
	// ------------재고 수정(원본글 불러오기)----------------------------------------
	
	@GetMapping(value = "/stock_modify")
	public String stock_modify(Model model, HttpSession session,
			@RequestParam int item_idx) {


		ItemVO stock = service.getStock(item_idx);
		System.out.println("번호:" + item_idx);

		model.addAttribute("stock", stock);
		model.addAttribute("item_idx", item_idx);

		return "manager/stock_modify";
	}

	// ========================= 재고 글 내용 수정 ===============================
	@PostMapping(value = "stock_modifyPro.bo")
		public String edit_stock( Model model,HttpSession session) {
				
			int updateCount = service.modifystock(item_idx);

			System.out.println(updateCount);

			if (updateCount == 0) {
				model.addAttribute("msg", "재고 수정이 되지 않았습니다.<br>다시 시도해 주세요.");
				return "manager/mn_fail_back";
			}

//			return "redirect:/stock?item_idx=" + item_idx;
			return "redirect:/products?item_idx=" + item_idx;

		}
	
	
	// ------------ 문의 글 목록 불러오기(페이징,
	// 검색기능추가)-------------------------------------------

	@GetMapping(value = "/qnaboard_list")
	public String qna_Board(Model model, HttpSession session, @RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String searchType, @RequestParam(defaultValue = "") String keyword) {

		String id = (String) session.getAttribute("sId");

//			System.out.println(pageNum);

		// 페이징 처리를 위한 계산 작업
		int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수
		int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수

		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;

		System.out.println(startRow);
		System.out.println(listLimit);
		System.out.println(pageListLimit);

		// Service 객체의 getBoardList() 메서드를 호출하여 게시물 목록 조회
		// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
		// => 리턴타입 : List<BoardVO>(boardList)
		List<QnaVO> QnaBoardList = service.getQnaBoardList(startRow, listLimit, searchType, keyword, id);

		// Service 객체의 getBoardListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
		// => 파라미터 : 없음, 리턴타입 : int(listCount)
		int listCount = service.getQnaBoardListCount(searchType, keyword, id);

		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		// Math 클래스의 ceil() 메서드를 활용하여 소수점 올림 처리를 통해 전체 페이지 수 계산
		// => listCount / listLimit 를 실수 연산으로 수행하여 소수점까지 계산하고
		// Math.ceil() 메서드를 통해 올림 처리 후 결과값을 정수로 변환
		int maxPage = (int) Math.ceil((double) listCount / listLimit);

		// 시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;

		// 끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;

		// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우
		// 끝 페이지 번호를 최대 페이지 번호로 교체
		if (endPage > maxPage) {
			endPage = maxPage;
		}

		String sId = (String) session.getAttribute("sId");

		// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
		PageInfo pageInfo = new PageInfo(pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
//			System.out.println(pageInfo);
		// --------------------------------------------------------------------------------
		// 게시물 목록(QnaBoardList) 과 페이징 처리 정보(pageInfo)를 Model 객체에 저장
		model.addAttribute("QnaBoardList", QnaBoardList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);

		System.out.println(QnaBoardList);

		return "manager/qnaboard_list";
	}

	// ------------ 문의글 상세 조회-------------------------------------------
	@RequestMapping(value = "/qnaboard_detail", method = RequestMethod.GET)
	public String qna_Board_Detail(Model model, HttpSession session, String qna_idx) {

		String sId = (String) session.getAttribute("sId");

		System.out.println("qna_idx : " + qna_idx);

		QnaVO QnaInfo = service.getQnaInfo(qna_idx);
		System.out.println("문의글 상세 : " + QnaInfo);

		model.addAttribute("QnaInfo", QnaInfo);

		return "manager/qnaboard_detail";
	}

	// ------------ 문의글 답변작성-------------------------------------------
	@PostMapping(value = "qnaboard_answer_detailPro")
	public String qnaboard_answer_detailPro(Model model, HttpSession session, QnaVO qna) {

		String sId = (String) session.getAttribute("sId");

		int updateCount = service.registQnaboard(qna);
		model.addAttribute("updateCount", updateCount);
		System.out.println("updateCount" + updateCount);
		if (updateCount == 0) {
			model.addAttribute("msg", "실패~!");
			return "member/fail_back";
		}

		return "redirect:/qnaboard_list";

	}

	// ------------ 문의글 답변삭제-------------------------------------------

	@GetMapping(value = "qnaboard_delete")
	public String qnaboard_delete(@RequestParam String qna_idx, Model model, HttpSession session) {

		String sId = (String) session.getAttribute("sId");

		int delectCount = service.removeQnaboard(qna_idx);
		System.out.println(delectCount);

		if (delectCount == 0) {
			model.addAttribute("msg", "실패~!");
			return "member/fail_back";
		}

		model.addAttribute("delectCount", delectCount);
		return "redirect:/qnaboard_list";
	}

	// ------------ 레시피 목록 불러오기(페이징,
	// 검색기능추가)-------------------------------------------

	@GetMapping(value = "/recipeboard_list")
	public String recipe_Board(Model model, HttpSession session, @RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String searchType, @RequestParam(defaultValue = "") String keyword) {

		String sId = (String) session.getAttribute("sId");
//	             System.out.println(pageNum);

		// 페이징 처리를 위한 계산 작업
		int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수
		int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수

		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;

		System.out.println(startRow);
		System.out.println(listLimit);
		System.out.println(pageListLimit);

		// Service 객체의 getBoardList() 메서드를 호출하여 게시물 목록 조회
		// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
		// => 리턴타입 : List<BoardVO>(boardList)

		// 브랜드 페이지 내 등록한 레시피 조회
		List<BoardVO> recipeList = recipe_service.getMyRecipeList(startRow, listLimit, keyword, sId);

		// 레시피 글 목록 갯수 조회
		int listCount = recipe_service.getMyRecipeCount(keyword, sId);

		int maxPage = (int) Math.ceil((double) listCount / listLimit);

		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;

		int endPage = startPage + pageListLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pageInfo = new PageInfo(pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);

		model.addAttribute("recipeList", recipeList);

		System.out.println(recipeList);
		model.addAttribute("pageInfo", pageInfo);

		return "manager/recipeboard_list";
	}

	// 레시피 폼
	@GetMapping(value = "/recipeboard_write")
	public String recipe_write(Model model, HttpSession session) {

		String sId = (String) session.getAttribute("sId");

		// 해당 기업이 올린 상품 조회
		List<ItemVO> myItem = recipe_service.getmyItem(sId);

		model.addAttribute("myItem", myItem);

		return "manager/recipeboard_write";
	}

	// 레시피 작성
	@PostMapping(value = "/recipeboard_writePro.bo")
	public String recipe_writePro(@ModelAttribute BoardVO board, @ModelAttribute File_boardVO fileBoard,
			@RequestParam(name = "item_idx", required = false) String item_idx, Model model, HttpSession session) {

		// 레시피에 사용한 아이템 번호
		int use_item_idx = Integer.parseInt(item_idx);

		// 가상 업로드 경로에 대한 실제 업로드 경로 알아내기
		// => 단, request 객체에 getServletContext() 메서드 대신, session 객체로 동일한 작업 수행
		// (request 객체에 해당 메서드 없음)
		String uploadDir = "/resources/recUpload"; // 가상의 업로드 경로
//	 					// => webapp/resources 폴더 내에 upload 폴더 생성 필요
		String saveDir = session.getServletContext().getRealPath(uploadDir);
//	 					System.out.println("실제 업로드 경로 : " + saveDir);

		File f = new File(saveDir); // 실제 경로를 갖는 File 객체 생성
		// 만약, 해당 경로 상에 디렉토리(폴더)가 존재하지 않을 경우 생성
		if (!f.exists()) { // 해당 경로가 존재하지 않을 경우
			// 경로 상의 존재하지 않는 모든 경로 생성
			f.mkdirs();
		}

		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		// => 복수개의 파일이 각각 다른 name 속성으로 전달된 경우
		// => 각각의 MultipartFile 객체를 통해 getFile() 메서드 호출
//	 							MultipartFile mFile = board.getFile();

//	 			String uuid = UUID.randomUUID().toString();

		MultipartFile mFile1 = fileBoard.getFile_1();
		MultipartFile mFile2 = fileBoard.getFile_2();

		String originalFileName1 = mFile1.getOriginalFilename();
		String originalFileName2 = mFile2.getOriginalFilename();

		// ========================================================

		if (!originalFileName1.equals("")) {
			fileBoard.setFile1(originalFileName1);
//	 						System.out.println("업로드 될 파일명 : " + uuid + "_" + originalFileName1);
		}

		if (!originalFileName2.equals("")) {
			fileBoard.setFile2(originalFileName2);
//	 						System.out.println("업로드 될 파일명 : " + uuid + "_" + originalFileName2);
		}

		// ===========================================================

		int insertCount = recipe_service.writeRecipe(board, use_item_idx);
		int file_insertCount = recipe_service.writeRecipeFile(fileBoard);

		if (insertCount > 0) {
			if (file_insertCount > 0) {
				try {
					if (fileBoard.getFile1() != null) {
						mFile1.transferTo(new File(saveDir, fileBoard.getFile1()));
					}
					if (fileBoard.getFile2() != null) {
						mFile2.transferTo(new File(saveDir, fileBoard.getFile2()));
					}
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				return "redirect:/recipeboard_list";
			} else {
				model.addAttribute("msg", "파일 업로드가 되지 않았습니다.<br>다시 시도해 주세요.");
				return "manager/mn_fail_back";
			}

		} else {

			model.addAttribute("msg", "레시피 등록이 되지 않았습니다<br>다시 시도해 주세요.");
			return "manager/mn_fail_back";
		}
	}

	// 레시피 수정 - 원본 글 불러오기
	@GetMapping(value = "/recipeboard_modify")
	public String recipe_modify(@RequestParam int board_idx, Model model) {

		BoardVO recipe = recipe_service.getRecipe(board_idx);

		model.addAttribute("recipe", recipe);
		System.out.println("번호:" + board_idx);
		// 해당 기업이 올린 상품 조회
		List<ItemVO> myItem = recipe_service.getmyItem(recipe.getBoard_id());

		model.addAttribute("myItem", myItem);

		return "manager/recipeboard_modify";
	}

	// 레시피 글 수정 / 파일 수정
	@PostMapping(value = "/recipeboard_modifyPro.bo")
	public String recipe_modifyPro(@ModelAttribute BoardVO board, @ModelAttribute File_boardVO fileBoard,
			@RequestParam int board_idx, @RequestParam(name = "item_idx", required = false) String item_idx,
			HttpSession session, Model model) {

		int use_item_idx = Integer.parseInt(item_idx);

		// 기존 실제파일명을 변수에 저장 ( 새파일 업로드시 삭제필요 )
		String oldRealFile1 = fileBoard.getFile1();
		String oldRealFile2 = fileBoard.getFile2();

//	 			String uuid = UUID.randomUUID().toString();
		String uploadDir = "/resources/recUpload"; // 가상의 업로드 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir);

		File f = new File(saveDir); // 실제 경로를 갖는 File 객체 생성
		// 만약, 해당 경로 상에 디렉토리(폴더)가 존재하지 않을 경우 생성
		if (!f.exists()) { // 해당 경로가 존재하지 않을 경우
			// 경로 상의 존재하지 않는 모든 경로 생성
			f.mkdirs();
		}

		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		MultipartFile mFile1 = fileBoard.getFile_1();
		MultipartFile mFile2 = fileBoard.getFile_2();

		// 새 파일 업로드 여부 판별 저장 변수 선언(true : 새 파일 업로드)
		boolean isNewFile1 = false, isNewFile2 = false;

		// MultipartFile 객체의 원본 파일명이 널스트링("") 인지 판별
		// => 주의! 새 파일 업로드 여부와 관계없이 MultipartFile 객체는 항상 생성됨(null 판별 불가)
		// => 또한, 원본 파일명이 널스트링일 경우에는 기존 파일명이 이미 VO 객체에 저장되어 있음
		if (!mFile1.getOriginalFilename().equals("")) {
			String originalFileName = mFile1.getOriginalFilename();
			System.out.println("파일명1 : " + originalFileName);

			// BoardVO 객체에 원본 파일명과 업로드 될 파일명 저장
			// => 단, uuid 를 결합한 파일명을 사용할 경우 원본 파일명과 실제 파일명을 구분할 필요 없이
			// 하나의 컬럼에 저장해두고, 원본 파일명이 필요할 경우 "_" 를 구분자로 지정하여
			// 문자열을 분리하면 두번째 파라미터가 원본 파일명이 된다!
			fileBoard.setFile1(originalFileName);
			// 새 파일 업로드 표시
			isNewFile1 = true;
		}

		if (!mFile2.getOriginalFilename().equals("")) {
			String originalFileName = mFile2.getOriginalFilename();
			System.out.println("파일명2 : " + originalFileName);

			// BoardVO 객체에 원본 파일명과 업로드 될 파일명 저장
			// => 단, uuid 를 결합한 파일명을 사용할 경우 원본 파일명과 실제 파일명을 구분할 필요 없이
			// 하나의 컬럼에 저장해두고, 원본 파일명이 필요할 경우 "_" 를 구분자로 지정하여
			// 문자열을 분리하면 두번째 파라미터가 원본 파일명이 된다!
			fileBoard.setFile2(originalFileName);
			// 새 파일 업로드 표시
			isNewFile2 = true;
		}

		// ----파일 수정----
		// 새 파일 선택 여부와 관계없이 공통으로 수정 작업 요청
		int updateFileCount = recipe_service.modifyRecipeFile(fileBoard);

		if (updateFileCount == 0) {

			model.addAttribute("msg", "파일 수정이 되지 않았습니다.<br>다시 시도해 주세요.");
			return "member/fail_back";

		} else {
			if (isNewFile1) {
				try {
					mFile1.transferTo(new File(saveDir, fileBoard.getFile1()));
					File f1 = new File(saveDir, oldRealFile1);

					if (f1.exists()) {
						f1.delete();
					}

				} catch (IllegalStateException e) {
					System.out.println("IllegalStateException");
					e.printStackTrace();
				} catch (IOException e) {
					System.out.println("IOException");
					e.printStackTrace();
				}
			}

			if (isNewFile2) {
				try {
					mFile2.transferTo(new File(saveDir, fileBoard.getFile2()));
					File f2 = new File(saveDir, oldRealFile2);

					if (f2.exists()) {
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

		}

		// ----글 수정----
		int updateCount = recipe_service.modifyRecipe(board, use_item_idx);

		System.out.println(updateCount);

		if (updateCount == 0) {
			model.addAttribute("msg", "레시피 수정이 되지 않았습니다.<br>다시 시도해 주세요.");
			return "manager/mn_fail_back";
		}

		return "redirect:/recipeboard_list?board_idx=" + board_idx;
	}

	// 레시피 삭제
	@PostMapping(value = "/recipeboard_deletePro.bo")
	public String recipe_deletePro(@RequestParam int board_idx, Model model, HttpSession session) {

		// 글 삭제 전 실제 업로드된 파일 삭제작업
		String realFile1 = recipe_service.getRealFile1(board_idx);
		String realFile2 = recipe_service.getRealFile2(board_idx);

		int deleteCount = recipe_service.removeRecipe(board_idx);
		int deleteFileCount = recipe_service.removeRecipeFile(board_idx);

		// ----------------------------------------------------------

		if (deleteCount > 0) {
			String uploadDir = "/resources/recUpload"; // 가상의 업로드 경로
			// => webapp/resources 폴더 내에 upload 폴더 생성 필요
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			System.out.println("실제 업로드 경로 : " + saveDir);

			if (!realFile1.equals("N")) {
				File f1 = new File(saveDir, realFile1); // 실제 경로를 갖는 File 객체 생성
				if (f1.exists()) { // 해당 경로에 파일이 존재할 경우
					f1.delete();
				}
			}
			if (!realFile2.equals("N")) {
				File f2 = new File(saveDir, realFile2); // 실제 경로를 갖는 File 객체 생성
				if (f2.exists()) { // 해당 경로에 파일이 존재할 경우
					f2.delete();
				}
			}

			return "redirect:/recipe_main.bo";

		} else {
			model.addAttribute("msg", "레시피 삭제가 되지 않았습니다.<br>다시 시도해주세요.");
			return "member/fail_back";
		}

	}

	// ------------매출 관리-------------------------------------------
	@RequestMapping(value = "sales_main", method = RequestMethod.GET)
	public String sales_main(@RequestParam String manager_id, Model model, HttpSession session) {

		String sId = (String) session.getAttribute("sId");

		List<ItemVO> top10 = service.getTop10(sId);
		model.addAttribute("top3", top10);

		// 총매출 ,주문수
		ManagerVO orderTotal = service.getOrderTotal(sId);
		model.addAttribute("orderTotal", orderTotal);

		return "manager/sales_main";

	}



	// ------------정산 목록-------------------------------------------
	@GetMapping(value = "sales_management")

	public String sales_list (@RequestParam String manager_id, Model Model, HttpSession session) {

		String sId = (String) session.getAttribute("sId");

		// 총매출
		ManagerVO salesTotal = service.getSalesTotal(sId);
		ManagerVO orderTotal = service.getOrderTotal(sId);
		// 한달매출
		List<ManagerVO> salesMonth = service.getSalesMonth(sId);
		
		// 일주일매출
		List<ManagerVO> salesWeek = service.getSalesWeek(sId);
		
		// 하루매출
		List<ManagerVO> salesday = service.getSalesDay(sId);
		
		// 수수료
		SellVO commission = service.getCommission(sId);
		
		// 순수익
		System.out.println(sId);
        SellVO  brand_net = service.getBrand_net(sId);
//		Map<String, String> map = service.getBrand_net(sId);
//		System.out.println(map);
		
        Model.addAttribute("orderTotal", orderTotal);
		Model.addAttribute("salesTotal", salesTotal);
		Model.addAttribute("salesMonth", salesMonth);
		Model.addAttribute("salesWeek", salesWeek);
		Model.addAttribute("salesday", salesday);
		Model.addAttribute("commission", commission.getNet());
		Model.addAttribute("Brand_net", brand_net.getBrand_net());


		System.out.println("총매출: " + salesTotal);
		System.out.println("한달매출: " + salesMonth);
		System.out.println("일주일매출: " + salesWeek);
		System.out.println("하루매출: " + salesday);
		System.out.println("수수료: " + commission.getNet());
		System.out.println("순수익: " + brand_net.getBrand_net());

		return "manager/sales_management";
	}
	
	
	
	

}
