package com.kh.floworks.board.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Post {

	private int postNo;
	private int boardNo;
	private String id;
	private String postTitle;
	private String postContent;
	private Date postDate;
	private int postReadCount;
	private boolean postDel;
	private String workspaceId;
	
	private int fileCount;			
	private List<PostFile> postFileList;

	private int commentCount;			

}
