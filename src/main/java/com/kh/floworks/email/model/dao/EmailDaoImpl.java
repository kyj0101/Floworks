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
	
	@Override
	public int insertDraftEmail(Email email) {
		return session.insert("email.insertDraftEmail", email);
	}

	@Override
	public List<Email> selectSentList(String id) {
		return session.selectList("email.selectSentList", id);
	}

	@Override
	public Email selectOneEmail(int emailNo) {
		return session.selectOne("email.selectOneEmail", emailNo);
	}

	@Override
	public Map<String, String> selectOneFile(int fileNo) {
		return session.selectOne("email.selectOneFile", fileNo);
	}

	@Override
	public List<Email> selectInboxList(String id) {
		return session.selectList("email.selectInboxList", id);
	}

	@Override
	public List<String> selectRecipientList(Map<String, String> param) {
		return session.selectList("email.selectRecipientList", param);
	}

	@Override
	public List<Email> selectDraftList(String id) {
		return session.selectList("email.selectDraftList", id);
	}

	@Override
	public Email selectOneDraftEmail(int emailNo) {
		return session.selectOne("email.selectDraftEmail", emailNo);
	}


}
