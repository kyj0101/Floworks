package com.kh.floworks.authentication.findpassword.controller;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.floworks.authentication.findpassword.model.service.FindPasswordAuthenticationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/find/password")
public class FindPasswordAuthenticationController {
	
	@Autowired
	private JavaMailSenderImpl mailSender;

	@Autowired
	private FindPasswordAuthenticationService findPwdAuthService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@PostMapping("/send")
	public ResponseEntity<String> findPassword(String id, String email) throws MessagingException,UnsupportedEncodingException {
		
		try {

			String authKey = UUID.randomUUID().toString();
			String url = "http://localhost:9090/floworks/find/password/page" + "?authKey=" + authKey + "&id=" + id;
			Map<String, String> param = new HashMap<>();
			
			param.put("authKey", authKey);
			param.put("id", id);
			
			findPwdAuthService.insertFindPasswordAuth(param);

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			
			helper.setFrom("Floworks", "Floworks");
			helper.setTo(email);
			helper.setSubject("Floworks 비밀번호 변경 링크입니다.");
			helper.setText("<p>안녕하세요.</p>"
                         + "<p>다음 링크를 통해 비밀번호 변경을 완료하세요.</p>"
					     + "<p><a href='" + url + "'>이메일 인증</a></p>"
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
			
		} catch (SQLException e) {
			return ResponseEntity.status(500).body("unique_constraint_violated");
		}
	}
	
	@ResponseBody
	@PostMapping("/reset")
	public String resetEmail(String id, String email) throws MessagingException,UnsupportedEncodingException{

		try {
			
			findPwdAuthService.deleteFindPasswordAuth(id);
			findPassword(id, email);
			
			return "이메일이 재전송 되었습니다.";
			
		} catch (UnsupportedEncodingException | MessagingException e) {
			throw e;
		}
	}
	
	@ResponseBody
	@GetMapping("/user/email/check")
	public String userEmailCheck(String id, String email) {
		
		Map<String, String> param = new HashMap<>();
		
		param.put("id", id);
		param.put("email", email);
		
		boolean result = findPwdAuthService.selectUserEmail(param);
		return result ? "true" : "false";
	}
	
	@GetMapping("/page")
	public String authPage(String id, String authKey, Model model) {
		log.info("{},{}",id,authKey);
		
		model.addAttribute("id", id);
		model.addAttribute("authKey", authKey);
		
		return "/auth/passwordAuth";
	}
	
	@PostMapping("/update")
	public String authCheck(String id,
                            String authKey,
                            @RequestParam(value = "row-password") String password,
                            RedirectAttributes redirectAttr) {
		
		try {
			
			Map<String, String> param = new HashMap<>();
			
			param.put("id", id);
			param.put("authKey", authKey);
			param.put("password", bcryptPasswordEncoder.encode(password));
			
			int check = findPwdAuthService.selectCheck(param);
			
			if(check <= 0) {
				throw new IllegalArgumentException();
			}
			
			findPwdAuthService.updatePassword(param);
			findPwdAuthService.deleteFindPasswordAuth(id);
			redirectAttr.addFlashAttribute("msg", "비밀번호가 변경되었습니다.");
			
			return "redirect:/login";
			
		} catch (Exception e) {
			throw e;
		}
	}

}
