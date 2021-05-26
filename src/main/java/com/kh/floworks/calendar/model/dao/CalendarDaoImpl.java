package com.kh.floworks.calendar.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

@Repository
public class CalendarDaoImpl implements CalendarDao{

	@Autowired
	private SqlSession session;

	@Override
	public Object insertCalendar(Model model) {
		return session.insert("calendar.insertCalendar", model);
	}
}
