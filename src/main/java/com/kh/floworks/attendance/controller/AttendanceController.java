package com.kh.floworks.attendance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.floworks.attendance.model.service.AttendService;
import com.kh.floworks.authentication.email.controller.EmailAuthenticationController;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/")
@Slf4j
public class AttendanceController {

	@Autowired
	private AttendService attendService;
	
	
}
