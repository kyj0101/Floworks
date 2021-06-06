package com.kh.floworks.websocket.config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
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
public class SocketHandler extends TextWebSocketHandler {
	
	/**
	 *
	 */
	private List<WebSocketSession> list = new CopyOnWriteArrayList<>();
	private List<Map<String,String>> connect =new ArrayList<>();
	private TextMessage message;
	
	@Autowired
	private AlarmService alarmService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//여기에서 session값을 아예 설정해버리자
		
		//session에 id값이 없어??
		list.add(session);
		//log.info("헤더에 있는 session 모음 list = {}",list);
		String id = session.getId();
		//log.info("session_id = {}\n\n",id);
		
	}
	
	
	//여기는 최종 설정
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String id = session.getId();
		String payload = message.getPayload();
		Map<String, String> con = new HashMap<>();
		con.put("web_id",id);
		con.put("real_id", payload);
		connect.add(con);
		
		
		//payload에는 input에 입력한 값 들어감 
		message = selectMemberAllAlarm(id, payload);
		session.sendMessage(message);
//		
//		for(WebSocketSession sess : list) {
//			sess.sendMessage(message);
//		}
	}
	
	private TextMessage selectMemberAllAlarm(String id, String payload) {
		
		System.out.println("id ="+id+", payload"+payload);
		List<Alarm> alarmList;
		Map<String, Object> map = new HashMap<>();
		
		if(payload != null) {
			alarmList = alarmService.selectAlarmList(payload);
			map.put("alarmList", alarmList);
			map.put("id", id);
			map.put("payload",payload);
			map.put("count", alarmList.size());
			log.info("\n\nmessageToJson함수");
			log.info("message ={}\n\n",map);
		}
			
		return new TextMessage(new Gson().toJson(map));
	}
	
	//여기서 alarm불러오는거 할거야
	private TextMessage plusAlarm(String id, String payload) {
		
		System.out.println("id ="+id+", payload"+payload);
		List<Alarm> alarmList;
		Map<String, Object> map = new HashMap<>();
		
		if(payload != null) {
			alarmList = alarmService.selectAlarmList(payload);
			map.put("alarmList", alarmList);
			map.put("id", id);
			map.put("payload",payload);
			map.put("count", alarmList.size());
			log.info("\n\nmessageToJson함수");
			log.info("message ={}\n\n",map);
		}
			
		return new TextMessage(new Gson().toJson(map));
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//log.info("closed함수 가동");
		list.remove(session);
		for(int i=0; i<connect.size(); i++) {
			if(connect.get(i).get("web_id").equals(session.getId())) {
				connect.remove(i);
				break;
			}
		}
	}

	public void afterInsertEmail(String toId) throws Exception{
		
		//log.info("\n\n\n---------------------이곳에 당도하였는가요?--------------------\n\n\n");
		
		try {
			///=log.info("session 모음 list = {}",list);
			for(int i=0; i<connect.size(); i++) {

			//	System.out.println(i+1+"번째 : connect:{"+connect.get(i).get("web_id")+","+connect.get(i).get("real_id")+"}, session={"+list.get(i)+"}\n");
				if(connect.get(i).get("real_id").equals(toId) &&connect.get(i).get("web_id").equals(list.get(i).getId())){
					message = plusAlarm(connect.get(i).get("web_id"), toId);
					list.get(i).sendMessage(message);
					break;
				}
				else {
					continue;
				}
			}
		}catch(Exception e) {
			throw e;
		}
		
	}
}