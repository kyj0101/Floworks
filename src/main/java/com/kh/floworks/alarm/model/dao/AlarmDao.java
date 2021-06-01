package com.kh.floworks.alarm.model.dao;

import java.util.List;

import com.kh.floworks.alarm.model.vo.Alarm;

public interface AlarmDao {

	int insertAlarm(Alarm alarm);

	List<Alarm> selectAlarmList(String id);

}
