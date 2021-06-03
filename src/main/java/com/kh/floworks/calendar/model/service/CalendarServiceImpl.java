package com.kh.floworks.calendar.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.floworks.calendar.model.dao.CalendarDao;
import com.kh.floworks.calendar.model.vo.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	private CalendarDao calendarDao;

	@Override
	public List<Calendar> selectListCalendar(String id) {
		return calendarDao.selectListCalendar(id);
	}

	@Override
	public int insertCalendar(Calendar cal) {
		return calendarDao.insertCalendar(cal);
	}

}
