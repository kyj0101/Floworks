package com.kh.floworks.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.board.model.vo.Post;
import com.kh.floworks.board.model.vo.PostFile;
import com.kh.floworks.board.model.vo.PostList;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<PostList> selectPostList(Map<String, Object> param) {
		int cPage = (int)param.get("cPage");
		
		int limit = (int)param.get("numPerPage");
		int offset = (cPage - 1) * limit; 
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("board.selectPostList", null, rowBounds);
	}

	@Override
	public int getTotalContents() {
		return session.selectOne("board.getTotalContents");
	}

	@Override
	public int insertPost(Post post) {
		return session.insert("board.insertPost", post);
	}

	@Override
	public Post selectOnePostCollection(int postNo) {
		return session.selectOne("board.selectOnePostCollection", postNo);
	}

	@Override
	public int insertPostFile(PostFile pFile) {
		return session.insert("board.insertFile", pFile);
	}
}
