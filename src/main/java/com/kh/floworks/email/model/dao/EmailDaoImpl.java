package com.kh.floworks.email.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
		
		try {
			return session.insert("email.insertIndox", param);
			
		} catch (Exception e) {
			throw e;
		}
	}
	
	@Override
	public int insertDraftEmail(Email email) {
		return session.insert("email.insertDraftEmail", email);
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
	public List<Email> selectSentList(Map<String, Object> param) {

		int cPage = (int)param.get("cPage");
		int limit = (int)param.get("numPerPage");
		int offset = (cPage - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		return session.selectList("email.selectSentList", param.get("id"), rowBounds);
	}

	@Override
	public List<Email> selectInboxList(Map<String, Object> param) {
		
		int cPage = (int)param.get("cPage");
		int limit = (int)param.get("numPerPage");
		int offset = (cPage - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		return session.selectList("email.selectInboxList", param.get("id"), rowBounds);
	}
	
	@Override
	public List<Email> selectDraftList(Map<String, Object> param) {
		
		int cPage = (int)param.get("cPage");
		int limit = (int)param.get("numPerPage");
		int offset = (cPage - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("email.selectDraftList", param.get("id"), rowBounds);
	}

	@Override
	public List<String> selectRecipientList(Map<String, String> param) {
		return session.selectList("email.selectRecipientList", param);
	}

	@Override
	public Email selectOneDraftEmail(int emailNo) {
		return session.selectOne("email.selectDraftEmail", emailNo);
	}

	@Override
	public int updateDraftFile(Map<String, Object> param) {
		return session.update("email.updateDraftFile", param);
	}

	@Override
	public int deleteFile(int fileNo) {
		return session.delete("email.deleteFile", fileNo);
	}

	@Override
	public int updateDraft(Email email) {
		return session.update("email.updateDraft", email);
	}

	@Override
	public List<Map<String, String>> selectFileList() {
		return session.selectList("email.selectFileList");
	}

	@Override
	public int deleteDraft(int emailNo) {
		return session.delete("email.deleteDraft", emailNo);
	}

	@Override
	public Email selectOneEmailInbox(Map<String, Object> param) {
		return session.selectOne("email.selectOneEmailInbox", param);
	}

	@Override
	public Email selectOneEmailSent(int emailNo) {
		return session.selectOne("email.selectOneEmailSent", emailNo);
	}
	
	@Override
	public String selectProfileRename(String id) {
		return session.selectOne("email.selectProfileRename", id);
	}

	@Override
	public int updateStarredEmailInbox(Map<String, Object> param) {
		return session.update("email.updateStarredEmailInbox", param);
	}

	@Override
	public int updateStarredEmailSent(Map<String, Object> param) {
		return session.update("email.updateStarredEmailSent", param);
	}

	@Override
	public int deleteEmailInbox(Map<String, Object> param) {
		return session.update("email.deleteEmailInbox", param);
	}

	@Override
	public int deleteEmailSent(Map<String, Object> param) {
		return session.update("email.deleteEmailSent", param);
	}

	@Override
	public int deleteEmailDrafts(Map<String, Object> param) {
		return session.update("email.deleteEmailDrafts", param);
	}

	@Override
	public int getTotalInboxEmail(String id) {
		return session.selectOne("email.getTotalInboxEmail", id);
	}

	@Override
	public int getTotalSentEmail(String id) {
		return session.selectOne("email.getTotalSentEmail", id);
	}

	@Override
	public int getTotalDraftsEmail(String id) {
		return session.selectOne("email.getTotalDraftsEmail", id);
	}


}
