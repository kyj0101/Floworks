package com.kh.floworks.board.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostComment {

	private int commentNo;
	private int commentLevel;
	private String commentContent;
	private Date commentDate;
	private String cmId;
	private int postNo;
	private int postCommentNo;
	private boolean commentDel;
	private String cmtName;
	private String cmtDeptName;
	
}
