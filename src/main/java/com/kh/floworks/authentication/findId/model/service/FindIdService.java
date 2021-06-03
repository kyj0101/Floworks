package com.kh.floworks.authentication.findId.model.service;

public interface FindIdService {

	boolean selectUserEmail(String email);

	String selectOneId(String email);

}
