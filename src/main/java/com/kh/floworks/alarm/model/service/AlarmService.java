package com.kh.floworks.alarm.model.service;

import java.util.List;

import com.kh.floworks.alarm.model.vo.Alarm;
import com.kh.floworks.email.model.vo.Email;

public interface AlarmService {

	int insertAlarm(Alarm alarm);
	
	List<Alarm> selectAlarmList(String id);

}
