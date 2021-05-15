package com.kh.floworks.email.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.floworks.email.model.vo.Email;

public interface EmailDao {

	List<String> selectRecipientList(String searchKeyword);

	int insertEmailFiles(Map<String, String> fileMap);

	int insertEmail(Email email);

	int insertSent(int emailNo);

	int insertIndox(Map<String, Object> param);

	List<Email> selectSentList(String id);

	Email selectOneEmail(int emailNo);

	Map<String, String> selectOneFile(int fileNo);



}
