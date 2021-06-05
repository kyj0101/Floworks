package com.kh.floworks.authentication.findId.controller;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.floworks.authentication.findId.model.service.FindIdService;

@Controller
@RequestMapping("/find/id")
public class FindIdController {
	
	@Autowired
	private FindIdService findIdService;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@GetMapping("/view")
	public String findId() {
		return "/login/findId";
	}
	
	@ResponseBody
	@GetMapping("/user/email/check")
	public String userEmailCheck(String email) {
		
		boolean result = findIdService.selectUserEmail(email);
		
		return result ? "true" : "false";
	}
	
	@PostMapping("/send")
	public ResponseEntity<String> send(String email)
			throws MessagingException, UnsupportedEncodingException {

		try {
			
			String id = findIdService.selectOneId(email);

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

			helper.setFrom("Floworks", "Floworks");
			helper.setTo(email);
			helper.setSubject("Floworks 아이디 찾기 이메일입니다.");
			helper.setText("<p>안녕하세요.</p>" 
			             + "<p>찾으시는 아이디는  다음과 같습니다.</p>" 
					     + "<p>[ " + id  + " ]</p>" 
			             + "<p>감사합니다.</p>" 
					     + "<p>- Floworks -</p>", true);

			mailSender.send(message);

			return ResponseEntity.ok()
					             .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					             .body("이메일이 발송되었습니다.");

		} catch (MessagingException e) {
			throw e;

		} catch (UnsupportedEncodingException e) {
			throw e;
		}
	}
	
}
