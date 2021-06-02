package com.kh.floworks.calendar.model.service;

import java.util.List;
import java.util.Map;

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
	public int insertCal(Map<String, String> param) {
		return calendarDao.insertCal(param);
	}

//	@Override
//	public int insertCal(Map<String, Object> calendarDate) {
//		
//		int result = 0;
//		Map<String, Object>[] calendarDateArr = (Map<String, Object>)param.get("calendarDateArr");
//		
//		if(calendarDateArr != null) {
//			for(Map<String, Object> calendarDate :calendarDateArr) {
//				result = calendarDao.insertCal(calendarDate);				
//			}
//		}
//		return result;
//	}

	
}
