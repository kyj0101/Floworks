package com.kh.floworks.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Users {

	private String id;
	private String name;
	private String department;
	private String phone;
	private String address;
	private String hireDate;
	private String resignDate;
	private String resignYN;
}
