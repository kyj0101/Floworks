package com.kh.floworks.search.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.email.model.vo.Email;

@Repository
public class SearchDaoImpl implements SearchDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Map<String, Object>> selectSearchPostList(Map<String, Object> param) {
		
		int cPage = (int)param.get("cPage");
		int limit = (int)param.get("numPerPage");
		int offset = (cPage - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("search.selectSearchBoardList", param, rowBounds);
	}
	
	@Override
	public List<Email> selectSearchEmailSent(Map<String, Object> param) {
		
		int cPage = (int)param.get("cPage");
		int limit = (int)param.get("numPerPage");
		int offset = (cPage - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("search.selectSearchEmailSent", param, rowBounds);
	}

	@Override
	public int getTotalSearchPost(String keyword) {
		return session.selectOne("search.getTotalSearchPost", keyword);
	}
	
	@Override
	public int getTotalSearchEmailSent(Map<String, Object> param) {
		return session.selectOne("search.getTotalSearchEmailSent", param);
	}
}
