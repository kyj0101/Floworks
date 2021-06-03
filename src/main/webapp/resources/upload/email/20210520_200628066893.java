package com.kh.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SpringbootController {
	
	@GetMapping("/")
	public String home() {
		log.info("home 요청!");
		return "forward:/index.jsp";
	}
}
