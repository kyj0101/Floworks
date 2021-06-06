package com.kh.floworks.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttendList {

	private String id;
	private Date day;
	private String officeIn;
	private String officeOff;
	private String latenessYn;
	
}
