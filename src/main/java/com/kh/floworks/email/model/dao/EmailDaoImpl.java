package com.kh.floworks.email.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.email.model.vo.Email;

@Repository
public class EmailDaoImpl implements EmailDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<String> selectRecipientList(String searchKeyword) {
		return session.selectList("email.selectRecipientList", searchKeyword);
	}

	@Override
	public int insertEmailFiles(Map<String, String> fileMap) {
		return session.insert("email.insertEmailFile", fileMap);
	}
	
	@Override
	public int insertEmail(Email email) {
		return session.insert("email.insertEmail", email);
		
	}


	@Override
	public int insertSent(int emailNo) {
		return session.insert("email.insertSent", emailNo);
	}


	@Override
	public int insertIndox(Map<String, Object> param) {
		return session.insert("email.insertIndox", param);
	}


}
