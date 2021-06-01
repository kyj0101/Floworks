package com.kh.floworks.calendar.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.floworks.calendar.model.dao.CalendarDao;
import com.kh.floworks.calendar.model.vo.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	private CalendarDao calendarDao;

	@Override
	public int insertCal(String dateList) {
		return calendarDao.insertCal(dateList);
	}

	
}
