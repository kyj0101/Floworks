package com.kh.floworks.calendar.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.calendar.model.vo.Calendar;

@Repository
public class CalendarDaoImpl implements CalendarDao{

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Calendar> selectListCalendar(String id) {
		return session.selectList("calendar.selectListCalendar", id);
	}

	@Override
	public int insertCalendar(Calendar cal) {
		return session.insert("calendar.insertCalendar", cal);
	}

	@Override
	public int updateCalendar(Calendar cal) {
		return session.update("calendar.updateCalendar",cal);
	}

	@Override
	public int deleteCalendar(int no) {
		return session.delete("calendar.deleteCalendar",no);
	}

	
	
}
