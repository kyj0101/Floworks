package com.kh.floworks.board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.floworks.board.model.vo.Post;
import com.kh.floworks.board.model.vo.PostFile;
import com.kh.floworks.board.model.vo.PostList;

public interface BoardDao {

	List<PostList> selectPostList(Map<String, Object> param);

	int getTotalContents();

	int insertPost(Post post);

	int insertPostFile(PostFile pFile);

	Post selectOnePostCollection(int postNo);

}
