package com.kh.floworks.authentication.findId.model.dao;

public interface FindIdDao {

	int selectUserEmail(String email);

	String selectOneId(String email);

}
