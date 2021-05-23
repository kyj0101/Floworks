package com.kh.floworks.authentication.model.service;

import com.kh.floworks.authentication.model.vo.EmailAuthentication;

public interface EmailAuthenticationService {

	int insertEmailAuth(EmailAuthentication emailAuth);

	int updateEmailAuthStatus(EmailAuthentication emailAuth);

	int deleteEmailAuth(String email);

}
