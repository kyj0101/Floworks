package com.kh.floworks.member.contorller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@GetMapping("/login")
	public void login() {}
	
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
