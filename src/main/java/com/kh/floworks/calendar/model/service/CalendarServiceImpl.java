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

//	@Override
//	public Object showSchedule(Model model) {
//		return calendarDao.insertCalendar(model);
//	}
	
	public List<Calendar> showSchedule() throws Exception{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		
		return calendarDao.showSchedule(id);
	}
	
	public void addSchedule(Calendar vo) throws Exception{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		
		vo.setCalendarId(id);
		
		calendarDao.addSchedule(vo);
	}

	@Override
	public Object showSchedule(Model model) {
		// TODO Auto-generated method stub
		return null;
	}
}
