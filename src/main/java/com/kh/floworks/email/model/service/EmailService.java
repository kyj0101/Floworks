package com.kh.floworks.email.model.service;

import java.util.List;
import java.util.Map;

import com.kh.floworks.email.model.vo.Email;


public interface EmailService {
	
	int insertEmail(Email email);

	int insertFile(Map<String, String> fileMap);

	int insertDraftEmail(Email email);

	List<Email> selectSentList(String id);

	Email selectOneEmail(int emailNo);
	
	List<Email> selectInboxList(String id);
	
	Map<String, String> selectFile(int fileNo);

	List<String> selectRecipientList(Map<String, String> param);

	List<Email> selectDraftList(String id);

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


}
