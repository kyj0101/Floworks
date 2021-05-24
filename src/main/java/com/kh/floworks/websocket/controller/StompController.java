package com.kh.floworks.websocket.controller;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;

import com.kh.floworks.websocket.Message;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StompController {

	@MessageMapping("/notice")
	@SendTo("/notice")
	public Message notice(@RequestBody Message msg) {
		//db저장 로직등이 가능
		log.info("/app/notice 요청 : {}", msg);
		return msg;
	}
	
	@MessageMapping("/notice/{memberId}")
	@SendTo("/notice/{memberId}")
	public String noticeToCertainMember(@DestinationVariable String memberId, String msg) {
		//db저장 로직등이 가능
		log.info("/app/notice/{} 요청 : {}", memberId, msg);
		return msg;
	}

}