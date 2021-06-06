package com.kh.floworks.websocket.config;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.kh.floworks.alarm.model.service.AlarmService;
import com.kh.floworks.alarm.model.vo.Alarm;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class SocketHandlerInHeader extends TextWebSocketHandler {
	
	/**
	 *
	 */
	private List<WebSocketSession> list = new CopyOnWriteArrayList<>();
	
	@Autowired
	private AlarmService alarmService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//session에 id값이 없어??
		list.add(session);
		log.info("이거 맞니?? list = {}",list);
		String id = session.getId();
		
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String id = session.getId();
		String payload = message.getPayload();
		
		//payload에는 input에 입력한 값 들어감 
		message = messageToJson(id, payload);
		
		log.info("handleTextMessage함수 : id ={} , payload ={}",id,payload);
		
		for(WebSocketSession sess : list) {
			sess.sendMessage(message);
		}
	}
	
	
	//여기서 alarm불러오는거 할거야
	private TextMessage messageToJson(String id, String payload) {
		
		System.out.println("id ="+id+", payload"+payload);
		List<Alarm> alarmList;
		Map<String, Object> map = new HashMap<>();
		
		if(payload != null) {
			alarmList = alarmService.selectAlarmList(payload);
			map.put("alarmList", alarmList);
			map.put("id", id);
			map.put("payload",payload);
			map.put("count", alarmList.size());
			log.info("messageToJson함수");
			log.info("message ={}",map);
		}
			
		return new TextMessage(new Gson().toJson(map));
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("closed함수 가동");
		list.remove(session);
	}

	
}