package com.kh.floworks.member.contorller;

import java.io.UnsupportedEncodingException;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.floworks.authentication.email.model.vo.EmailAuthentication;
import com.kh.floworks.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	
	@GetMapping("/mainPage")
	public String indexPage() {
		return "/member/mainPage";
	}
	
	@GetMapping(value={"/mypage","/mypage/update"})
	public String mypage() {		
		return "/member/memberUpdate";
	}

	@GetMapping("/delete")
	public String memberDelete() {		
		return "/member/memberDelete";
	}
	
	@GetMapping("/updatePwd")
	public String updatePassword() {	
		return "/member/updatePassword";
	}
	
}
