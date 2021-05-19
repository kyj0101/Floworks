package com.kh.floworks.calendar.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Calendar {
	
	private int calendarNo;
	private String calendarId;
	private String subject;
	private String startDate;
	private String endDate;
	private String memo; //메모안에 장소도 적을 수 있음
	
}
