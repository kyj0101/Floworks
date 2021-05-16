package com.kh.floworks.email.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.floworks.email.model.vo.Email;

public interface EmailDao {

	int insertEmailFiles(Map<String, String> fileMap);

	int insertEmail(Email email);

	int insertSent(int emailNo);

	int insertIndox(Map<String, Object> param);

	List<Email> selectSentList(String id);

	Email selectOneEmail(int emailNo);

	Map<String, String> selectOneFile(int fileNo);

	List<Email> selectInboxList(String id);

	List<String> selectRecipientList(Map<String, String> param);

	int insertDraftEmail(Email email);

	List<Email> selectDraftList(String id);

	Email selectOneDraftEmail(int emailNo);

}
