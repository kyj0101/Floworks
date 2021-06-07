package com.kh.floworks.alarm.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.floworks.alarm.model.service.AlarmService;
import com.kh.floworks.alarm.model.vo.Alarm;
import com.kh.floworks.alarm.model.vo.AlarmYN;
import com.kh.floworks.approval.model.vo.Approval;
import com.kh.floworks.approval.model.vo.ApvlDoc;
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
		
		socketHandlerForAlarm.afterInsertAlarm(alarm.getToId());
		
		
	}

	public void alarmYNToss(String[] information) {
		alarmYN.setYN("Y");
		alarmYN.setToId(information[0]);
		alarmYN.setAlarmLink(information[1]);
		
		alarmService.changeView(alarmYN);
		
	}
	
	public void approvalAlarmToss() {
		
	}

	public void apvlDoctoss(ApvlDoc apvlDoc) throws Exception {
		//approval/apvlProgressDetail?apvlId=z123_1622988260811
		String alarmLink = "approval/apvlProgressDetail?apvlId="+apvlDoc.getApvlId();
		
		log.info("\n\n\n\napvlDoc을 collector에서 받아왔어요, apvlDoc={}\n\n\n\n",apvlDoc);
		
		List<String> approvers = new ArrayList<>();
		if(apvlDoc.getApprover1() !=null) {
			approvers.add(apvlDoc.getApprover1());
		}
		if(apvlDoc.getApprover2() !=null) {
			approvers.add(apvlDoc.getApprover2());
		}
		
		if(apvlDoc.getApprover3() !=null) {
			approvers.add(apvlDoc.getApprover3());
		}
		
		if(apvlDoc.getApprover4() !=null) {
			approvers.add(apvlDoc.getApprover4());
		}
		
		for(int i=0;i<approvers.size();i++) {
			alarm.setFromId(apvlDoc.getApvlId().split("_")[0]);
			alarm.setToId(approvers.get(i));
			
			alarm.setAlarmTime(null);
			alarm.setTitle(apvlDoc.getTitle());
			alarm.setCategory("approval");
			alarm.setIsChecked('N');
			alarm.setAlarmLink(alarmLink);
			
			System.out.println("\n\n\n\n");
			log.info("alarm = {}",alarm);
			System.out.println("\n\n\n\n\n");
			int result = alarmService.insertAlarm(alarm);
			if(result>0) {
				socketHandlerForAlarm.afterInsertAlarm(alarm.getToId());
			}
		}
		
		System.out.println("\n\n\n\n-----------------approval insert complete!---------------\n\n\n\n");
		
	}


	public void approvalResult(String fromId,String comment,String yn, String apvlId) throws Exception {
		//approval/apvlProgressDetail?apvlId=" + apvlId;
		String alarmLink = "approval/apvlProgressDetail?apvlId="+ apvlId;
		
		alarm.setFromId(fromId);
		alarm.setToId(apvlId.split("_")[0]);
		alarm.setAlarmTime(null);
		if(yn.equals("y")) {
			alarm.setTitle("Your Approval ("+apvlId+") is accepted by"+fromId);
		}
		else {
			alarm.setTitle("Your Approval ("+apvlId+") is rejected by"+fromId);	
		}
		alarm.setCategory("approval_progress");
		alarm.setIsChecked('N');
		alarm.setAlarmLink(alarmLink);
		
		System.out.println("\n\n\n\n");
		log.info("alarm = {}",alarm);
		System.out.println("\n\n\n\n\n");
		
		alarmService.insertAlarm(alarm);
		
		System.out.println("\n\n\n\n-----------------approval progress alarm insert complete!---------------\n\n\n\n");
		
		socketHandlerForAlarm.afterInsertAlarm(alarm.getToId());
	}


	
}
