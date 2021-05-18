package com.kh.floworks.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostFile {

	private int no;
	private int postNo;
	private String postOriginalFileName;
	private String postRenamedFileName;
}
