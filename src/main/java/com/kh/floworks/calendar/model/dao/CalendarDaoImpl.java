package com.kh.floworks.calendar.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.calendar.model.vo.Calendar;

@Repository
public class CalendarDaoImpl implements CalendarDao{

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertCal(Map<String, String> param) {
		return session.insert("calendar.insertCal",param);
//	public int insertCal(Map<String, Object> calendarDate) {
//		return session.insert("calendar.insertCal",calendarDate);
	
	}

	@Override
	public List<Calendar> selectListCalendar(String id) {
		return session.selectList("calendar.selectListCalendar", id);
	}

	
	
}
