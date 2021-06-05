package com.kh.floworks.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User{
	
	private String id;
	private String workspaceId;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String quitYn;
	private String role;

	
}
