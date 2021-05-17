package com.kh.floworks.email.model.vo;



import java.util.Date;

import lombok.Data;

@Data
public class Email {
	
	private int emailNo;
	private String id;
	private String recipient;
	private String externalRecipient;
	private String emailCC;
	private String emailBCC;
	private String subject;
	private String emailContent;
	private int fileNo;
	private String emailStarred;
	private Date time;
	
}
