package com.kh.floworks.leave.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LeaveRequest {

	private String leaveId;
	private String category;
	private String lvDuration;
	private String lvDates;
	private String reason;
	private String applicant;
	private Date reqDate;
	private String approver;
	private String apvlYn;
	private String delYn;
	private LeaveFile attach;
	private String workspaceId;
	private String applicantName;
}
