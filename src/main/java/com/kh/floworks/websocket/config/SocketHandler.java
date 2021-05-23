package com.kh.floworks.websocket.config;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class SocketHandler extends TextWebSocketHandler {
	
	/**
	 * 접속한 사용자를 관리
	 * 
	 * CopyOnWriteArrayList - ArrayList를 확장해서 동기화처리 지원.
	 */
	private List<WebSocketSession> list = new CopyOnWriteArrayList<>();
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		list.add(session);
		//log.info("새로운 세션 : {}", session);
		//log.info("현재 세션 수(+) : {}", list.size());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String id = session.getId();
		String payload = message.getPayload();
		//log.info("메세지 - id[{}] : {}", id, payload);
		
		message = messageToJson(id, payload);
		
		for(WebSocketSession sess : list) {
			sess.sendMessage(message);
		}
	}

	private TextMessage messageToJson(String id, String payload) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("message", payload);
		map.put("type", "message");
		map.put("time", System.currentTimeMillis());
		return new TextMessage(new Gson().toJson(map));
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		list.remove(session);
		//log.info("현재 세션 수(-) : {}", list.size());
	}

	
}