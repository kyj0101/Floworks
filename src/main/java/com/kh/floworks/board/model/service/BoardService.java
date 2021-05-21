package com.kh.floworks.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.floworks.board.model.vo.Post;
import com.kh.floworks.board.model.vo.PostFile;
import com.kh.floworks.board.model.vo.PostList;

public interface BoardService {

	List<PostList> selectPostList(Map<String, Object> param);

	int getTotalContents();

	int insertPost(Post post);

	PostList selectOnePostCollection(int postNo);

	PostFile selectOnePostFile(int postFile);

}
