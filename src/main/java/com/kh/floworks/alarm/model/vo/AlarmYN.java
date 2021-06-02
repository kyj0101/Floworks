package com.kh.floworks.alarm.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AlarmYN {
	private String YN;
	private String toId;
	private String alarmLink;
}
