package com.kh.floworks.calendar.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Calendar {
	
	private String id;
	private String title;
	private String startDate;
	private String endDate;
	
}
