package com.kh.floworks.authentication.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.authentication.model.vo.EmailAuthentication;

@Repository
public class EmailAuthenticationDaoImpl implements EmailAuthenticationDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public int insertEmailAuth(EmailAuthentication emailAuth) {
		return session.insert("emailAuth.insertEmailAuth", emailAuth);
	}

	@Override
	public int updateEmailAuthStatus(EmailAuthentication emailAuth) {
		return session.update("emailAuth.updateEmailAuthStatus", emailAuth);
	}

	@Override
	public int deleteEmailAuth(String email) {
		return session.delete ("emailAuth.deleteEmailAuth", email);
	}
}
