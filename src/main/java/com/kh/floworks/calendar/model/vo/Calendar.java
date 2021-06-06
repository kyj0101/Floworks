package com.kh.floworks.calendar.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Calendar {
	private int calNo;
	private String id;
	private String subject;
	private String startDate;
	private String endDate;
	
}
