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
	
	@GetMapping("/view")
	public String findPassword() {
		return "/login/findPassword";
	}


	@PostMapping("/send")
	public ResponseEntity<String> send(String id, String email) throws MessagingException,UnsupportedEncodingException {
		
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
			helper.setSubject("Floworks ???????????? ?????? ???????????????.");
			helper.setText("<p>???????????????.</p>"
                         + "<p>?????? ????????? ?????? ???????????? ????????? ???????????????.</p>"
					     + "<p><a href='" + url + "'>????????? ??????</a></p>"
					     + "<p>???????????????.</p>"
					     + "<p>- Floworks -</p>", true);
			
			mailSender.send(message);

			return ResponseEntity.ok()
					             .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					             .body("???????????? ?????????????????????.");
								
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
			send(id, email);
			
			return "???????????? ????????? ???????????????.";
			
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
                            String password,
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
			redirectAttr.addFlashAttribute("msg", "??????????????? ?????????????????????.");
			
			return "redirect:/login";
			
		} catch (Exception e) {
			throw e;
		}
	}

}
