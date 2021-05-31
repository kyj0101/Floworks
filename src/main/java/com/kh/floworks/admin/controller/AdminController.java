package com.kh.floworks.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.floworks.admin.model.service.AdminService;
import com.kh.floworks.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@GetMapping("/memberList.do")
	public void memberList(Authentication authentication, @AuthenticationPrincipal Member member, Model model) {
			
			//1. 사용자입력값
			
			//2. 업무로직
			
			//3. jsp처리 위임
			
			model.addAttribute("loginMember", authentication.getPrincipal());
	}
	
	@GetMapping("/attendList.do")
	public void attendanceList(Authentication authentication, @AuthenticationPrincipal Member member, Model model) {
			
			//1. 사용자입력값
			
			//2. 업무로직
			
			//3. jsp처리 위임
			
			model.addAttribute("loginMember", authentication.getPrincipal());
	}
	
}