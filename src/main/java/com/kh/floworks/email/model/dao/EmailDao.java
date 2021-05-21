package com.kh.floworks.email.model.dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.kh.floworks.email.model.vo.Email;

public interface EmailDao {

	int insertEmailFiles(Map<String, String> fileMap);

	int insertEmail(Email email);

	int insertSent(int emailNo);

	int insertIndox(Map<String, Object> param);

	List<Email> selectSentList(Map<String, Object> param);

	List<Email> selectInboxList(Map<String, Object> param);

	List<Email> selectDraftList(Map<String, Object> param);

	Email selectOneEmail(int emailNo);

	Map<String, String> selectOneFile(int fileNo);

	Email selectOneDraftEmail(int emailNo);

	List<String> selectRecipientList(Map<String, String> param);

	int insertDraftEmail(Email email);

	int updateDraftFile(Map<String, Object> param);
	
	int deleteFile(int fileNo);

	int updateDraft(Email email);

	List<Map<String, String>> selectFileList();

	int deleteDraft(int emailNo);

	Email selectOneEmailInbox(Map<String, Object> param);

	Email selectOneEmailSent(int emailNo);

	int updateStarredEmailInbox(Map<String, Object> param);

	int updateStarredEmailSent(Map<String, Object> param);

	int deleteEmailInbox(Map<String, Object> param);

	int deleteEmailSent(Map<String, Object> param);

	int deleteEmailDrafts(Map<String, Object> param);

	int getTotalInboxEmail(String id);

	int getTotalSentEmail(String id);

	int getTotalDraftsEmail(String id);

}
