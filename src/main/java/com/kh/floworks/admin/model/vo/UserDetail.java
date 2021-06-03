package com.kh.floworks.admin.model.vo;

import java.util.Date;

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
	private String departmentName;
	private String position;
	private String phone;
	private String email;
	private String address;
	private Date hireDate;
	private String quitYn;
	private String role;
	private String leave;
	
}
