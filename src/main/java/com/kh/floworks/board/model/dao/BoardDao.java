package com.kh.floworks.board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.floworks.board.model.vo.Post;
import com.kh.floworks.board.model.vo.PostComment;
import com.kh.floworks.board.model.vo.PostFile;
import com.kh.floworks.board.model.vo.PostList;

public interface BoardDao {

	List<PostList> selectPostList(Map<String, Object> param,  int boardNo);

	int getTotalContents(int boardNo);

	int insertPost(Post post);

	int insertPostFile(PostFile pFile);

	PostList selectOnePostCollection(int postNo);

	PostFile selectOnePostFile(int postFile);

	int updatePost(PostList postList);

	int updatePostFile(PostFile pFile);

	int updateDelPost(int postNo);

	Object rdCountPost(int postNo);

	int insertPostComment(PostComment postComment);

	int commentDelete(int commentNo);


	List<PostList> selectdeptList(String dept);

	List<Post> selectMainList();



}
