package com.kh.floworks.websocket.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class WebsocketConfiguration implements WebSocketConfigurer {
	
	@Autowired
	SocketHandler socketHandlerForAlarm;
	
	
	@Autowired
	SocketHandlerForViewChange socketHandlerForViewChange;
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry
			.addHandler(socketHandlerForAlarm, "/alarm_for_member")
			.withSockJS();
		
		registry
		.addHandler(socketHandlerForViewChange, "/alarm_for_changeView")
		.withSockJS();
		
	}

}