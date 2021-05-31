package com.kh.floworks.alarm.model.service;

import java.util.List;

import com.kh.floworks.alarm.model.vo.Alarm;

public interface AlarmService {

	int insertAlarm(Alarm alarm);
	
	List<Alarm> selectAlarmList(String id);
	
	
}
