package com.kh.floworks.email.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.floworks.email.model.vo.Email;


public interface EmailService {
	
	List<String> selectRecipientList(String searchKeyword);

	int insertEmail(Email email);

	List<Email> selectSentList(String id);

	Email selectOneEmail(int emailNo);
	
	Map<String, String> selectFile(int fileNo);

	int insertFile(Map<String, String> fileMap);

}
