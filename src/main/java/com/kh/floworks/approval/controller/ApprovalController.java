package com.kh.floworks.approval.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.floworks.approval.model.service.ApprovalService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/approval")
public class ApprovalController {
	
	@Autowired
	private ApprovalService apvlService;
	
	@GetMapping("/apvlWrite")
	public void apvlWrite() {
		
	}
	
	@GetMapping("/apvlProgress")
	public void apvlProgress() {
		
	}
	
	@GetMapping("/apvlBox")
	public void apvlBox() {
		
	}
	
}
