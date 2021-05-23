package com.kh.floworks.authentication.controller;

import java.io.UnsupportedEncodingException;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.floworks.authentication.model.service.EmailAuthenticationService;
import com.kh.floworks.authentication.model.vo.EmailAuthentication;
import com.kh.floworks.email.model.service.EmailService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.simp.SimpMessagingTemplate;
@Controller
@RequestMapping("/register/email/auth")
@Slf4j
public class EmailAuthenticationController {
	
	@Autowired
	private EmailAuthenticationService emailAuthService;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	
	@ResponseBody
	@PostMapping("/send")
	public void sendEmailAuth(String email, HttpServletRequest request) {
		
		try {
			
			String authKey = UUID.randomUUID().toString();
			EmailAuthentication emailAuth = new EmailAuthentication(email, authKey, "N");
			String url = "http://localhost:9090/floworks/register/email/auth/page" + "?authKey=" + authKey + "&email=" + email; 
			
			emailAuthService.insertEmailAuth(emailAuth);
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			
			helper.setFrom("Floworks", "Floworks");
			helper.setTo(email);
			helper.setSubject("Floworks 이메일 인증입니다.");
			helper.setText("<p>안녕하세요.</p>"
                         + "<p>다음 링크를 눌려 이메일 인증을 완료하세요.</p>"
					     + "<p><a href='" + url + "'>이메일 인증</a></p>"
					     + "<p>감사합니다.</p>"
					     + "<p>- Floworks -</p>", true);
			
			mailSender.send(message);
			
		} catch (UnsupportedEncodingException | MessagingException e) {
			new RuntimeException();
		}
	}
	
	@GetMapping("/page")
	public String authPage(String authKey, String email, Model model) {
		
		model.addAttribute("authKey", authKey);
		model.addAttribute("email", email);
		
		return "/member/auth";
	}
	
	@ResponseBody
	@PostMapping("/check")
	public void authCheck(String authKey, String email) {
		
		try {
			
			int index = email.indexOf("@");
			String url = "/notice/" + email.substring(0, index);
			EmailAuthentication emailAuth = new EmailAuthentication(email, authKey, "Y");
			int result = emailAuthService.updateEmailAuthStatus(emailAuth);

			if (result <= 0) {
				throw new IllegalArgumentException();
			}
			
			simpMessagingTemplate.convertAndSend(url, "인증완료");

		} catch (Exception e) {
			throw e;
		}
	}
	
	@ResponseBody
	@PostMapping("/reset")
	public void reset(String email, HttpServletRequest request) {
		log.info(email);
		try {
			
			emailAuthService.deleteEmailAuth(email);
			sendEmailAuth(email,request);
			
		} catch (Exception e) {
			new RuntimeException();
		}
	}
}
