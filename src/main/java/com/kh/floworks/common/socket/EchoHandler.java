package com.kh.floworks.common.socket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	//클라이언트가 서버접속 성공했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		 sessionList.add(session);
		 System.out.println("연결됨 : "+session.getId());
	}
	
	//클라이언트가 서버로 메시지를 전송할 때 실행되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message)throws Exception {
		System.out.println("받음 :"+message);
		String senderId = session.getId();
		for(WebSocketSession sess: sessionList) {
			sess.sendMessage(new TextMessage(senderId+":"+message.getPayload()));
		}
	}
	
	//클라이언트와의 연결이 끊겼을때 실행되는 메서드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		sessionList.remove(session);
		System.out.println("끊김 : "+session.getId());
	}
	
}