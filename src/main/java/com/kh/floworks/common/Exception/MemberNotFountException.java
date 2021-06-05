package com.kh.floworks.common.Exception;

import org.springframework.security.core.AuthenticationException;

public class MemberNotFountException extends AuthenticationException {

	private static final long serialVersionUID = 1L;

	public MemberNotFountException(String msg) {
		super(msg);
	}

}
