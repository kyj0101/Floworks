package com.kh.floworks.authentication.findpassword.model.service;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.floworks.authentication.findpassword.model.dao.FindPasswordAuthenticationDao;

@Service
public class FindPasswordAuthenticationServiceImpl implements FindPasswordAuthenticationService{
	
	@Autowired
	private FindPasswordAuthenticationDao findPwdAuthDao;
	
	@Override
	public int insertFindPasswordAuth(Map<String, String> param) throws SQLException {
		
		try {
			return findPwdAuthDao.insertFindPasswordAuth(param);
		
		} catch (SQLException e) {
			throw e;
		}
	}

	@Override
	public boolean selectUserEmail(Map<String, String> param) {
		
		int result = findPwdAuthDao.selectUserEmail(param);
		
		return result == 1;
	}

	@Override
	public int deleteFindPasswordAuth(String id) {
		return findPwdAuthDao.deleteFindPasswordAuth(id);
	}

	@Override
	public int selectCheck(Map<String, String> param) {
		return findPwdAuthDao.selectCheck(param);
	}

	@Override
	public int updatePassword(Map<String, String> param) {
		return findPwdAuthDao.updatePassword(param);
	}
}
