package com.kh.floworks.common.Exception;

public class NoMemberException extends RuntimeException {

	public NoMemberException() {
		super();
	}

	public NoMemberException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public NoMemberException(String message, Throwable cause) {
		super(message, cause);
	}

	public NoMemberException(String message) {
		super(message);
	}

	public NoMemberException(Throwable cause) {
		super(cause);
	}
	
	
}
