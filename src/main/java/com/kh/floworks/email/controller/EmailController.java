package com.kh.floworks.email.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/email")
public class EmailController {
	
	@GetMapping("/list")
	public String emailList(){
		return "/email/emailList";
	}
	
	@GetMapping("/compose")
	public String emailCompose() {
		return "/email/emailCompose";
	}
}
