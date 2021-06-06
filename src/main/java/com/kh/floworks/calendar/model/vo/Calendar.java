package com.kh.floworks.calendar.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Calendar {
	
	private int calNo;
	private String id;			//NOT NULL
	private String subject;		//NOT NULL
	private String startDate;
	private String endDate;
	
}
