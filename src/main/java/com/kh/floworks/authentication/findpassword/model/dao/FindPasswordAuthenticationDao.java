package com.kh.floworks.authentication.findpassword.model.dao;

import java.sql.SQLException;
import java.util.Map;

public interface FindPasswordAuthenticationDao {

	int insertFindPasswordAuth(Map<String, String> param) throws SQLException;

	int selectUserEmail(Map<String, String> param);

	int deleteFindPasswordAuth(String id);

	int selectCheck(Map<String, String> param);

	int updatePassword(Map<String, String> param);

}
