package com.kh.floworks.authentication.findId.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FindIdDaoImpl implements FindIdDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public int selectUserEmail(String email) {
		return session.selectOne("findId.selectUserEmail", email);
	}

	@Override
	public String selectOneId(String email) {
		return session.selectOne("findId.selectOneId", email);
	}
}
