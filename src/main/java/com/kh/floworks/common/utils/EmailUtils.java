package com.kh.floworks.common.utils;

import java.util.ArrayList;
import java.util.List;

import com.kh.floworks.email.model.vo.Email;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class EmailUtils {
	
	public static String addCidToTag(String content, List<String> cid) {

		int srcStrartIndex = content.indexOf("src=\"/");
		int srcEndIndex = content.indexOf(" ", srcStrartIndex);
		int whileIndex = 0;
		log.info("srcStrartIndex{}",srcStrartIndex);
		while (srcStrartIndex != -1) {
			
			String src = content.substring(srcStrartIndex+4, srcEndIndex);
			log.info(src);
			content = content.replace(src, "\'cid:" + cid.get(whileIndex) + "'");
			
			whileIndex++;
			
			srcStrartIndex = content.indexOf("src=\"/");
			srcEndIndex = content.indexOf(" ", srcStrartIndex);
			
			break;
		}
		log.info(content);
		return content;
	}
	
	public static List<String> getFileNames(String content) {
		
		int srcStrartIndex = content.indexOf("editorEmailFile/");
		int srcEndIndex = content.indexOf(" ", srcStrartIndex);
		List<String> fileNames = new ArrayList<>();

		while (srcStrartIndex != -1) {
			
			String src = content.substring(srcStrartIndex+16, srcEndIndex-1);
			
			fileNames.add(src);
			
			srcStrartIndex = content.indexOf("src='/");
			srcEndIndex = content.indexOf(" ", srcStrartIndex);
			
			break;
		}
		
		return fileNames;
	}
	
	public static List<Email> shorteningLetters(List<Email> emailList){
		
		for(Email email : emailList) {
			
			String recipient = email.getRecipient();
			String externalRecipient = email.getExternalRecipient();
			String subject = email.getSubject();
			
			email.setSubject(subject.length() > 20 ? (subject.substring(0, 20) + "...") : subject);
			email.setRecipient(recipient != null && recipient.length() > 20 ? (recipient.substring(0, 20) + "...") : recipient);
			email.setExternalRecipient(externalRecipient != null && externalRecipient.length() > 20 ? (externalRecipient.substring(0, 20) + "...") : externalRecipient);
		}
		
		return emailList;
	}
}


