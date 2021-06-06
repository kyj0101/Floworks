package com.kh.floworks.alarm.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.floworks.alarm.model.service.AlarmService;
import com.kh.floworks.alarm.model.vo.Alarm;
import com.kh.floworks.alarm.model.vo.AlarmYN;
import com.kh.floworks.email.model.vo.Email;
import com.kh.floworks.websocket.config.SocketHandler;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class Collector {
	
	@Autowired
	AlarmService alarmService;
	
	@Autowired
	SocketHandler socketHandlerForAlarm;
	
	Alarm alarm = new Alarm();
	AlarmYN alarmYN= new AlarmYN();
	
	
	public void Emailtoss(Email email) throws Exception {
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
		
		socketHandlerForAlarm.afterInsertEmail(alarm.getToId());
		
		
	}

	public void alarmYNToss(String[] information) {
		alarmYN.setYN("Y");
		alarmYN.setToId(information[0]);
		alarmYN.setAlarmLink(information[1]);
		
		alarmService.changeView(alarmYN);
		
	}
	
	public void approvalAlarmToss() {
		
	}

}
