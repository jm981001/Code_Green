package com.itwillbs.Code_Green.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.itwillbs.Code_Green.vo.MemberVO;

@Component
public class MailSendService {
	@Autowired
	private JavaMailSenderImpl mailSender;
	@Autowired
	private MemberService mService;
	
	private int authNumber; //난수
	private String code; //임시 패스워드

	// 인증코드 생성기
	public void makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}


	// 이메일 양식
	public String joinEmail(String email) {
		makeRandomNumber();
		String setFrom = "CodeGreen@gmail.com";
		String toMail = email;
		String title = "회원 가입 인증 이메일 입니다."; // 이메일 제목
		String content = "" + // html 형식으로 작성 !
				"<br><br>" + "인증 번호는 " + authNumber + " 입니다." + "<br>" + "해당 인증번호를 입력해주세요."; // 이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}

	// 아이디 찾아주는 이메일 양식
	public String idFindEmail(String email) {
		System.out.println(email);
		MemberVO member = mService.getMemberEmail(email);
		String id = member.getMember_id();
		String setFrom = "CodeGreen@gmail.com";
		String toMail = email;
		String title = "회원님의 아이디 입니다."; // 이메일 제목
		String content = "" + // html 형식으로 작성 !
				"<br><br>" + "아이디는 " +id+ " 입니다."; // 이메일 내용 삽입
		
		mailSend(setFrom, toMail, title, content);
		System.out.println("getId"+member.getMember_id());
		return "msg";
		
	}
	// 패스워드 변경용 인증메일 양식
		public int passFindEmail(String email) {
			makeRandomNumber();
			String setFrom = "CodeGreen@gmail.com";
			String toMail = email;
			String title = "임시 패스워드 이메일 입니다."; // 이메일 제목
			String content = "" + // html 형식으로 작성 !
					"<br><br>" + "임시 패스워드는 " + authNumber + " 입니다." + "<br>" + "해당 패스워드를 입력해주세요."; // 이메일 내용 삽입
			MemberVO member = mService.getMemberEmail(email);
			System.out.println("member"+member);
			if(member ==null) {
				System.out.print("등록되지 않은 이메일입니다.");
				System.out.close();
			}
			// 1. BCryptPasswordEncoder 객체 생성
			member.setMember_pass(authNumber+"");
			System.out.println("authNumber"+authNumber+"");
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			// 2. BCryptPasswordEncoder 객체의 encode() 메서드를 호출하여 해싱 결과 리턴
			String securePasswd = encoder.encode(member.getMember_pass());
			// 3. MemberVO 객체의 패스워드에 암호문 저장
			member.setMember_pass(securePasswd);
			
			
			int updateCount =  mService.modifyMemberInfo(member);
			System.out.println("updateCount"+updateCount);
			mailSend(setFrom, toMail, title, content);
			
			return updateCount;
			
		}

	// 이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}


}