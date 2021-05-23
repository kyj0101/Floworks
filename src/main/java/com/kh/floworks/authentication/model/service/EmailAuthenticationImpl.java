package com.kh.floworks.authentication.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.floworks.authentication.model.dao.EmailAuthenticationDao;
import com.kh.floworks.authentication.model.vo.EmailAuthentication;

@Service
public class EmailAuthenticationImpl implements EmailAuthenticationService{

	@Autowired
	EmailAuthenticationDao emailAuthDao;
	
	@Override
	public int insertEmailAuth(EmailAuthentication emailAuth) {
		return emailAuthDao.insertEmailAuth(emailAuth);
	}

	@Override
	public int updateEmailAuthStatus(EmailAuthentication emailAuth) {
		return emailAuthDao.updateEmailAuthStatus(emailAuth);
	}

	@Override
	public int deleteEmailAuth(String email) {
		return emailAuthDao.deleteEmailAuth(email);
	}

}
