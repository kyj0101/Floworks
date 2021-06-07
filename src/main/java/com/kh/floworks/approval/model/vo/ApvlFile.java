package com.kh.floworks.approval.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApvlFile {
	
	private int idx;
	private String approvalID;
	private String originalFileName;
	private String renamedFileName;
	private Date uploadDate;
	private boolean status;
	
}
