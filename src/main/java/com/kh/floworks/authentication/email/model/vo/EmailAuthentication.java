package com.kh.floworks.authentication.email.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmailAuthentication {
	private String email;
	private String authKey;
	private String authStatus;
}
