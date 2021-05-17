package com.kh.floworks.email.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.floworks.email.model.vo.Email;


public interface EmailService {
	
	int insertEmail(Email email);

	List<Email> selectSentList(String id);

	Email selectOneEmail(int emailNo);
	
	List<Email> selectInboxList(String id);
	
	Map<String, String> selectFile(int fileNo);

	int insertFile(Map<String, String> fileMap);

	List<String> selectRecipientList(Map<String, String> param);

	int insertDraftEmail(Email email);

	List<Email> selectDraftList(String id);

	Email selectOneDraftEmail(int emailNo);

	int updateDraftFile(Map<String, Object> param);

	int deleteFile(int fileNo);

	int updateDraft(Email email);

	List<Map<String, String>> selectFileList();

	int deleteDraft(int emailNo);

}
