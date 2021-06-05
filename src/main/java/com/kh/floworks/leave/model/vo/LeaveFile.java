package com.kh.floworks.leave.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LeaveFile {

	private int no;
	private String leaveId;
	private String originalFileName;
	private String renamedFileName;
	private Date uploadDate;
	private boolean status;
	
}
