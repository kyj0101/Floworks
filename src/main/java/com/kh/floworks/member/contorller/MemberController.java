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
