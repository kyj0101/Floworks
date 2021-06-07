package com.kh.floworks.alarm.model.service;

import java.util.List;

import com.kh.floworks.alarm.model.vo.Alarm;
import com.kh.floworks.alarm.model.vo.AlarmYN;
import com.kh.floworks.email.model.vo.Email;

public interface AlarmService {

	int insertAlarm(Alarm alarm);
	
	List<Alarm> selectAlarmList(String id);

	int changeView(AlarmYN alarmYN);

	String selectimgLoad(String payload);

}
