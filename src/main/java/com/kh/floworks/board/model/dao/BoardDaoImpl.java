package com.kh.floworks.board.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.board.model.vo.Post;
import com.kh.floworks.board.model.vo.PostComment;
import com.kh.floworks.board.model.vo.PostFile;
import com.kh.floworks.board.model.vo.PostList;

import lombok.extern.slf4j.Slf4j;



@Repository
@Slf4j
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<PostList> selectPostList(Map<String, Object> param, Map<String, Object> search) {
		int cPage = (int)param.get("cPage");
		
		int limit = (int)param.get("numPerPage");
		int offset = (cPage - 1) * limit; 
		
		RowBounds rowBounds = new RowBounds(offset, limit);
//		log.info("boardNo = {}", boardNo);

		log.info("search = {}", search);
		return session.selectList("board.selectPostList", search, rowBounds);
	}


	
	
	@Override
	public int getTotalContents(Map<String, Object> search) {
		return session.selectOne("board.getTotalContents", search);
	}

	@Override
	public int insertPost(Post post) {
		return session.insert("board.insertPost", post);
	}


	@Override
	public int insertPostFile(PostFile pFile) {
		return session.insert("board.insertFile", pFile);
	}
	
	
	@Override
	public PostList selectOnePostCollection(int postNo) {
		return session.selectOne("board.selectOnePostCollection", postNo);
	}

	@Override
	public PostFile selectOnePostFile(int postFile) {
		return session.selectOne("board.selectOnePostFile", postFile);
	}

	@Override
	public int updatePost(PostList postList) {
		return session.update("board.updatePost", postList);
	}

	@Override
	public int updatePostFile(PostFile pFile) {
		log.info("pFile = {}", pFile);
		return session.update("board.updatePostFile", pFile);
	}

	@Override
	public int updateDelPost(int postNo) {
		return session.update("board.updateDelPost", postNo);
	}

	@Override
	public Object rdCountPost(int postNo) {
		return session.update("board.rdCountPost", postNo);
	}

	@Override
	public int insertPostComment(PostComment postComment) {
		return session.insert("board.insertPostComment", postComment);
	}

	@Override
	public int commentDelete(int commentNo) {
		return session.update("board.commentDelete", commentNo);
	}


	@Override
	public List<Post> selectMainList() {
		return session.selectList("board.selectMainList");
	}


	
	
}
