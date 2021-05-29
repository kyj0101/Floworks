package com.kh.floworks.attendance.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Attendance {

	private String id;
	private Date date;
	private Date attendTime;
	private Date leaveTime;
	private int holiday;
	
}
