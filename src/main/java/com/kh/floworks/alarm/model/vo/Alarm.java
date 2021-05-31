package com.kh.floworks.alarm.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Alarm {
	private String fromId;
	private String toId;
	private Date alarmTime;
	private String title;
	private String category;
	private char isChecked;
	private String alarmLink;
}
