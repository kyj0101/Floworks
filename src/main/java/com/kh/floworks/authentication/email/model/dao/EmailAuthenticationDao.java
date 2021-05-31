package com.kh.floworks.authentication.email.model.dao;

import com.kh.floworks.authentication.email.model.vo.EmailAuthentication;

public interface EmailAuthenticationDao {

	int insertEmailAuth(EmailAuthentication emailAuth);

	int updateEmailAuthStatus(EmailAuthentication emailAuth);

	int deleteEmailAuth(String email);

}
