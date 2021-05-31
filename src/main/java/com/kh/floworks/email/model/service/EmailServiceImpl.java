package com.kh.floworks.email.model.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.floworks.common.Exception.NoMemberException;
import com.kh.floworks.email.model.dao.EmailDao;
import com.kh.floworks.email.model.vo.Email;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmailServiceImpl implements EmailService{
	
	@Autowired
	private EmailDao emailDao;
	
	@Override
	public int insertFile(Map<String, String> fileMap) {
		
		emailDao.insertEmailFiles(fileMap);
		
		return 1;
	}

	@Override
	public int insertEmail(Email email) {
		
		emailDao.insertEmail(email);
		
		String noMember = "";
		
		try {
			
		
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
			
			if(recipient.equals(", ") || recipient.equals("")) {
				continue;
			}
			
			noMember = recipient;
			
			paramMap.put("recipient", recipient);
			emailDao.insertIndox(paramMap);
		}
				
		emailDao.insertSent(emailNo);
		
		} catch (Exception e) {
			throw new NoMemberException(noMember);
		}

		return 1;
	}
	
	@Override
	public int insertDraftEmail(Email email) {
		return emailDao.insertDraftEmail(email);
	}
	
	@Override
	public List<Email> selectSentList(Map<String, Object> param) {
		return emailDao.selectSentList(param);
	}

	@Override
	public List<Email> selectInboxList(Map<String, Object> param) {
		return emailDao.selectInboxList(param);
	}
	
	@Override
	public List<Email> selectDraftList(Map<String, Object> param) {
		return emailDao.selectDraftList(param);
	}
	
	@Override
	public Email selectOneEmail(int emailNo) {
		return emailDao.selectOneEmail(emailNo);
	}

	@Override
	public Map<String, String> selectFile(int fileNo) {
		return emailDao.selectOneFile(fileNo);
	}
	
	@Override
	public Email selectOneDraftEmail(int emailNo) {
		return emailDao.selectOneDraftEmail(emailNo);
	}
	
	@Override
	public List<String> selectRecipientList(Map<String, String> param) {
		return emailDao.selectRecipientList(param);
	}
	
	@Override
	public List<Map<String, String>> selectFileList() {
		return emailDao.selectFileList();
	}
	
	@Override
	public Email selectOneEmailInbox(Map<String, Object> param) {
		return emailDao.selectOneEmailInbox(param);
	}
	
	@Override
	public Email selectOneEmailSent(int emailNo) {
		return emailDao.selectOneEmailSent(emailNo);
	}
	
	@Override
	public String selectProfileRename(String id) {
		return emailDao.selectProfileRename(id);
	}

	@Override
	public int updateDraftFile(Map<String, Object> param) {
		return emailDao.updateDraftFile(param);
	}

	@Override
	public int updateDraft(Email email) {
		return emailDao.updateDraft(email);
	}

	@Override
	public int updateStarredEmailInbox(Map<String, Object> param) {
		return emailDao.updateStarredEmailInbox(param);
	}

	@Override
	public int updateStarredEmailSent(Map<String, Object> param) {
		return emailDao.updateStarredEmailSent(param);
	}

	@Override
	public int deleteEmailInbox(Map<String, Object> param) {
		return emailDao.deleteEmailInbox(param);
	}
	
	@Override
	public int deleteFile(int fileNo) {
		return emailDao.deleteFile(fileNo);
	}

	@Override
	public int deleteDraft(int emailNo) {
		return emailDao.deleteDraft(emailNo);
	}

	@Override
	public int deleteEmailSent(Map<String, Object> param) {
		return emailDao.deleteEmailSent(param);
	}

	@Override
	public int deleteEmailDrafts(Map<String, Object> param) {
		return emailDao.deleteEmailDrafts(param);
	}


	@Override
	public int getTotalInboxEmail(String id) {
		return emailDao.getTotalInboxEmail(id);
	}

	@Override
	public int getTotalSentEmail(String id) {
		return emailDao.getTotalSentEmail(id);
	}

	@Override
	public int getTotalDraftsEmail(String id) {
		return emailDao.getTotalDraftsEmail(id);
	}
}
