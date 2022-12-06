package com.itwillbs.Code_Green.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.Code_Green.service.CartService;
import com.itwillbs.Code_Green.service.CoinService;
import com.itwillbs.Code_Green.service.ItemService;
import com.itwillbs.Code_Green.service.MailSendService;
import com.itwillbs.Code_Green.service.MemberService;
import com.itwillbs.Code_Green.vo.CoinVO;
import com.itwillbs.Code_Green.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private CoinService coinService;
	@Autowired
	private MailSendService mailService;
	@Autowired
	private MemberService service;
	@Autowired
	private ItemService Iservice;
	@Autowired
	private CartService cartService;
	

	// "/MemberLoginPro.me" 요청에 대해 비즈니스 로직 처리 - POST
	@PostMapping(value = "/MemberLoginPro.me")
	public String loginPro(@ModelAttribute MemberVO member, Model model, HttpSession session,
			@RequestParam String member_id) {
		// ------------------ BCryptPasswordEncoder 활용한 로그인 판별 ----------------------
		// 1. BCryptPasswordEncoder 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		// 2. member 테이블에서 id 에 해당하는 패스워드 조회 후 리턴값 저장(getPasswd())
		// => 파라미터 : 아이디 리턴타입 : String(passwd)
		String passwd = service.getPasswd(member.getMember_id());
//		System.out.println(passwd);

		// 3. 탈퇴 여부 확인
		String checkDel = service.checkDel(member.getMember_id());
		MemberVO checkId = service.getMemberInfo(member_id);
		System.out.println("checkId" + checkId);
		if (checkId == null) {
			model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다");
			return "member/fail_back";
		}
		if (checkDel.equals("Y")) {
			System.out.println("탈퇴한 회원");
			model.addAttribute("msg", "탈퇴한 회원입니다");
			return "member/fail_back";

		} else {
			System.out.println("활동중인 회원");
			// 3. 조회 결과를 활용하여 로그인 성공 여부 판별
			// 1) 아이디가 없을 경우(passwd 값이 null) 실패
			// 2) 패스워드 비교(BCryptPasswordEncoder 객체의 matches() 메서드 활용)
			// 2-1) 다를 경우 실패
			// 2-2) 같을 경우 성공
			if (passwd == null || !encoder.matches(member.getMember_pass(), passwd)) {
				model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다");
//			System.out.println(member.getMember_id() + ", " + member.getMember_pass()+"로그인 실패..");
				return "member/fail_back";
			} else {

				MemberVO getMem = service.getMemberInfo(member.getMember_id());
				session.setAttribute("sId", member.getMember_id()); // 세션아이디
				session.setAttribute("sIdx", getMem.getMember_idx());// 세션 IDX
				session.setAttribute("sEmail", getMem.getMember_email()); // 세션 이메일

				// 장바구니 갯수
				int cartCount = cartService.getCartCount(getMem.getMember_idx());
				session.setAttribute("cartCount", cartCount);
				model.addAttribute("cartCount", cartCount);

				return "redirect:/";
			}
		}

	}

	// MemberLogout.me 요청에 대한 로그아웃 처리
	@GetMapping(value = "/MemberLogout.me")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 회원가입 페이지 요청
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}

	// 아이디 중복체크
	@ResponseBody
	@PostMapping(value = "idCheck")
	public int idCheck(@RequestParam("member_id") String member_id, @ModelAttribute MemberVO member) {
		int memberCheck = service.idCheck(member_id);
//		System.out.println("memberCheck"+memberCheck);

		return memberCheck;
	}
	// 메일 중복체크
	@ResponseBody
	@PostMapping(value = "mailCheck")
	public int mailCheck(@RequestParam("member_email") String member_email, @ModelAttribute MemberVO member) {
		int mailCheck = service.mailCheck(member_email);

		return mailCheck;
	}

	// "/MemberJoinPro.me" 요청에 대해 비즈니스 로직 처리할 joinPro() 메서드 정의 - POST
	// => 파라미터 : 회원 가입 정보(MemberVO), Model 객체
	@PostMapping(value = "/MemberJoinPro.me")
	public String joinMemberPro(@ModelAttribute MemberVO member, Model model, @RequestParam String member_id,
			@ModelAttribute CoinVO coin) {

		// ------------------ BCryptPasswordEncoder 활용한 해싱 ----------------------

		// 1. BCryptPasswordEncoder 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		// 2. BCryptPasswordEncoder 객체의 encode() 메서드를 호출하여 해싱 결과 리턴
		String securePasswd = encoder.encode(member.getMember_pass());
		// 3. MemberVO 객체의 패스워드에 암호문 저장
		member.setMember_pass(securePasswd);

		int insertCount = service.joinMember(member);

		if (insertCount > 0) { // 가입 성공
			System.out.println("가입 성공!");
			// 가입 성공시 기본적립금 적립
			MemberVO getMem = service.getMemberInfo(member.getMember_id());
			System.out.println("getMem"+getMem);

			int coinCount= service.addCoin(coin);
			System.out.println("coinCount : " + coinCount);
			System.out.println("coin : " + coin); //null

			coin = coinService.getCoin(member_id);
			
			CoinVO getCoin = coinService.getCoin(getMem.getMember_id());
			System.out.println("getMem.getMember_id(): "+getMem.getMember_id());
			
			System.out.println("getCoin : " + getCoin);  //null
			
			
			return "redirect:/join_result";
		} else { // 가입 실패
			model.addAttribute("msg", "가입 실패!");
			return "member/fail_back";
		}
	}

	// 가입 결과
	@RequestMapping(value = "/join_result", method = RequestMethod.GET)
	public String join_reult() {
		return "member/join_result";
	}

	// 아이디 중복 검사용
	@RequestMapping(value = "/idDupCheck", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String member_id) throws Exception {

		int result = service.idCheck(member_id);

		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x

		}
	}

	// 이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(@ModelAttribute MemberVO member, Model model, HttpSession session, String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);

	}

	// 아이디 찾는 폼
	@GetMapping(value = "/find_id")
	public String find_id_form() {
		return "member/find_id_form";
	}

	// 아이디 찾는 이메일
	@GetMapping("/idFindMail")
	public String findIdMailCheck(String email, Model model) {
		System.out.println("아이디 찾기 이메일 요청이 들어옴!");
		System.out.println("아이디 찾을 이메일 : " + email);
		String emailResult = mailService.idFindEmail(email);
		if (emailResult == null) {
			System.out.println("없는 이메일");
			model.addAttribute("msg", "실패");
			return "member/fail_back";
		}
		return "redirect:/find_id_pro";
	}
	// 아이디 찾기 결과
	@GetMapping(value = "/find_id_pro")
	public String find_id_result() {
		return "member/find_id_result";
	}

	
	// 패스워드 찾는 폼
	@GetMapping(value = "/find_pass")
	public String find_pass_form() {
		return "member/find_pass_form";
	}
	
	// 아이디 찾는 이메일
	@GetMapping("/passFindMail")
	public String findPassMailCheck(String email, Model model) {
		System.out.println("패스워드 찾기 이메일 요청이 들어옴!");
		System.out.println("패스워드 찾을 이메일 : " + email);
		int emailResultCount = mailService.passFindEmail(email);
		if (emailResultCount == 0) {
			model.addAttribute("msg", "실패");
			return "member/fail_back";
		}
		return "redirect:/find_pass_result";
	}
	
	// 패스워드 찾기 결과
	@GetMapping(value = "/find_pass_result")
	public String find_pass_result() {
		return "member/find_pass_result";
	}

	// 회원 탈퇴처리 (사실은 update 구문으로 삭제한 회원으로 처리됨)
	@GetMapping("/memberDelete.me")
	public String memberDelete(@ModelAttribute MemberVO member, Model model, HttpSession session) {
		int updateCount = service.memberDelete(member);
		if (updateCount == 0) {
			model.addAttribute("msg", "탈퇴실패");
			return "member/fail_back";
		}
		session.invalidate();
		return "redirect:/";
	}
}
