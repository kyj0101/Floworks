package com.kh.floworks.websocket.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class StompConfiguration implements WebSocketMessageBrokerConfigurer {

	/**
	 * client 최초 접속 url을 설정
	 */
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry
			.addEndpoint("/stomp")
			.withSockJS();
	}


	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		//1. simpleBroker를 사용할 url prefix등록
		registry
			.enableSimpleBroker("/notice"); // /notice, /notice/honggd
		
		//2. application을 통해서 처리하는 경우. @MessageMapping("/a")로 연결된다.
		registry
			.setApplicationDestinationPrefixes("/app");
	}

	
}