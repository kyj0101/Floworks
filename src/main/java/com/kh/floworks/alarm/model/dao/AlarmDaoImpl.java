package com.kh.floworks.alarm.model.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.alarm.model.vo.Alarm;

@Repository
public class AlarmDaoImpl implements AlarmDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public int insertAlarm(Alarm alarm) {
		return session.insert("alarm.insertAlarm",alarm);
	}

	@Override
	public List<Alarm> selectAlarmList(String id) {
		System.out.println("Dao������ �� session���� ��������");
		return session.selectList("alarm.selectList",id);
	}


}
