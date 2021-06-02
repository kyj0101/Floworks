package com.kh.floworks.websocket.config;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.floworks.alarm.controller.Collector;
import com.kh.floworks.alarm.model.service.AlarmService;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class SocketHandlerForViewChange extends TextWebSocketHandler {
	
	/**
	 *
	 */
	private List<WebSocketSession> list = new CopyOnWriteArrayList<>();
	
	@Autowired
	private AlarmService alarmService;

	@Autowired
	private Collector collector;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// session information
		list.add(session);
		log.info("?ù¥Í±? ÎßûÎãà?? list = {}",list);
			
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String link = message.getPayload();
		
		
		//String[] information = link.split(link, '$');
		
		String[] information = link.split("\\$");
		
		for(String s : information) {
			System.out.println(s);
		}
		
		System.out.println("\n\n\n\n\n");
		System.out.println("link : "+link);
		//System.out.println(information[0]);
		//System.out.println(information[1]);
		System.out.println("\n\n\n\n");
		//String[] information = link.split("$");
		
	
		collector.alarmYNToss(information);
		
		
	}
	
	

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("closed?ï®?àò Í∞??èô");
		list.remove(session);
	}

	
}