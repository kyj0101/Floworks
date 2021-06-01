package com.kh.floworks.approval.model.vo;

import java.util.Date;
import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApvlDoc {

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
	
	private List<ApvlFile> afList;
}
