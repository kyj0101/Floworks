package com.kh.floworks.authentication.model.dao;

import com.kh.floworks.authentication.model.vo.EmailAuthentication;

public interface EmailAuthenticationDao {

	int insertEmailAuth(EmailAuthentication emailAuth);

	int updateEmailAuthStatus(EmailAuthentication emailAuth);

	int deleteEmailAuth(String email);

}
