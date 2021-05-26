package com.kh.floworks.calendar.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.floworks.calendar.model.dao.CalendarDao;

@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	private CalendarDao calendarDao;

	@Override
	public Object showSchedule(Model model) {
		return calendarDao.insertCalendar(model);
	}
}
