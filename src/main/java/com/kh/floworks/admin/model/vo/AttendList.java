package com.kh.floworks.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttendList {

	private String id;
	private String day;
	private String officeIn;
	private String officeOff;
	private char latenessYn;
	
}
