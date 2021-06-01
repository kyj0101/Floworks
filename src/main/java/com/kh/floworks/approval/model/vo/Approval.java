package com.kh.floworks.approval.model.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Approval {
	
	private String apvlId;
	private String category;
	private String approver1;
	private String approver2;
	private String approver3;
	private String approver4;
	private String title;
	private String content;
	private Timestamp reqDate;
	private Date dueDate;
	private String writer;
	private String workspaceId;
	private String delYn;
	
	private Timestamp timelog1;
	private Timestamp timelog2;
	private Timestamp timelog3;
	private Timestamp timelog4;
	private String comment1;
	private String comment2;
	private String comment3;
	private String comment4;
	private String status1;
	private String status2;
	private String status3;
	private String status4;
	
	private List<ApvlFile> afList;
	
}
