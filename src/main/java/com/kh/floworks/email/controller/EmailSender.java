package com.kh.floworks.email.controller;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//@Controller
public class EmailSender {
	//@Autowired 
//	private JavaMailSenderImpl mailSender;
//	
//	@RequestMapping(value = "/sendMail.do") 
//	public String sendMail() { 
//		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
//			@Override public void prepare(MimeMessage mimeMessage) throws Exception { 
//				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
//	
//				helper.setFrom(new InternetAddress("test@flowork.com","VISITOR")); 
//				helper.setTo("fbimj90@naver.com"); 
//				helper.setSubject("ㅎ2"); 
//				helper.setText("zzzz우왕 굿", true); 
//				
//			} 
//		}; 
//		mailSender.send(preparator); 
//		
//		return "result"; 
//	}

	
}
