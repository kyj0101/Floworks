package com.kh.floworks.email.model.service;

import java.util.List;
import java.util.Map;

import com.kh.floworks.email.model.vo.Email;


public interface EmailService {

	List<String> selectRecipientList(String searchKeyword);

	int insertEmail(Map<String, String> fileMap, Email email);

}
