package com.kh.floworks.attendance.model.vo;



import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Attendance {

	private String id;
	private Date day;
	private Date officeIn;
	private Date officeOff;
	private String latenessYn;
	
}
