package com.kh.floworks.websocket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class WebsocketController {

	@GetMapping("/websocket/ws.do")
	public void websocket() {
		
	}
	
	@GetMapping("/websocket/stomp.do")
	public void stomp() {
		
	}
}
