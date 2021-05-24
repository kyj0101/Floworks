package com.kh.floworks.authentication.findpassword.model.dao;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FindPasswordAuthenticationDaoImpl implements FindPasswordAuthenticationDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public int insertFindPasswordAuth(Map<String, String> param) throws SQLException {
		
		try {
			return session.insert("findPasswordAuth.insertFindPasswordAuth", param);	
			
		} catch (Exception e) {
			throw new SQLException();
		}
	}

	@Override
	public int selectUserEmail(Map<String, String> param) {
		return session.selectOne("findPasswordAuth.selectUserEmail", param);
	}

	@Override
	public int deleteFindPasswordAuth(String id) {
		return session.delete("findPasswordAuth.deleteFindPasswordAuth", id);
	}

	@Override
	public int selectCheck(Map<String, String> param) {
		return session.selectOne("findPasswordAuth.selectCheck", param);
	}

	@Override
	public int updatePassword(Map<String, String> param) {
		return session.update("findPasswordAuth.updatePassword", param);
	}
	
}
