package com.kh.floworks.attendance.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.floworks.attendance.model.service.AttendService;
import com.kh.floworks.authentication.email.controller.EmailAuthenticationController;
import com.kh.floworks.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/attendance")
@Slf4j
public class AttendanceController {

	@Autowired
	private AttendService attendService;
	
	@GetMapping("/attendanceView.do")
	public void attendanceView(Authentication authentication, @AuthenticationPrincipal Member member, Model model) {
		
		
		
		//1. 사용자입력값
		
		//2. 업무로직
		
		//3. jsp처리 위임
		
		model.addAttribute("loginMember", authentication.getPrincipal());
	}
}
