package com.kh.floworks.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.floworks.board.model.vo.Post;
import com.kh.floworks.board.model.vo.PostComment;
import com.kh.floworks.board.model.vo.PostFile;
import com.kh.floworks.board.model.vo.PostList;

public interface BoardService {

	List<PostList> selectPostList(Map<String, Object> param, int boardNo);

	int getTotalContents(int boardNo);

	int insertPost(Post post);

	PostList selectOnePostCollection(int postNo);

	PostFile selectOnePostFile(int postFile);

	int updatePost(PostList postList);

	int updateDelPost(int postNo);

	void rdCountPost(int postNo);

	int insertPostComment(PostComment postComment);

	int commentDelete(int commentNo);


	List<PostList> selectdeptList(String dept);

	List<Post> selectMainList();




}
