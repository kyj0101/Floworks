package com.kh.floworks.email.model.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.floworks.email.model.dao.EmailDao;
import com.kh.floworks.email.model.vo.Email;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmailServiceImpl implements EmailService{
	
	@Autowired
	private EmailDao emailDao;

	@Override
	public List<String> selectRecipientList(String searchKeyword) {
		return emailDao.selectRecipientList(searchKeyword);
	}

	@Override
	public int insertEmail(Map<String, String> fileMap, Email email) {

		//insertFile
		if(fileMap.size() > 0) {
			emailDao.insertEmailFiles(fileMap);
		}
		
		String strNo = String.valueOf(fileMap.get("no"));
		int no = Integer.valueOf(strNo);
		email.setFileNo(no);
		
		//insertEmail
		emailDao.insertEmail(email);
		int emailNo = email.getEmailNo();
		
		
		String allRecipient = email.getRecipient()
				            + ", "
				            + email.getEmailCC()
				            + ", "
				            + email.getEmailBCC();
		List<String> allRecipientList = Arrays.asList(allRecipient.split(", "));
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("emailNo", emailNo);
		
		for(String recipient : allRecipientList) {
			
			paramMap.put("recipient", recipient);
			
			emailDao.insertIndox(paramMap);
		}
				
		emailDao.insertSent(emailNo);

		return 1;
	}



	
	
}
