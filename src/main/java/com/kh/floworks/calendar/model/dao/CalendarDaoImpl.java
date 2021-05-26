package com.kh.floworks.calendar.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.floworks.calendar.model.vo.Calendar;

@Repository
public class CalendarDaoImpl implements CalendarDao{

	@Autowired
	private SqlSession session;
	
	private static final String namespace = "com.kh.floworks.calendar.model.vo";

	@Override
	public Object insertCalendar(Model model) {
		return session.insert("calendar.insertCalendar", model);
	}

	@Override
	public List<Calendar> showSchedule(String id) {
		return session.selectList(namespace + ".showSchedule", id);
	}

	@Override
	public void addSchedule(Calendar vo) {
		session.insert(namespace + ".addSchdule", vo);
		
	}
}
