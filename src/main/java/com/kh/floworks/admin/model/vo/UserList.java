package com.kh.floworks.admin.model.vo;

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
	private String department;
	private String position;
	private String hireDate;
	private char resignYN;
	
}
