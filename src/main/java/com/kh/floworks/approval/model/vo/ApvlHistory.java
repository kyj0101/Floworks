package com.kh.floworks.approval.model.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApvlHistory {

	private String apvlId;
	private Timestamp timelog;
	private String status;
	
}
