package com.kh.floworks.alarm.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.floworks.alarm.model.dao.AlarmDao;
import com.kh.floworks.alarm.model.vo.Alarm;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AlarmServiceImpl implements AlarmService{
	
	@Autowired
	AlarmDao alarmDao;
	
	@Override
	public int insertAlarm(Alarm alarm) {
		return alarmDao.insertAlarm(alarm);
	}

	@Override
	public List<Alarm> selectAlarmList(String id) {
		System.out.println("alarmservice���");
		return alarmDao.selectAlarmList(id);
	}

}