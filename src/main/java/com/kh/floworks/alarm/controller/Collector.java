package com.kh.floworks.alarm.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.floworks.alarm.model.service.AlarmService;
import com.kh.floworks.alarm.model.vo.Alarm;
import com.kh.floworks.email.model.vo.Email;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class Collector {
	
	@Autowired
	AlarmService alarmService;
	
	Alarm alarm = new Alarm();
	
	public void Emailtoss(Email email) {
		String alarmLink = "email/detail?emailNo="+email.getEmailNo()+"&listType=sent&id="+email.getId();
		
		alarm.setFromId(email.getId());
		alarm.setToId(email.getRecipient());
		alarm.setAlarmTime((Date)email.getTime());
		alarm.setTitle(email.getSubject());
		alarm.setCategory("e-mail");
		alarm.setIsChecked('N');
		alarm.setAlarmLink(alarmLink);
		
		System.out.println("\n\n\n\n");
		log.info("alarm = {}",alarm);
		System.out.println("\n\n\n\n\n");
		
		alarmService.insertAlarm(alarm);
		
		System.out.println("\n\n\n\n-----------------Email insert complete!---------------\n\n\n\n");
		
		
		
		
	}

}
