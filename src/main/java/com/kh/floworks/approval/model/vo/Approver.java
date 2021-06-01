package com.kh.floworks.approval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Approver {
	
	private String userId;
	private String name;
	private String dept;
	private String position;
}
