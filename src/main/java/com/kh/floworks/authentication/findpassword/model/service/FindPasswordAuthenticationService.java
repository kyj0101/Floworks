package com.kh.floworks.authentication.findpassword.model.service;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.stereotype.Service;


public interface FindPasswordAuthenticationService {

	int insertFindPasswordAuth(Map<String, String> param) throws SQLException;

	boolean selectUserEmail(Map<String, String> param);

	int deleteFindPasswordAuth(String id);

	int selectCheck(Map<String, String> param);

	int updatePassword(Map<String, String> param);
	
	
}
