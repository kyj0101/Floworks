package com.kh.floworks.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDetail {

	private String workspaceId;
	private String id;
	private String name;
	private String department;
	private String position;
	private String phone;
	private String address;
	private String email;
	private String hireDate;
	private String resignDate;
	private char resignYN;
	
}
