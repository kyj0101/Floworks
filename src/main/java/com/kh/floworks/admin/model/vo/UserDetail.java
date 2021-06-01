package com.kh.floworks.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDetail {

	private String id;
	private String name;
	private String departmentName;
	private String position;
	private String phone;
	private String address;
	private String email;
	private String hireDate;
	private char quitYn;
	private String role;
	
}
