package com.kh.floworks.leave.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Leave {

	private String id;
	private double dayoffCnt; // 신청한 휴가일 수
	
}
