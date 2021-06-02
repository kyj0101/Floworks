package com.kh.floworks.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserList {

	private String workspaceId;
	private String id;
	private String name;
	private String role;
	private String departmentName;
	private String position;
	private Date hireDate;
	private boolean quitYN;
	

}







