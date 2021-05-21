package com.kh.floworks.email.model.service;

import java.util.List;
import java.util.Map;

import com.kh.floworks.email.model.vo.Email;


public interface EmailService {
	
	int insertEmail(Email email);

	int insertFile(Map<String, String> fileMap);

	int insertDraftEmail(Email email);

	Email selectOneEmail(int emailNo);

	List<Email> selectSentList(Map<String, Object> param);
	
	List<Email> selectInboxList(Map<String, Object> param);
	
	List<Email> selectDraftList(Map<String, Object> param);

	Map<String, String> selectFile(int fileNo);

	List<String> selectRecipientList(Map<String, String> param);

	Email selectOneDraftEmail(int emailNo);

	List<Map<String, String>> selectFileList();

	int updateDraftFile(Map<String, Object> param);

	int updateDraft(Email email);

	int deleteFile(int fileNo);

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
