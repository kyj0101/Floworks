package com.kh.floworks.websocket;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Message {

	private String from;
	private String to;
	private String content;
	private String type;
	private long time;
	
}
