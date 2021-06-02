package com.kh.floworks.alarm.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.alarm.model.vo.Alarm;
import com.kh.floworks.alarm.model.vo.AlarmYN;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AlarmDaoImpl implements AlarmDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertAlarm(Alarm alarm) {
		return session.insert("alarm.insertAlarm",alarm);
	}

	@Override
	public List<Alarm> selectAlarmList(String id) {
		return session.selectList("alarm.selectList",id);
	}
	
	@Override
	public int changeView(AlarmYN alarmYN) {
		
		log.info("\n\n\n\n\talarmYN={}\n\n\n\n",alarmYN);
		
		return session.update("alarm.updateAlarm",alarmYN);
	}



}