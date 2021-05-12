package com.kh.floworks.member.contorller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@GetMapping("/login")
	public String login() {
		
		return "/member/login";
	}
	
	
	@PostMapping("/login") //로그인 처리 X  | 로그인 실패 후 POST 요청 처리 O 
	public String loginFail() {
		
		return "/member/login";
	}
	
	@GetMapping(value={"/mypage","/mypage/update"})
	public String mypage() {
		
		return "/member/memberUpdate";
	}
	
}
